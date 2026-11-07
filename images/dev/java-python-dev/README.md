# java-python-dev

**Java and Python. Data tools included.**

`bsantanna/java-python-dev` pairs Java 25 with Python 3.12 and the libraries data and platform work depends on — pandas, NumPy, the Elasticsearch client and HashiCorp Vault — installed and ready the moment the container starts.

## Run it

```sh
docker run -it --rm -v "$PWD:/workspace" -w /workspace bsantanna/java-python-dev
```

Run a script directly:

```sh
docker run --rm -v "$PWD:/workspace" -w /workspace bsantanna/java-python-dev python main.py
```

## Ready to import

`python` and `pip` point to a virtual environment at `/opt/venv`, so `pip install` just works — no `--break-system-packages`, no surprises.

| Package | For |
|---|---|
| `pandas`, `numpy` | Data analysis |
| `elasticsearch`, `eland` | Elasticsearch, including DataFrames and ML models |
| `hvac` | HashiCorp Vault |
| `requests`, `requests-oauthlib` | HTTP and OAuth |

SciPy is installed for the system interpreter at `/usr/bin/python3`.

## What's inside

| | |
|---|---|
| Python | 3.12, with `pip` and `venv` |
| Runtime | Eclipse Temurin JDK 25 (LTS) |
| Base | [`bsantanna/base`](https://hub.docker.com/r/bsantanna/base) — `git`, `curl`, `jq`, `vim`, `tmux`, build tools |

## Tags

| Tag | Meaning |
|---|---|
| `latest` | The newest release. |
| `YYYY.MM.XX` | A fixed release, e.g. `2026.11.01`. Pin this in production. |

Multi-architecture: `linux/amd64` and `linux/arm64`.

## Source

[github.com/bsantanna/docker-images](https://github.com/bsantanna/docker-images/tree/main/images/dev/java-python-dev)
