# pgcli

**PostgreSQL, the way it should feel.**

`bsantanna/pgcli` gives you `pgcli` — the PostgreSQL shell with autocompletion and syntax highlighting — in one command. Nothing to install. Nothing left behind.

## Run it

```sh
docker run -it --rm bsantanna/pgcli pgcli postgresql://user:password@host:5432/dbname
```

Connecting to a database on your own machine:

```sh
docker run -it --rm bsantanna/pgcli pgcli postgresql://user:password@host.docker.internal:5432/dbname
```

Or join the database's Docker network:

```sh
docker run -it --rm --network my-network bsantanna/pgcli pgcli -h postgres -U postgres
```

## What's inside

| | |
|---|---|
| pgcli | 4 — completion for tables, columns and keywords, syntax highlighting, multi-line editing |
| Also included | Python 3.12, Java 25 and the tools from [`bsantanna/java-python-dev`](https://hub.docker.com/r/bsantanna/java-python-dev) |

## Tags

| Tag | Meaning |
|---|---|
| `latest` | The newest release. |
| `YYYY.MM.XX` | A fixed release, e.g. `2026.11.01`. |

Multi-architecture: `linux/amd64` and `linux/arm64`.

## Source

[github.com/bsantanna/docker-images](https://github.com/bsantanna/docker-images/tree/main/images/dev/pgcli)
