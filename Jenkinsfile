#!groovy
@Library("btech-pipeline-library")
import software.btech.pipeline.DockerUtility

// Job properties
properties([parameters([
    booleanParam(defaultValue: true, description: 'Build ARM based images', name: 'ARM')]
)])

// Docker utility
final dockerUtility = new DockerUtility(this, [skipDaemonSetup: true])

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
def buildImage(arch, category, images) {
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
      dockerClient.print("NOT FOUND IMAGE ${image} FOR ARCHITECTURE ${arch}")
    }
  }

  // build each image
  if (!filteredImages.isEmpty()) {
    for (String image : filteredImages) {
      dir("images/${category}/${image}/arch/${arch}") {
        dockerUtility.print("BUILDING DOCKER IMAGE ${image} FOR ARCHITECTURE ${arch}")
        //sh "./docker_build.sh"

        dockerUtility.print("PUSHING IMAGE TO REGISTRY ${image} FOR ARCHITECTURE ${arch}")
        //sh "./docker_push.sh"
      }
    }
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
      node("large") {
        for (String category : IMAGES_CATEGORIES.keySet()) {
          buildImage(ARCH_AMD64, category, IMAGES_CATEGORIES[category])
        }
      }
    }, "${ARCH_ARM}": {
      if (params.ARM) {
        node("micro") {
          for (String category : IMAGES_CATEGORIES.keySet()) {
            buildImage(ARCH_ARM, category, IMAGES_CATEGORIES[category])
          }
        }
      }
    }

  }

  stage("Publish") {
    node {
      // login docker registry
      dockerUtility.registryLogin(REGISTRY_CREDENTIALS_ID)

      // publish each image
      for (String category : IMAGES_CATEGORIES.keySet()) {
        //dockerManifestPublish(REGISTRY_CREDENTIALS_ID, category, IMAGES_CATEGORIES[category])
      }
    }
  }

}