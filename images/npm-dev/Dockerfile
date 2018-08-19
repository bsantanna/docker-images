FROM bsantanna/ubuntu-multi:16.04
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2017-08-02
#ENV REFRESHED_AT 2018-05-12
ENV REFRESHED_AT 2018-08-19
ENV DEBIAN_FRONTEND noninteractive
ENV WORKSPACE_DIR /opt/workspace

RUN apt-get update -qq && \
    apt-get install -yqq nodejs npm ruby ruby-dev libpng-dev libjpeg-dev libfontconfig1 gifsicle nasm autoconf git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g grunt-cli gulp bower foundation-cli@2.2.1
RUN gem install compass

RUN mkdir /opt/frontend-dev
ONBUILD ADD ./entrypoint.sh /opt/frontend-dev/entrypoint.sh
ONBUILD RUN chmod +x /opt/frontend-dev/entrypoint.sh

RUN mkdir ${WORKSPACE_DIR}
RUN useradd dev -d ${WORKSPACE_DIR} -s /bin/bash
WORKDIR ${WORKSPACE_DIR}
VOLUME ["${WORKSPACE_DIR}"]

EXPOSE 3000 3001 9000

ENTRYPOINT ["/opt/npm-dev/entrypoint.sh"]
