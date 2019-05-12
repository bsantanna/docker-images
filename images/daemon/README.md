# Category: Daemon

Service oriented software which performs some work or serves some content.


## [nfs](nfs/)

 - Published image: [bsantanna/nfs](https://hub.docker.com/r/bsantanna/nfs/)

### Description

This image is platform dependent, image build process differs between armhf and x86_64 platforms.

#### Arch x86_64:
This Docker image uses [nfs-kernel-server](https://packages.ubuntu.com/bionic/nfs-kernel-server) package.

#### Arch armhf:
This Docker image uses [UNFS3](http://unfs3.sourceforge.net) built from sources. 
From the [official project page](http://unfs3.sourceforge.net):

>UNFS3 is a user-space implementation of the NFSv3 server specification. It provides a daemon for the MOUNT and NFS protocols, which are used by NFS clients for accessing files on the server. 

---

## [nginx-ssl-proxy](nginx-ssl-proxy/)

 - Published image: [bsantanna/nginx-ssl-proxy](https://hub.docker.com/r/bsantanna/nginx-ssl-proxy/)
 
### Description
This Docker image uses [nginx](https://packages.ubuntu.com/bionic/nginx) package.
This is a base-image that uses [NGINX](http://nginx.com) with [Reverse Proxy](https://en.wikipedia.org/wiki/Reverse_proxy) role. 
It is a base for [SSL/TLS](https://en.wikipedia.org/wiki/Transport_Layer_Security) connection negotiation.

---

## [nginx-static](nginx-static/)

 - Published image: [bsantanna/nginx-static](https://hub.docker.com/r/bsantanna/nginx-static/)
 
### Description
This Docker image uses [nginx](https://packages.ubuntu.com/bionic/nginx) package.
This image uses [NGINX](http://nginx.com) to serve static content through HTTP.

---

## [smb](smb/)

 - Published image: [bsantanna/smb](https://hub.docker.com/r/bsantanna/smb/)
 
### Description
This Docker image uses [samba](https://packages.ubuntu.com/bionic/samba) package.
This is a base-image that uses [Samba](https://www.samba.org) to serve files in a Windows Network.

---

## [squid-proxy](squid-proxy/)

 - Published image: [bsantanna/squid-proxy](https://hub.docker.com/r/bsantanna/squid-proxy/)
 
### Description
This Docker image uses [squid](https://packages.ubuntu.com/bionic/squid) package.
This is a base-image that uses [Squid Cache](http://www.squid-cache.org) to proxy HTTP connections.
