FROM bsantanna/ubuntu
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2018-11-25
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q && \
    apt-get install -yqq curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV DISTRIBUTION_URL "https://secure.btech.software/repo/jdk/11/openjdk-11-linux-amd64.tar.gz"
RUN mkdir -p ${JAVA_HOME}
RUN curl -o /tmp/pkg.tar.gz ${DISTRIBUTION_URL} && \
    cd /tmp && tar -zxf pkg.tar.gz && mv $(ls . | grep jdk)/* ${JAVA_HOME} && \
    rm -fr /tmp/pkg* && rm -fr /tmp/jdk*

CMD ${JAVA_HOME}/bin/java -version
