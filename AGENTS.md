# AGENTS.md

This file is the vendor-neutral coordination contract for AI tooling in this repository.

## Source of Truth

This file is the canonical, vendor-neutral source of truth for shared behavior, domain knowledge, and coordination policy in this repository.

Vendor-specific directories are adapters derived from it, never the source of truth. When present:
- `.claude/CLAUDE.md` — Claude Code adapter; MUST defer to this file.
- `.claude/skills/*/SKILL.md` — tool-scoped skill implementations of shared intent declared here.
- `.mcp.json` — shared MCP server configuration.

No adapter is currently checked in. Add one only when a tool needs mechanics this file cannot express.

Adapters MUST NOT redefine shared rules. Tool-local files such as `.claude/settings.local.json` are not part of the shared contract.

## Cross-Tool Rules

- Keep shared behavior and domain knowledge in this file. Adapters reference it; they do not restate it.
- Treat vendor-specific directories such as `.codex/` as generated or adapter layers.
- Use progressive context loading. Do not preload every skill or specialty document by default.
- When the user asks for a specific specialty such as `docker`, `ci`, `security`, or `images`, load only the matching adapter context for the active tool.
- If the user uses slash-like syntax such as `/docker`, interpret that as an intent to activate the corresponding specialty, even if the current CLI does not support custom slash commands natively.
- Prefer the active tool's native mechanisms for scoped instructions, custom agents, prompts, or subagents instead of forcing another vendor's UX model.

## Subagent Orchestration

Cap concurrent subagents at **4 per fan-out wave**. This is a hard limit, counted across nested subagents; excess work MUST queue into a later wave instead of raising the cap.

Rationale: beyond four parallel workers, slices stop being independently verifiable — Docker build-context overlap, duplicated base-image pulls, and review load grow faster than throughput.

Rules:

- Spawn only for genuinely independent slices: disjoint image directories, no shared Dockerfile, no shared CI job, no sequential dependency. A shared prerequisite (for example, rebuilding `images/base`) MUST be resolved inline or split into sequenced waves.
- Prefer 2-3 subagents. Do the work in-session when it is a single Dockerfile, a tag-only change, or needs conversation context the subagent cannot see.
- NEVER fan out for exploration that one or two reads can answer.
- Assign one integration owner per shared file. Sibling subagents MUST NOT edit the same file.
- Give every subagent its complete slice: target image directory, base-image tag, runtime contract, and acceptance check (the image builds and the expected command runs).
- Dispatch all independent tasks in one batch; NEVER spawn-wait-spawn.
- Collect results once. NEVER poll.
- A subagent MAY spawn its own workers only when its slice requires it; nested fan-out counts against the same cap of 4.
- Run builds and smoke checks once after the wave, not per subagent. There is no test suite or linter to run.
- If a tool exposes a max-concurrency setting, set it to 4. If it does not, enforce the cap by dispatching in waves.

## Image Architecture and Boundaries

This repository publishes public images under the `bsantanna/*` namespace on Docker Hub. Image names, tags, and entrypoints are consumer-facing contracts.

- `images/base` is the shared generic base (JDK plus common CLI tooling). Keep it generic; tool-specific packages belong in the derived image.
- Derived images build from the published `bsantanna/<parent>:latest` tag, matching the existing pattern. Images that wrap an upstream project directly (`keycloak`, `cloudnative-pg-vector`) build from that upstream instead.
- Do not add application code or product-specific services here. These are environment and tooling layers.
- Renaming or removing an image or published tag is a breaking change; update the Dockerfile, CI, and README index in the same change.

Build graph:

```text
images/base
├── images/dev/maven-build
├── images/dev/java-ruby-dev
│   └── images/dev/chef-dev
├── images/dev/java-python-dev
│   ├── images/dev/pgcli
│   └── images/compute/document-utils
├── images/dev/java-nodejs-dev
├── images/servers/smb
├── images/servers/nginx-static
└── images/servers/nginx-ssl-proxy

images/servers/keycloak               (independent; no CI job)
images/servers/cloudnative-pg-vector  (independent)
```

## Adapter Policy

- Root `AGENTS.md` is canonical. Adapters are derived from it and MUST reference it rather than restating shared rules.
- Tool-specific behavior belongs in the matching adapter directory, limited to mechanics, defaults, and native surface mapping.
- If a tool cannot support a feature directly, approximate it with the closest native mechanism instead of copying another vendor's surface API.
- After updating shared intent in this file, propagate the change to every adapter that depends on it.
- Precedence on conflict: direct user instructions override this file; this file overrides adapter files. An adapter MAY add tool-specific mechanics but MUST NOT relax the cap of 4 or contradict the cross-tool rules.

## Project Overview

Docker image collection for research and professional development: Agile/Lean software development, DevOps, data science, Kubernetes, enterprise Linux, cloud computing, IoT/Raspberry Pi, finance, and machine learning.

| Image directory | Published image | Base |
|---|---|---|
| `images/base` | `bsantanna/base` | `eclipse-temurin:25-jdk-noble` |
| `images/dev/maven-build` | `bsantanna/maven-build` | `bsantanna/base:latest` |
| `images/dev/java-ruby-dev` | `bsantanna/java-ruby-dev` | `bsantanna/base:latest` |
| `images/dev/java-python-dev` | `bsantanna/java-python-dev` | `bsantanna/base:latest` |
| `images/dev/java-nodejs-dev` | `bsantanna/java-nodejs-dev` | `bsantanna/base:latest` |
| `images/dev/chef-dev` | `bsantanna/chef-dev` | `bsantanna/java-ruby-dev:latest` |
| `images/dev/pgcli` | `bsantanna/pgcli` | `bsantanna/java-python-dev:latest` |
| `images/compute/document-utils` | `bsantanna/compute-document-utils` | `bsantanna/java-python-dev:latest` |
| `images/servers/smb` | `bsantanna/smb` | `bsantanna/base:latest` |
| `images/servers/nginx-static` | `bsantanna/nginx-static` | `bsantanna/base:latest` |
| `images/servers/nginx-ssl-proxy` | `bsantanna/nginx-ssl-proxy` | `bsantanna/base:latest` |
| `images/servers/keycloak` | `bsantanna/keycloak` | `quay.io/keycloak/keycloak` (via `ARG KEYCLOAK_VERSION`) |
| `images/servers/cloudnative-pg-vector` | `bsantanna/cloudnative-pg-vector` | `ghcr.io/cloudnative-pg/postgresql:17.4` |

CI lives in `.github/workflows/docker-image.yml`. It builds and pushes multi-architecture images (`linux/amd64,linux/arm64`) to Docker Hub on pushes and pull requests targeting `main`. Most images publish `latest`, `x86_64`, `amd64`, and `arm64`; `cloudnative-pg-vector` publishes the upstream version tag `17.4`.

There is no test suite or linter. Verification is a real `docker build` plus a runtime smoke check of the changed image.

## Commands

Build the shared base first. Child Dockerfiles reference `bsantanna/base:latest`, so tagging the local build with that name makes children use your local base instead of the published one. This overwrites the local tag only; it does not push to Docker Hub.

```bash
docker build -t bsantanna/base:latest images/base
docker build -t bsantanna/java-python-dev:latest images/dev/java-python-dev
```

Build an independent image:

```bash
docker build -t bsantanna/keycloak:local images/servers/keycloak
docker build -t bsantanna/cloudnative-pg-vector:local images/servers/cloudnative-pg-vector
```

Smoke checks after building:

```bash
docker run --rm bsantanna/base:latest bash -c 'java -version && git --version'
docker run --rm bsantanna/java-python-dev:latest python --version
docker run --rm bsantanna/pgcli:latest pgcli --version
docker run --rm bsantanna/nginx-static:latest nginx -t
docker run --rm bsantanna/compute-document-utils:latest bash -c 'command -v libreoffice pdftoppm'
docker run --rm bsantanna/keycloak:local --version
docker run --rm --entrypoint bash bsantanna/cloudnative-pg-vector:local -c 'ls /usr/share/postgresql/17/extension/vector.control'
```

Local multi-architecture build (requires buildx):

```bash
docker buildx build --platform linux/amd64,linux/arm64 images/base
```

CI is authoritative for multi-architecture output; a plain local build proves only the host architecture.

## Dockerfile Conventions

Match the existing style. Do not reformat untouched files.

- Use `FROM bsantanna/<parent>:latest` for derived images, or the pinned upstream image for images that wrap an upstream project.
- Add `LABEL org.opencontainers.image.authors="bruno@btech.software"` on images built from a `bsantanna` base, matching the existing files.
- Set `ENV REFRESHED_AT=<YYYY-MM-DD>` as a cache-buster and update it in every image you change. Do not bump untouched images.
- Keep package installation in one `RUN`: `apt-get update -qq`, `apt-get install -yqq --no-install-recommends`, then `apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*`.
- Use `ADD` for repository-local scripts and configuration, matching the existing files. Do not convert untouched `ADD` instructions to `COPY`.
- Keep `CMD` and `ENTRYPOINT` in exec form where they are already present.
- Pin upstream versions with `ARG` when wrapping a versioned upstream (the keycloak pattern). Do not introduce pinning elsewhere unless asked.
- Shell scripts are Bash with `#!/bin/bash` or `#!/usr/bin/env bash`; stdin-driven helpers stay stdin-driven.
- `.editorconfig`: 2-space indentation, LF line endings, UTF-8, final newline. Markdown may keep trailing whitespace.

## CI and Publishing

- Workflow jobs build and push on both `push` and `pull_request` to `main`; a PR run is still a publish.
- Adding an image requires a job with `context` and `file` pointing at that image directory, `needs` matching the build graph, `platforms: linux/amd64,linux/arm64`, and tags `latest`, `x86_64`, `amd64`, `arm64` (or the upstream version tag for pinned images).
- Known trap: `build_pgcli` uses `context: images/dev/chef-dev` with `file: images/dev/pgcli/Dockerfile`. It builds today because that Dockerfile has no context-relative `ADD`/`COPY`. Fix the context before adding one.
- `images/servers/keycloak` has no CI job and is not published by the workflow. Add a job if it should be.
- The workflow requires the `DOCKER_USERNAME` and `DOCKER_PASSWORD` repository secrets.
- Do not publish `:latest` from a local build unless intended; local tags are scratch.

## Documentation

`README.md` and `images/README.md` are the user-facing image index. Update them when adding, removing, or renaming an image, or changing published tags. The index MUST list every image directory.

## General Guidelines

1. Before writing any code, describe your approach. Wait for approval when the change is non-trivial or requirements are ambiguous; for a trivial single-file fix, proceed.
2. If requirements are ambiguous, ask clarifying questions before writing any code.
3. After writing any code, list build and runtime edge cases and suggest smoke checks: architecture, base-tag drift, cache busting, entrypoint behavior, volumes and permissions.
4. If a task requires changes to more than 3 files, stop and break it into smaller tasks first.
5. When there is a bug, reproduce it first with a failing `docker build` or a failing runtime command, then fix it until the reproduction passes.
6. Every time the user corrects you, reflect on what you did wrong and form a plan to never repeat that mistake.

## Behavioral Guidelines

**Tradeoff:** These guidelines bias toward caution over speed. For trivial tasks, use judgment.

### 1. Think Before Coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:
- State assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them — don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

### 2. Simplicity First

**Minimum change that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If a Dockerfile grows by 200 lines when 50 would do, rewrite it.

Ask: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

### 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing files:
- Don't "improve" adjacent instructions, comments, or formatting.
- Don't refactor images that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead files or stale tags, mention it — don't delete it.

When your changes create orphans:
- Remove packages, scripts, configuration, and CI tags that YOUR change made unused.
- Don't remove pre-existing unused content unless asked.

The test: every changed line traces directly to the user's request.

### 4. Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:
- "Add a tool to an image" → "Build the image and run the tool's version or help command in the container."
- "Fix a build failure" → "Reproduce the failing `docker build`, then make it pass."
- "Upgrade the base image" → "Build the base and every dependent image the workflow builds."
- "Change an entrypoint" → "Build the image and run the container's documented command."

For multi-step tasks, state a brief plan:

```text
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

Strong success criteria let you loop independently. Weak criteria ("make it work") require constant clarification.
