FROM eclipse-temurin:22-jdk-noble
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2024-12-29
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -qq && \
    apt install -yqq ca-certificates && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["bash"]
