FROM bsantanna/openjdk-8-jdk
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2016-12-29
ENV DATABASE_DRIVER mysql-connector-java-5.1.26
ENV JIRA_BINARY atlassian-jira-6.4.6-x64.bin

ADD https://www.atlassian.com/software/jira/downloads/binary/${JIRA_BINARY} /opt/
ADD http://dev.mysql.com/get/Downloads/Connector-J/${DATABASE_DRIVER}.tar.gz /tmp/
ADD jira_install.varfile /opt/

RUN chmod a+x /opt/${JIRA_BINARY}
RUN /opt/${JIRA_BINARY} -q -varfile /opt/jira_install.varfile
RUN rm /opt/${JIRA_BINARY}

RUN tar -zxf /tmp/${DATABASE_DRIVER}.tar.gz -C /tmp/
RUN mv /tmp/${DATABASE_DRIVER}/${DATABASE_DRIVER}-bin.jar /opt/atlassian/jira/lib/
RUN rm -fr /tmp/${DATABASE_DRIVER}*

CMD ["/opt/atlassian/jira/bin/start-jira.sh", "-fg"]

EXPOSE 8080
