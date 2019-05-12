# Category: Base

From the start all images were based on [ubuntu](https://hub.docker.com/_/ubuntu/) image due to my personal experience with this distribution but also the documentation and large community.

I used the ideas from [this article](https://container-solutions.com/multi-arch-docker-images/) to create the [base manifest file](ubuntu/arch/multi/ubuntu-multi.yml) which is the entry point for [cross-platform](https://en.wikipedia.org/wiki/Cross-platform) container usage. 
 
The article indicates the [estesp/manifest-tool](https://github.com/estesp/manifest-tool) which can push such manifests to remote registries.