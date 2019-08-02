#!groovy
@Library("btech-pipeline-library")
import software.btech.pipeline.DockerUtility

// Docker utility
final DOCKER_MIRROR = "192.168.2.200:8082"
final dockerUtility = new DockerUtility(this, [proxy: DOCKER_MIRROR])

// credentials git
final ORIGIN_GIT_CREDENTIALS_ID = "github_credentials"
final ORIGIN_GIT_URL = "git@github.com:bsantanna/containers.git"
final ORIGIN_GIT_BRANCH = "2.x"

// credentials registry
final REGISTRY_CREDENTIALS_ID = "dockerhub_credentials"

// build vars
final ARCH_AMD64 = "x86_64"
final ARCH_ARM = "armhf"

// images categories
final IMAGES_CATEGORIES = [
    "base"   : [
        "alpine",
        "ubuntu"
    ],
    "clients": [
        "chromium-kiosk",
        "ddclient",
        "rdesktop"
    ],
    "daemon" : [
        "nfs",
        "nginx-ssl-proxy",
        "nginx-static",
        "smb",
        "squid-proxy"
    ],
    "dev"    : [
        "chef-dev",
        "maven-build",
        "java-python-exec",
        "npm-dev",
        "npm-build"
    ],
    "devops" : [
        "elastic-apm-agent",
        "jenkins-docker-agent",
        "docker-manifest-publisher"
    ],
    "util"   : [
        "math",
        "finance"
    ]
]

// reusable functions
def build(arch, category, images) {
  // cleanup workspace
  deleteDir()

  // unstash
  unstash "sources"

  // filter image list
  List<String> filteredImages = []
  for (String image : images) {
    def archExists = fileExists "images/${category}/${image}/arch/${arch}"
    if (archExists) {
      filteredImages.add(image)
    } else {
      echo "NOT FOUND IMAGE ${image} FOR ARCHITECTURE ${arch}"
    }
  }

  // build each image
  if (!filteredImages.isEmpty()) {
    for (String image : filteredImages) {
      retry(5) {
        dockerBuildAndPush(arch, category, image)
        sh "sleep 5"
      }
    }
  }

}

def dockerBuildAndPush(arch, category, image) {
  dir("images/${category}/${image}/arch/${arch}") {
    echo "BUILDING DOCKER IMAGE ${image} FOR ARCHITECTURE ${arch}"
    sh "./docker_build.sh"

    echo "PUSHING IMAGE TO REGISTRY ${image} FOR ARCHITECTURE ${arch}"
    sh "./docker_push.sh"
  }
}

def dockerManifestPublish(registryCredentialsId, category, images) {

  // unstash
  unstash "sources"

  for (String image : images) {
    retry(30) {
      dir("images/${category}/${image}/arch/multi/") {
        echo "PUBLISHING DOCKER IMAGE MANIFEST FOR ${image}"

        // publish using docker-manifest-publisher image
        withCredentials([[$class          : 'UsernamePasswordMultiBinding',
                          credentialsId   : registryCredentialsId,
                          usernameVariable: 'DOCKER_REGISTRY_USERNAME',
                          passwordVariable: 'DOCKER_REGISTRY_PASSWORD']]) {
          sh "docker run -i --rm " +
              " -e DOCKER_REGISTRY_USERNAME=${env.DOCKER_REGISTRY_USERNAME} " +
              " -e DOCKER_REGISTRY_PASSWORD=${env.DOCKER_REGISTRY_PASSWORD} " +
              " -v \$(pwd):/opt/workspace/ bsantanna/docker-manifest-publisher /opt/workspace/${image}.yml"
        }
      }
      sh "sleep 5"
    }
  }
}

properties([parameters([booleanParam(defaultValue: true, description: '', name: 'ARM')])])

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

    parallel "${ARCH_AMD64}": {
      node("medium") {
        // restart docker environment
        dockerUtility.dockerDaemonRestart(5)

        // login docker registry
        dockerUtility.registryLogin(REGISTRY_CREDENTIALS_ID)

        // build
        for (String category : IMAGES_CATEGORIES.keySet()) {
          build(ARCH_AMD64, category, IMAGES_CATEGORIES[category])
        }

      }
    }, "${ARCH_ARM}": {
      if (params.ARM) {
        node("micro") {
          // restart docker environment
          dockerUtility.dockerDaemonRestart(5)

          // login docker registry
          retry(5) {
            dockerUtility.registryLogin(REGISTRY_CREDENTIALS_ID)
            sh "sleep 5"
          }

          // build
          for (String category : IMAGES_CATEGORIES.keySet()) {
            build(ARCH_ARM, category, IMAGES_CATEGORIES[category])
          }
        }
      }
    }

  }

  stage("Publish") {
    node("medium") {
      // restart docker environment
      dockerUtility.dockerDaemonRestart(5)

      // login docker registry
      retry(5) {
        dockerUtility.registryLogin(REGISTRY_CREDENTIALS_ID)
        sh "sleep 5"
      }

      // publish each image
      for (String category : IMAGES_CATEGORIES.keySet()) {
        dockerManifestPublish(REGISTRY_CREDENTIALS_ID, category, IMAGES_CATEGORIES[category])
      }
    }
  }

}