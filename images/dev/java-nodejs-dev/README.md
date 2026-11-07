# java-nodejs-dev

**The back end and the front end. One image.**

`bsantanna/java-nodejs-dev` puts Node.js 26 and Java 25 in the same container — so the API and the web app build in the same place, with the same tools, every time.

## Run it

```sh
docker run -it --rm -v "$PWD:/workspace" -w /workspace bsantanna/java-nodejs-dev
```

Install and build in one line:

```sh
docker run --rm -v "$PWD:/workspace" -w /workspace bsantanna/java-nodejs-dev \
  bash -c "npm ci && npm run build"
```

Serve a dev server to your machine:

```sh
docker run -it --rm -p 3000:3000 -v "$PWD:/workspace" -w /workspace bsantanna/java-nodejs-dev npm start
```

## What's inside

| | |
|---|---|
| Node.js | 26, with `npm` |
| Runtime | Eclipse Temurin JDK 25 (LTS) |
| Base | [`bsantanna/base`](https://hub.docker.com/r/bsantanna/base) — `git`, `curl`, `jq`, `vim`, `tmux`, build tools |

## Tags

| Tag | Meaning |
|---|---|
| `latest` | The newest release. |
| `YYYY.MM.XX` | A fixed release, e.g. `2026.11.01`. Pin this in production. |

Multi-architecture: `linux/amd64` and `linux/arm64`.

## Source

[github.com/bsantanna/docker-images](https://github.com/bsantanna/docker-images/tree/main/images/dev/java-nodejs-dev)
