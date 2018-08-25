# Category: Daemon

Service oriented software which performs some work or serves some content.


## [nfs](nfs/)

 - Published image: [bsantanna/nfs](https://hub.docker.com/r/bsantanna/nfs/)

### Description

For general information about configuration and examples see [README file](nfs/).
This image is platform dependent, image build process differs between armhf and x86_64 platforms.

#### Arch x86_64:
This Docker image uses [nfs-kernel-server](https://packages.ubuntu.com/xenial/nfs-kernel-server) package.

#### Arch armhf:
This Docker image uses [UNFS3](http://unfs3.sourceforge.net) built from sources. 
From the [official project page](http://unfs3.sourceforge.net):

>UNFS3 is a user-space implementation of the NFSv3 server specification. It provides a daemon for the MOUNT and NFS protocols, which are used by NFS clients for accessing files on the server. 

---

## [nginx-ssl-proxy](nginx-ssl-proxy/)

 - Published image: [bsantanna/nginx-ssl-proxy](https://hub.docker.com/r/bsantanna/nginx-ssl-proxy/)
 
### Description
his Docker image uses [nginx](https://packages.ubuntu.com/xenial/nginx) package.
This image is a base-image to containers implementing [Reverse Proxy](https://en.wikipedia.org/wiki/Reverse_proxy) using [SSL/TLS](https://en.wikipedia.org/wiki/Transport_Layer_Security) channel encryption.
Configuration and examples can be found in image [README file](nginx-ssl-proxy/).

---

## [nginx-static](nginx-static/)

 - Published image: [bsantanna/nginx-static](https://hub.docker.com/r/bsantanna/nginx-static/)
 
### Description
his Docker image uses [nginx](https://packages.ubuntu.com/xenial/nginx) package.
This image uses [NGINX](http://nginx.com) to serve static files through http.
Configuration and examples can be found in image [README file](nginx-static/).

---

