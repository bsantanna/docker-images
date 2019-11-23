FROM bsantanna/alpine
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2018-08-20
ENV REFRESHED_AT 2019-06-07
ENV DOCKER_CHANNEL stable
ENV DOCKER_VERSION 18.09.6
ENV JENKINS_HOME /opt/jenkins/data
ENV JENKINS_AGENT_VERSION 3.30
ENV WORKSPACE_DIR /opt/jenkins/data/workspace

RUN apk --update add --no-cache --virtual \
    build-deps bash ca-certificates curl gcc git iptables libffi-dev libc-dev make openssl-dev openssh-client py-pip python-dev

# src: https://github.com/docker-library/docker
RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		x86_64) dockerArch='x86_64' ;; \
		armhf) dockerArch='armel' ;; \
		aarch64) dockerArch='aarch64' ;; \
		ppc64le) dockerArch='ppc64le' ;; \
		s390x) dockerArch='s390x' ;; \
		*) echo >&2 "error: unsupported architecture ($apkArch)"; exit 1 ;;\
	esac; \
	\
	if ! wget -O docker.tgz "https://download.docker.com/linux/static/${DOCKER_CHANNEL}/${dockerArch}/docker-${DOCKER_VERSION}.tgz"; then \
		echo >&2 "error: failed to download 'docker-${DOCKER_VERSION}' from '${DOCKER_CHANNEL}' for '${dockerArch}'"; \
		exit 1; \
	fi; \
	\
	tar --extract \
		--file docker.tgz \
		--strip-components 1 \
		--directory /usr/local/bin/ \
	; \
	rm docker.tgz; \
	\
	dockerd --version; \
	docker --version


RUN pip install docker-compose

ADD jenkins.sh /usr/local/bin/jenkins
ADD jenkins-agent.sh /usr/local/bin/jenkins-agent
ADD modprobe.sh /usr/local/bin/modprobe
RUN chmod +x /usr/local/bin/jenkins
RUN chmod +x /usr/local/bin/jenkins-agent
RUN chmod +x /usr/local/bin/modprobe
RUN echo 'hosts: files dns' > /etc/nsswitch.conf
RUN mkdir -p /usr/share/jenkins
RUN set -eux; \
    wget  -O /usr/share/jenkins/agent.jar \
    https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${JENKINS_AGENT_VERSION}/remoting-${JENKINS_AGENT_VERSION}.jar && \
    chmod 755 /usr/share/jenkins && \
    chmod 644 /usr/share/jenkins/agent.jar

RUN mkdir -p ${JENKINS_HOME}

VOLUME ["${WORKSPACE_DIR}"]
WORKDIR ${JENKINS_HOME}

ENTRYPOINT [ "/usr/local/bin/jenkins" ]
