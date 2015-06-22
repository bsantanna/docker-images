FROM ubuntu:14.04
MAINTAINER Bruno Sant'Anna "mail@bsantanna.me"
ENV REFRESHED_AT 2015-06-22

#ADD atlassian-jira-6.4.6-x64.bin /opt/

ADD https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-6.4.6-x64.bin /opt/

ADD jira_install.varfile /opt/

RUN chmod a+x /opt/atlassian-jira-6.4.6-x64.bin
RUN /opt/atlassian-jira-6.4.6-x64.bin -q -varfile /opt/jira_install.varfile

CMD ["/opt/atlassian/jira/bin/start-jira.sh", "-fg"]

EXPOSE 8080
