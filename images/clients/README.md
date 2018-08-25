# Category: Clients

Client applications which connects to a remote host in the network.

## [chromium-kiosk](chromium-kiosk/)

 - Published image: [bsantanna/chromium-kiosk](https://hub.docker.com/r/bsantanna/chromium-kiosk/)
 - Reference: [dougborg/rpi-chrometainer](https://github.com/dougborg/rpi-chrometainer)

### Description
This Docker image is used for displaying [single page applications](https://en.wikipedia.org/wiki/Single-page_application) in a controlled environment such as a [interactive kiosks](https://en.wikipedia.org/wiki/Interactive_kiosk) or purpose specific [set-top boxes](https://en.wikipedia.org/wiki/Set-top_box). 
It uses [Chromium Browser](https://www.chromium.org/Home) distribution in kiosk mode.
Configuration and examples can be found in image [README file](chromium-kiosk/README.md).

---

## [openssh-client](openssh-client/)

 - Published image: [bsantanna/openssh-client](https://hub.docker.com/r/bsantanna/openssh-client/)

### Description
This Docker image uses [openssh-client](https://packages.ubuntu.com/xenial/openssh-client) package. During image build process, access keys are configured for three git repositories: [BitBucket](https://bitucket.org), [GitHub](https://www.github.org) and [GitLab](https://www.gitlab.org).
This image is used also as a base image to daemons or build agents which requests data from a remote source using *SSH* channel such as [git clonning](https://git-scm.com/docs/git-clone), [scp](http://man7.org/linux/man-pages/man1/scp.1.html) or [rsync](http://man7.org/linux/man-pages/man1/rsync.1.html).   

---

## [rdesktop](rdesktop/)

 - Published image: [bsantanna/rdesktop](https://hub.docker.com/r/bsantanna/rdesktop/)
 
### Description
This Docker image uses [rdesktop](https://packages.ubuntu.com/xenial/rdesktop) package.
This image is used in [thin clients](https://en.wikipedia.org/wiki/Thin_client) to connect to a remote [Windows Remote Desktop Services (RDS)](https://en.wikipedia.org/wiki/Remote_Desktop_Services).
Configuration and examples can be found in image [README file](rdesktop/README.md).
