# bsantanna/containers [![Build Status](https://secure.btech.software/jenkins/buildStatus/icon?job=containers-pipeline)](https://secure.btech.software/jenkins/job/containers-pipeline/)

- [Introduction](#introduction)
  - [About this project](#about-this-project)
  - [Docker image categories](#docker-image-categories)
  - [Project directory structure](#project-directory-structure)
  - [Author](#author)

# Introduction

Welcome! Here you'll find several different [Dockerfiles](https://docs.docker.com/engine/reference/builder/) that I created the last few years for personal projects.  I use few of them all the time to code, some are very useful for [DevOps](https://en.wikipedia.org/wiki/DevOps) builds, but the most useful ones are in production and they've proved to be manageable. 

## About this project

This project is a collection of base-images used in [apps development with Docker](https://docs.docker.com/develop/), classified by similarity and/or purpose.
A [Jenkins Pipeline](https://jenkins.io/doc/book/pipeline/) daily builds all images and uploads them to [DockerHub](https://hub.docker.com/u/bsantanna/).
Several images were designed with [IoT](https://en.wikipedia.org/wiki/Internet_of_things) as goal and support computers with [ARM architecture](https://en.wikipedia.org/wiki/ARM_architecture) (such as [Raspberry Pi](https://en.wikipedia.org/wiki/Raspberry_Pi)), in fact these base-images are published to [DockerHub](https://hub.docker.com/u/bsantanna/) using [Manifests](https://docs.docker.com/registry/spec/manifest-v2-2/), which makes some of them [cross-platform](https://en.wikipedia.org/wiki/Cross-platform).

In fact, major part of the Docker images in this repository are part of another [important personal project](https://medium.com/@brnsantanna/how-my-hobby-made-me-an-anonymous-hero-d63b0c711bec), and they are really doing well in that.

---

## Docker image categories

A [category](images/) in this context is a general end-goal for a set of images. Categories are divided in the following directories:

 - **[base](images/base/)**      : source-images from which all other images are based on (currently and most likely in long term: [ubuntu](https://hub.docker.com/_/ubuntu/)).
 - **[clients](images/clients)** : client software which connects to some server.
 - **[daemon](images/daemon)**   : service oriented software which performs some work or serves some content.
 - **[dev](images/dev)**         : base-images used for general software development.
 - **[devops](images/devops)**   : base-images used for devops purposes.
 
---

## Project directory structure

Project internal directory arrangement has the following general structure:

 - **images**         : Image root directory
   - **category**     : General category which image belongs, criteria is ending goal / purpose of image.
     - **image**      : Image context is base directory used in *[docker build](https://docs.docker.com/engine/reference/commandline/build/)* commands. Under normal circumstances [Dockerfile](https://docs.docker.com/engine/reference/builder/) is stored in this directory but this is not a rule, for exceptional cases the *[docker build](https://docs.docker.com/engine/reference/commandline/build/)* context can be also in some of nested architecture specific sub-directories.
       - **arch**     : Architecture specific sub directories.
         - **armhf**  : Images for [ARM architecture](https://en.wikipedia.org/wiki/ARM_architecture), are currently build and tested with [Raspberry Pi 3](https://en.wikipedia.org/wiki/Raspberry_Pi) (a 32-bit armv7 little cpu which reminds me the year of 1999, the days back I was downloading [Slackware](https://en.wikipedia.org/wiki/Slackware) [Linux](https://en.wikipedia.org/wiki/Linux) ISOs and testing them in my Pentium 100, great memories...)
         - **x86_64** : Images for [x86-64 architecture](https://en.wikipedia.org/wiki/X86-64), which is used is desktop computers, laptops and servers.
         - **multi**  : Manifest file directory.
         
---

## Author

This is my contribution [OSS](https://en.wikipedia.org/wiki/Open-source_software) community.
[I'm a geek](http://linkedin.com/in/brnsantanna/) born in Brazil and living in The Netherlands, work coding for automated container terminals in naval logistics industry.
In my latest personal projects I frequently built some images and decided to host them in [central docker registry](https://hub.docker.com/u/bsantanna/) for convenience but also for a sense of being part of something huge which is this open-source code community, which I'm proud of.

I'm an early adopter of [Docker](https://www.docker.com), seeking more in-depth and practical use I decided to read an excellent book: [The Docker Book](https://dockerbook.com), lots of examples are directly borrowed from it and adapted to allow practical study and/or implementation of software projects.  

This repository was built after countless hours of (out-of-office / hobby project / coding for fun). 
