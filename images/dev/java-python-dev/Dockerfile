FROM bsantanna/base:latest
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2025-11-01

RUN apt-get update -qq && \
    apt-get install -yqq --no-install-recommends \
        python3 python3-dev python3-pip python3-venv \
        python3-numpy python3-scipy python3-pandas && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 1 && \
    update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1


# Create virtual environment for non-apt packages
RUN python3 -m venv /opt/venv
WORKDIR /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Upgrade pip and install remaining packages
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir eland elasticsearch requests hvac
