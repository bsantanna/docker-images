# base

**Java 25. Every tool you reach for. Nothing you don't.**

`bsantanna/base` is the foundation under every development image in this collection. Eclipse Temurin JDK 25 on Ubuntu 24.04, with the tools you'd install in the first five minutes anyway — already there, already configured.

## Run it

```sh
docker run -it --rm bsantanna/base
```

Bring your project along:

```sh
docker run -it --rm -v "$PWD:/workspace" -w /workspace bsantanna/base
```

## Build on it

```dockerfile
FROM bsantanna/base:latest
RUN apt-get update && apt-get install -y --no-install-recommends <your-packages>
```

## What's inside

| | |
|---|---|
| Runtime | Eclipse Temurin JDK 25 (LTS) |
| OS | Ubuntu 24.04 LTS (Noble) |
| Build | `build-essential`, `git` |
| Everyday | `curl`, `jq`, `vim` (default `$EDITOR`), `tmux`, `openssh-client` |

## Tags

| Tag | Meaning |
|---|---|
| `latest` | The newest release. |
| `YYYY.MM.XX` | A fixed release, e.g. `2026.11.01`. Pin this in production. |

Multi-architecture: `linux/amd64` and `linux/arm64`.

## Source

[github.com/bsantanna/docker-images](https://github.com/bsantanna/docker-images/tree/main/images/base)
