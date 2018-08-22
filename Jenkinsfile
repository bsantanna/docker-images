#!groovy

// credentials git
final ORIGIN_GIT_CREDENTIALS_ID = "github_credentials"
final ORIGIN_GIT_URL = "git@github.com:bsantanna/containers.git"
final ORIGIN_GIT_BRANCH = "2.x"

// credentials registry
final REGISTRY_CREDENTIALS_ID = "dockerhub_credentials"

// build vars
final ARCH_AMD64 = "x86_64"
final ARCH_ARM = "armhf"
final DOCKER_IMAGES = [
    "chromium-kiosk",
    "docker-manifest-publisher",
    "ddclient",
    "openssh-client",
    "openjdk-7-jdk",
    "openjdk-8-jdk",
    "java-dev",
    "jenkins",
    "jenkins-docker",
    "jenkins-docker-agent",
    "jenkins-docker-jnlp-agent",
    "jenkins-docker-sshd-agent",
    "maven-build",
    "nfs",
    "nginx-ssl-proxy",
    "nginx-static",
    "npm-dev",
    "npm-build",
    "rdesktop",
    "smb",
    "smokeping",
    "squid-proxy",
    "ubuntu-multi"
]

// reusable functions
def build(credentialsId, arch, images) {
  // cleanup workspace
  deleteDir()

  // unstash
  unstash "sources"

  // restart docker environment
  dockerDaemonRestart()

  // login docker registry
  dockerRegistryLogin(credentialsId)

  // filter image list
  List<String> filteredImages = []
  for (String image : images) {
    def archExists = fileExists "images/${image}/arch/${arch}"
    if (archExists) {
      filteredImages.add(image)
    }
  }

  // build each image
  for (String image : filteredImages) {
    dockerBuildAndPush(arch, image)
  }

}

def dockerBuildAndPush(arch, image) {
  dir("images/${image}/arch/${arch}") {
    echo "==== BUILDING DOCKER IMAGE: ${image} for ARCHITECTURE: ${arch} ===="
    sh "./docker_build.sh"

    echo "==== PUSHING IMAGE TO REGISTRY: ${image} for ARCHITECTURE: ${arch} ===="
    sh "./docker_push.sh"
  }
}

def dockerDaemonRestart() {
  echo "==== RESTARTING DOCKER DAEMON ===="
  sh "\$(service docker start && sleep 15) || true"
  sh "docker stop \$(docker ps -aq) && docker rm \$(docker ps -aq) || true"
  echo "==== DOCKER DAEMON RESTART COMPLETE===="
}

def dockerManifestPublish(image, registryCredentialsId) {
  dir("images/${image}/arch/multi/") {
    echo "==== PUBLISHING DOCKER IMAGE MANIFEST FOR: ${image} ===="

    // publish using docker-manifest-publisher image
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: registryCredentialsId, usernameVariable: 'DOCKER_REGISTRY_USERNAME', passwordVariable: 'DOCKER_REGISTRY_PASSWORD']]) {
      sh "docker run -i --rm " +
          " -e DOCKER_REGISTRY_USERNAME=${env.DOCKER_REGISTRY_USERNAME} " +
          " -e DOCKER_REGISTRY_PASSWORD=${env.DOCKER_REGISTRY_PASSWORD} " +
          " -v \$(pwd):/opt/workspace/ bsantanna/docker-manifest-publisher /opt/workspace/${image}.yml"
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
    parallel "${ARCH_AMD64}": {
      node(ARCH_AMD64) {
        build(REGISTRY_CREDENTIALS_ID, ARCH_AMD64, DOCKER_IMAGES)
      }
    }, "${ARCH_ARM}": {
      node(ARCH_ARM) {
        build(REGISTRY_CREDENTIALS_ID, ARCH_ARM, DOCKER_IMAGES)
      }
    }

  }

  stage("Publish") {
    node(ARCH_AMD64) {
      // publish each image
      for (String image : DOCKER_IMAGES) {
        dockerManifestPublish(image, REGISTRY_CREDENTIALS_ID)
      }
    }
  }

}