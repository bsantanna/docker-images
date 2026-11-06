FROM bsantanna/java-python-dev:latest
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2026-11-06


RUN apt-get update -qq && \
    apt-get install -yqq --no-install-recommends \
        libreoffice-writer libreoffice-impress libreoffice-core libreoffice-java-common \
        poppler-utils python3-requests-futures && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY convert_to_pdf.sh /usr/local/bin/convert_to_pdf
COPY extract_images.sh /usr/local/bin/extract_images
