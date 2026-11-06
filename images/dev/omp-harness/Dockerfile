FROM bsantanna/base:latest
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2026-11-06
ENV HOME=/home/omp

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# bubblewrap backs the vendored security-audit sandbox; perl is required by
# omp-config/import.sh for the __OMP_HOME__ rewrite.
RUN apt-get update -qq && \
    apt-get install -yqq --no-install-recommends bubblewrap perl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install the latest stable omp harness as a prebuilt binary.
RUN curl -fsSL --retry 3 https://omp.sh/install | PI_INSTALL_DIR=/usr/local/bin sh -s -- --binary

# Use omp's embedded Bun as the bun runtime and as a node-compatible shim for
# the vendored security-audit validators.
RUN printf '%s\n' \
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
    chmod 755 /usr/local/bin/node

# Runtime user (UID/GID 10001) and workspace. The omp group can write
# /usr/local/bin so `omp update` can replace its own binary.
RUN groupadd --gid 10001 omp && \
    useradd --create-home --uid 10001 --gid omp --shell /bin/bash omp && \
    mkdir -p /home/omp/workspace && \
    chown -R omp:omp /home/omp && \
    chgrp omp /usr/local/bin && \
    chmod 775 /usr/local/bin

USER omp

# Clone and import the public config as omp, record the unpinned inputs, then
# remove the build-only clone in the same layer. import.sh warns and skips
# missing keys when stdin is /dev/null. docker run supplies LAN_LLM_API_KEY
# and LANGFUSE_API_KEY through the process environment.
RUN git clone --depth 1 https://github.com/bsantanna/omp-config.git /home/omp/.omp-src && \
    bash /home/omp/.omp-src/import.sh /home/omp/.omp < /dev/null && \
    omp --version > /home/omp/.omp-build.txt && \
    git -C /home/omp/.omp-src rev-parse HEAD >> /home/omp/.omp-build.txt && \
    rm -rf /home/omp/.omp-src

WORKDIR /home/omp/workspace
VOLUME ["/home/omp/workspace"]

ENTRYPOINT ["omp"]
