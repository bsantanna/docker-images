FROM bsantanna/java-python-dev:latest
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2025-02-15


RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1 && \
    update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1 && \
    apt-get update -qq && \
    apt-get install -yqq --no-install-recommends libreoffice libreoffice-java-common poppler-utils python3-requests-futures && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD convert_to_pdf.sh /usr/local/bin/convert_to_pdf
ADD extract_images.sh /usr/local/bin/extract_images
