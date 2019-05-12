# Category: Dev

Docker base-images used for general software development.

## [openjdk-8-jdk](openjdk-8-jdk/)

 - Published image: [bsantanna/openjdk-8-jdk](https://hub.docker.com/r/bsantanna/openjdk-8-jdk/)
 
### Description
This image is platform dependent, image build process differs between armhf and x86_64 platforms since java installation directory is different between platforms.
This Docker image uses [openjdk-8-jdk](https://packages.ubuntu.com/bionic/openjdk-8-jdk) package and is used as common ancestor of other JDK dependent images.

---

## [java-dev](java-dev/)

 - Published image: [bsantanna/java-dev](https://hub.docker.com/r/bsantanna/java-dev/)
 
### Description
This image is platform dependent, image is based on [openjdk-8-jdk](openjdk-8-jdk/) and is used as base-image for Java development with [version control clients](https://en.wikipedia.org/wiki/Version_control) and [Maven Build Tool](https://maven.apache.org). 

Following packages are installed:
 - [curl](https://packages.ubuntu.com/bionic/curl)
 - [git](https://packages.ubuntu.com/bionic/git)
 - [git-svn](https://packages.ubuntu.com/bionic/git-svn)
 - [subversion](https://packages.ubuntu.com/bionic/subversion)
 - [maven](https://packages.ubuntu.com/bionic/maven)

---

