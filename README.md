# bsantanna/docker-images

[![Docker Image CI](https://github.com/bsantanna/docker-images/actions/workflows/docker-image.yml/badge.svg)](https://github.com/bsantanna/docker-images/actions/workflows/docker-image.yml)


  - [About this Repository](#about-this-repository)
  - [Repository Structure](#repository-structure)
  - [License](#license)

---

## About this Repository

This repository hosts a collection of meticulously crafted Docker container images, available on my personal [DockerHub](https://hub.docker.com/u/bsantanna) account. These images are primarily utilized for my research and professional development in the following areas:

 
 * Agile / Lean Software Dev 
 * DevOps practices
 * Data science
 * Kubernetes
 * Enterprise Linux
 * Cloud Computing
 * Internet-of-Things (IoT) => Raspberry Pi
 * Finances
 * Machine learning
 

---

## Repository Structure

The repository is organized into several directories, each containing Dockerfiles and related configuration files for different types of images:

- **[base](images/base/)**: Shared base for the JDK-based development images.
- **[dev](images/dev/)**: Images used for general software development.
  - **[chef-dev](images/dev/chef-dev/)**: Development environment for Chef.
  - **[java-nodejs-dev](images/dev/java-nodejs-dev/)**: Development environment for Java and Node.js.
  - **[java-python-dev](images/dev/java-python-dev/)**: Development environment for Java and Python.
  - **[java-ruby-dev](images/dev/java-ruby-dev/)**: Development environment for Java and Ruby.
  - **[maven-build](images/dev/maven-build/)**: Environment for building Maven projects.
  - **[pgcli](images/dev/pgcli/)**: PostgreSQL command-line client.
- **[compute](images/compute/)**: Images used for compute workloads.
  - **[document-utils](images/compute/document-utils/)**: Document conversion and image extraction utilities.
- **[servers](images/servers/)**: Images used for server software.
  - **[cloudnative-pg-vector](images/servers/cloudnative-pg-vector/)**: CloudNativePG PostgreSQL with pgvector.
  - **[keycloak](images/servers/keycloak/)**: Keycloak identity and access management server.
  - **[nginx-ssl-proxy](images/servers/nginx-ssl-proxy/)**: Nginx SSL proxy server.
  - **[nginx-static](images/servers/nginx-static/)**: Nginx static server.
  - **[smb](images/servers/smb/)**: SMB server.

---

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE.md) file for more details.
