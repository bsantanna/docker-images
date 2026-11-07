# omp-harness

**A coding agent, ready on arrival.**

`bsantanna/omp-harness` is the [Oh My Pi](https://omp.sh) agent harness, fully configured — agents, skills, plugins and MCP servers already in place. Mount a project, add your keys, and get to work. The agent works in its own container, as its own unprivileged user, and leaves your machine untouched.

## Run it

```sh
docker run -it --rm \
  -e LAN_LLM_API_KEY=... \
  -e LANGFUSE_API_KEY=... \
  -v "$PWD:/home/omp/workspace" \
  bsantanna/omp-harness
```

Arguments go straight to `omp`:

```sh
docker run --rm bsantanna/omp-harness --version
```

## Configuration

| Variable | Purpose |
|---|---|
| `LAN_LLM_API_KEY` | Key for the `lan-llm` model gateway. |
| `LANGFUSE_API_KEY` | Key for the Langfuse MCP server (tracing and prompts). |

The configuration comes from [bsantanna/omp-config](https://github.com/bsantanna/omp-config), baked in at build time. `~/.omp-build.txt` records the exact omp version and config commit.

## Permissions

The agent runs as UID `10001`. Make sure your mounted workspace is writable by that UID.

## What's inside

| | |
|---|---|
| Agent | `omp`, latest stable at build time |
| Python | CPython 3.13 managed by `uv` — `python`, `python3`, `uv`, `uvx` on `PATH`. Add versions with `uv python install 3.12`. |
| JavaScript | `bun` and a `node`-compatible shim, both powered by omp's embedded Bun runtime |
| Sandbox | `bubblewrap` |
| Tools | `git`, `curl`, `jq`, `vim`, `tmux`, `openssh-client` |
| OS | Debian 13 (Trixie), slim |

## Tags

| Tag | Meaning |
|---|---|
| `latest` | The newest release. |
| `YYYY.MM.XX` | A fixed release, e.g. `2026.11.01`. |

Multi-architecture: `linux/amd64` and `linux/arm64`.

## Source

[github.com/bsantanna/docker-images](https://github.com/bsantanna/docker-images/tree/main/images/dev/omp-harness)
