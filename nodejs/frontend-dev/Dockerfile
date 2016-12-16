FROM bsantanna/openssh-client
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2016-12-16

RUN apt-get update -qq && apt-get install -y nodejs npm ruby ruby-dev libpng-dev libjpeg-dev gifsicle nasm autoconf git
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g gulp bower
RUN gem install compass

RUN mkdir /opt/frontend-dev
ONBUILD ADD ./entrypoint.sh /opt/frontend-dev/entrypoint.sh
ONBUILD RUN chmod +x /opt/frontend-dev/entrypoint.sh

ENV WORKSPACE_DIR /opt/workspace
RUN mkdir ${WORKSPACE_DIR}
WORKDIR ${WORKSPACE_DIR}
VOLUME ["${WORKSPACE_DIR}"]

EXPOSE 3000 3001 3002 3030

ENTRYPOINT ["/opt/frontend-dev/entrypoint.sh"]
