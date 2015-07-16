FROM java:7
MAINTAINER Bruno Sant'Anna "mail@bsantanna.me"
ENV REFRESHED_AT 2015-07-16

ENV MAIN_CLASS Main

RUN apt-get update -qq && apt-get install -qqy libusb-1.0-0-dev

RUN mkdir /environment

ADD lib/ /environment/lib/
ADD code/ /environment/code/

RUN ["javac", "-classpath", "/environment/lib/finch.jar", "/environment/code/Main.java"]

WORKDIR /environment

CMD ["java", "-Djava.library.path=.", "-classpath", "lib/finch.jar:lib/jnaerator-0.9.5.jar:code/", "Main"]
