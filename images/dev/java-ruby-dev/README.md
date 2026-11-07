# java-ruby-dev

**Java and Ruby, side by side.**

`bsantanna/java-ruby-dev` brings Ruby 3.2 to the Java 25 toolchain — with headers and compilers in place, so gems with native extensions install on the first try.

## Run it

```sh
docker run -it --rm -v "$PWD:/workspace" -w /workspace bsantanna/java-ruby-dev
```

Run a script directly:

```sh
docker run --rm -v "$PWD:/workspace" -w /workspace bsantanna/java-ruby-dev ruby script.rb
```

## What's inside

| | |
|---|---|
| Ruby | 3.2, with development headers for native gems |
| Runtime | Eclipse Temurin JDK 25 (LTS) |
| Base | [`bsantanna/base`](https://hub.docker.com/r/bsantanna/base) — `git`, `curl`, `jq`, `vim`, `tmux`, build tools |

Looking for Chef? See [`bsantanna/chef-dev`](https://hub.docker.com/r/bsantanna/chef-dev), built on this image.

## Tags

| Tag | Meaning |
|---|---|
| `latest` | The newest release. |
| `YYYY.MM.XX` | A fixed release, e.g. `2026.11.01`. Pin this in production. |

Multi-architecture: `linux/amd64` and `linux/arm64`.

## Source

[github.com/bsantanna/docker-images](https://github.com/bsantanna/docker-images/tree/main/images/dev/java-ruby-dev)
