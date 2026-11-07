# maven-build

**Point it at a project. It builds.**

`bsantanna/maven-build` is Apache Maven 3.9 on Java 25, tuned to run your build in parallel the moment it starts. No local JDK. No local Maven. No "works on my machine."

## Run it

From the root of any Maven project:

```sh
docker run --rm -v "$PWD:/opt/workspace" bsantanna/maven-build
```

That runs `mvn clean install` with 8 threads. Any arguments you pass go straight to Maven:

```sh
docker run --rm -v "$PWD:/opt/workspace" bsantanna/maven-build verify -DskipITs
```

## Fast the second time

Downloaded dependencies are kept in `archive/` inside your project, so every run after the first starts warm. Add `archive/` to your `.gitignore`.

## Configuration

| Variable | Default | Purpose |
|---|---|---|
| `MAVEN_THREAD_COUNT` | `8` | Parallel build threads (`mvn -T`). |
| `JAVA_OPTS` | — | Extra options passed to Maven, e.g. `-Dmaven.test.skip=true`. |

```sh
docker run --rm -e MAVEN_THREAD_COUNT=4 -v "$PWD:/opt/workspace" bsantanna/maven-build package
```

## What's inside

| | |
|---|---|
| Build tool | Apache Maven 3.9.11 (checksum-verified) |
| Runtime | Eclipse Temurin JDK 25 (LTS) |
| Base | [`bsantanna/base`](https://hub.docker.com/r/bsantanna/base) |

## Tags

| Tag | Meaning |
|---|---|
| `latest` | The newest release. |
| `YYYY.MM.XX` | A fixed release, e.g. `2026.11.01`. Pin this in CI. |

Multi-architecture: `linux/amd64` and `linux/arm64`.

## Source

[github.com/bsantanna/docker-images](https://github.com/bsantanna/docker-images/tree/main/images/dev/maven-build)
