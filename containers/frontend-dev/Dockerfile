FROM bsantanna/openssh-client
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2017-08-02
ENV REFRESHED_AT 2018-05-12
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get install -yqq nodejs npm ruby ruby-dev libpng-dev libjpeg-dev libfontconfig1 gifsicle nasm autoconf git
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g grunt-cli gulp bower foundation-cli@2.2.1
RUN gem install compass

RUN mkdir /opt/frontend-dev
ONBUILD ADD ./entrypoint.sh /opt/frontend-dev/entrypoint.sh
ONBUILD RUN chmod +x /opt/frontend-dev/entrypoint.sh

ENV WORKSPACE_DIR /opt/workspace
RUN mkdir ${WORKSPACE_DIR}
RUN useradd dev -d ${WORKSPACE_DIR} -s /bin/bash
WORKDIR ${WORKSPACE_DIR}
VOLUME ["${WORKSPACE_DIR}"]

EXPOSE 3000 3001 9000

ENTRYPOINT ["/opt/frontend-dev/entrypoint.sh"]
