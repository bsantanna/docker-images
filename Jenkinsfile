#!groovy
@Library("btech-pipeline-library")

import software.btech.pipeline.docker.DockerClientUtility
import software.btech.pipeline.openshift.OpenShiftClientUtility

final ORIGIN_GIT_CREDENTIALS_ID = "github_credentials"
final ORIGIN_GIT_URL = "git@github.com:bsantanna/docker-images.git"
final BRANCH_NAME = "main"
final OPENSHIFT_CLUSTER = "sdam-openshift"
final OPENSHIFT_PROJECT = "docker-images"
final REGISTRY_CREDENTIALS_ID = "dockerhub_credentials"

// pipeline utilities
final dockerUtility = new DockerClientUtility(this, [:])
final openshiftUtility = new OpenShiftClientUtility(this, OPENSHIFT_CLUSTER)

// images categories
final IMAGE_MAP = [
  "base"   : [
    "debian",
    "ubuntu"
  ],
  "clients": [
    "ddclient"
  ],
  "dev"    : [
    "chef-dev",
    "java-nodejs-dev",
    "java-python-dev",
    "java-ruby-dev",
    "maven-build"
  ],
  "devops" : [
    "elastic-apm-agent"
  ],
  "servers": [
    "bitcoin",
    "nginx-ssl-proxy",
    "nginx-static",
    "smb",
    "squid-proxy"
  ],
  "utils"  : [
    "util-math",
    "util-finance"
  ]
]

def buildImage(dockerClientUtility, arch, baseDir, images) {
  // cleanup workspace
  deleteDir()

  // unstash
  unstash "sources"

  // filter image list
  List<String> filteredImages = []
  for (String image : images) {
    def archExists = fileExists "images/${baseDir}/${image}/arch/${arch}"
    if (archExists) {
      filteredImages.add(image)
    } else {
      dockerClientUtility.print("\nNOT FOUND IMAGE ${image} FOR ARCHITECTURE ${arch}")
    }
  }

  // build each image
  if (!filteredImages.isEmpty()) {
    for (String image : filteredImages) {
      dir("images/${baseDir}/${image}/arch/${arch}") {
        def buildContext = pwd()
        def tag = "bsantanna/" + image + ":" + arch
        dockerClientUtility.buildImage(buildContext, tag)
        sh "docker push " + tag
      }
    }
  }

}

catchError {
  timestamps {
    stage("Pipeline setup") {
      node("gitClient") {
        // cleanup workspace
        deleteDir()

        // checkout
        git credentialsId: ORIGIN_GIT_CREDENTIALS_ID, url: ORIGIN_GIT_URL, branch: BRANCH_NAME

        // stash
        stash name: "sources"
      }
    }

    stage("Build Raspberry Pi Compatible Images") {
      node("dockerClient && arm") {
        dockerUtility.print("Building ARM Images")
        dockerUtility.registryLogin(REGISTRY_CREDENTIALS_ID)
        for (String baseDir : IMAGE_MAP.keySet()) {
          buildImage(dockerUtility, "arm", baseDir, IMAGE_MAP[baseDir])
        }
      }
    }

    stage("Build OpenShift Project") {
      node("openshiftClient") {
        // build project with timeout in minutes
        openshiftUtility.buildProject(OPENSHIFT_PROJECT, 120)
      }
    }

  }
}
