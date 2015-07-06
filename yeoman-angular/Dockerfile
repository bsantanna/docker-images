FROM ubuntu:15.04
MAINTAINER Bruno Sant'Anna "mail@bsantanna.me"
ENV REFRESHED_AT 2015-06-15

# Install NodeJS
RUN apt-get update -qq && apt-get install -qqy nodejs npm

# Install Yeoman
RUN npm install -g grunt-cli bower yo generator-karma generator-angular
