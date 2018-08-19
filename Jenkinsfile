#!groovy

// credentials git
final ORIGIN_GIT_CREDENTIALS_ID = "github_credentials"
final ORIGIN_GIT_URL = "git@github.com:bsantanna/containers.git"
final ORIGIN_GIT_BRANCH = "2.x"

// credentials registry
final REGISTRY_CREDENTIALS_ID = "dockerhub_credentials"

// build vars
final ARCH_x86_64 = "x86_64"
final DOCKER_IMAGES = [
    "docker-manifest-publisher",
    "ddclient",
    "openssh-client",
    "openjdk-7-jdk",
    "openjdk-8-jdk",
    "java-dev",
    "jenkins",
    "jenkins-docker",
    "jenkins-docker-jnlp-agent",
    //"maven-build",
    "nfs",
    "nginx-ssl-proxy",
    "nginx-static",
    "npm-dev",
    //"npm-build",
    "rdesktop",
    "smb",
    "smokeping",
    "squid-proxy"
]
final TIMESTAMP = new Date().format("yyyyMMdd_HHmm")

// reusable functions
def restartDockerDaemon() {
  echo "==== RESTARTING DOCKER DAEMON ===="
  sh "\$(service docker start && sleep 15) || true"
  sh "docker stop \$(docker ps -aq) && docker rm \$(docker ps -aq) || true"
  echo "==== DOCKER DAEMON RESTART COMPLETE===="
}

def dockerBuildAndPush(arch, image) {
  dir("images/${image}/arch/${arch}") {
    echo "==== BUILDING DOCKER IMAGE: ${image} for ARCHITECTURE: ${arch} ===="
    sh "./docker_build.sh"

    echo "==== PUSHING IMAGE TO REGISTRY: ${image} for ARCHITECTURE: ${arch} ===="
    sh "./docker_push.sh"
  }
}

def dockerManifestPublish(image, registryCredentialsId) {
  dir("images/${image}/arch/multi/") {
    echo "==== PUBLISHING DOCKER IMAGE MANIFEST FOR: ${image} ===="

    // publish using docker-manifest-publisher image
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: registryCredentialsId, usernameVariable: 'DOCKER_REGISTRY_USERNAME', passwordVariable: 'DOCKER_REGISTRY_PASSWORD']]) {
      sh "docker run -it --rm " +
          " -e DOCKER_REGISTRY_USERNAME=${env.DOCKER_REGISTRY_USERNAME} " +
          " -e DOCKER_REGISTRY_PASSWORD=${env.DOCKER_REGISTRY_PASSWORD} " +
          " -v \$(pwd):/opt/workspace/ bsantanna/docker-manifest-publisher-x86_64 /opt/workspace/${image}.yml"
    }

  }
}

def dockerRegistryLogin(registryCredentialsId) {
  // login docker hub
  withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: registryCredentialsId, usernameVariable: 'DOCKER_REGISTRY_USERNAME', passwordVariable: 'DOCKER_REGISTRY_PASSWORD']]) {
    sh "docker login -u ${env.DOCKER_REGISTRY_USERNAME} -p ${env.DOCKER_REGISTRY_PASSWORD}"
  }
}

catchError {

  stage("Pipeline setup") {
    node {
      // cleanup workspace
      deleteDir()

      // checkout
      git credentialsId: ORIGIN_GIT_CREDENTIALS_ID, url: ORIGIN_GIT_URL, branch: ORIGIN_GIT_BRANCH

      // stash
      stash name: "sources"
    }
  }

  stage("Build") {

    // parallel build for different architectures
    parallel "Images: ${ARCH_x86_64}": {
      node(ARCH_x86_64) {

        // cleanup workspace
        deleteDir()

        // unstash
        unstash "sources"

        // restart docker environment
        restartDockerDaemon()

        // login docker registry
        dockerRegistryLogin(REGISTRY_CREDENTIALS_ID)

        // build each image
        for (def image : DOCKER_IMAGES) {
          dockerBuildAndPush(ARCH_x86_64, image)
        }

      }
    }
  }

  stage("Publish") {
    node(ARCH_x86_64) {
      // publish each image
      for (def image : DOCKER_IMAGES) {
        dockerManifestPublish(image, REGISTRY_CREDENTIALS_ID)
      }
    }
  }

}