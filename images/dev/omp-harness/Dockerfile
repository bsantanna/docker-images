# Build stage: fetch the omp binary and import the public config. Only the
# binary and the resulting omp home are copied out, so the git clone and the
# bun install cache (~100MB) never reach the final image.
FROM bsantanna/base:latest AS build
ENV HOME=/home/omp

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install the latest stable omp harness as a prebuilt binary, then import the
# config into /home/omp/.omp: import.sh rewrites __OMP_HOME__ to the parent of
# its target, so the build path must match the runtime home. import.sh warns
# and skips missing keys when stdin is /dev/null; perl comes with the base.
RUN curl -fsSL --retry 3 https://omp.sh/install | PI_INSTALL_DIR=/usr/local/bin sh -s -- --binary && \
    git clone --depth 1 https://github.com/bsantanna/omp-config.git /tmp/omp-config && \
    bash /tmp/omp-config/import.sh /home/omp/.omp < /dev/null && \
    omp --version > /home/omp/.omp-build.txt && \
    git -C /tmp/omp-config rev-parse HEAD >> /home/omp/.omp-build.txt

# uv stage: the official uv image only ships the uv and uvx binaries.
FROM ghcr.io/astral-sh/uv:latest AS uv

# Python stage: uv installs a standalone CPython under /opt/uv; --default also
# links python, python3 and python3.13 into UV_PYTHON_BIN_DIR. omp's eval tool
# needs a python on PATH, which the slim runtime does not have.
FROM debian:trixie-slim AS python
ENV UV_PYTHON_INSTALL_DIR=/opt/uv/python
ENV UV_PYTHON_BIN_DIR=/opt/uv/bin
COPY --from=uv /uv /uvx /usr/local/bin/
RUN uv python install 3.13 --default

# Runtime stage: omp only needs glibc, so a slim Debian replaces the JDK base.
FROM debian:trixie-slim
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2026-11-07
ENV DEBIAN_FRONTEND=noninteractive
ENV EDITOR=vim
ENV HOME=/home/omp
ENV UV_PYTHON_INSTALL_DIR=/opt/uv/python
ENV UV_PYTHON_BIN_DIR=/opt/uv/bin
ENV UV_PYTHON_PREFERENCE=only-managed
ENV PATH=/opt/uv/bin:$PATH

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# CLI tools for the agent: git, curl, jq, ssh, tmux, vim. bubblewrap backs the
# vendored security-audit sandbox. omp's embedded Bun is
# exposed as the bun runtime and as a node-compatible shim for the vendored
# security-audit validators. Runtime user (UID/GID 10001) and workspace; the
# omp group can write /usr/local/bin so `omp update` can replace its binary.
RUN apt-get update -qq && \
    apt-get install -yqq --no-install-recommends bubblewrap ca-certificates curl git jq openssh-client tmux vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    printf '%s\n' \
    '#!/bin/sh' \
    'exec env BUN_BE_BUN=1 omp "$@"' \
    > /usr/local/bin/bun && \
    chmod 755 /usr/local/bin/bun && \
    printf '%s\n' \
    '#!/bin/sh' \
    'if [ "$#" -eq 1 ] && { [ "$1" = "--version" ] || [ "$1" = "-v" ]; }; then' \
    '    exec env BUN_BE_BUN=1 omp -e "console.log(process.version)"' \
    'fi' \
    'exec env BUN_BE_BUN=1 omp "$@"' \
    > /usr/local/bin/node && \
    chmod 755 /usr/local/bin/node && \
    groupadd --gid 10001 omp && \
    useradd --create-home --uid 10001 --gid omp --shell /bin/bash omp && \
    mkdir -p /home/omp/workspace && \
    chown -R omp:omp /home/omp && \
    chgrp omp /usr/local/bin && \
    chmod 775 /usr/local/bin

# docker run supplies LAN_LLM_API_KEY and LANGFUSE_API_KEY through the process environment.
COPY --from=build /usr/local/bin/omp /usr/local/bin/omp
COPY --from=build --chown=omp:omp /home/omp/.omp /home/omp/.omp
COPY --from=build --chown=omp:omp /home/omp/.omp-build.txt /home/omp/.omp-build.txt
# uv plus its managed Python; omp owns /opt/uv so the agent can add versions.
COPY --from=uv /uv /uvx /usr/local/bin/
COPY --from=python --chown=omp:omp /opt/uv /opt/uv

USER omp
WORKDIR /home/omp/workspace
VOLUME ["/home/omp/workspace"]

ENTRYPOINT ["omp"]
