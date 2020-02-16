#!groovy
@Library("btech-pipeline-library")

import software.btech.pipeline.docker.DockerClientUtility
import software.btech.pipeline.openshift.OpenShiftClientUtility

final ORIGIN_GIT_CREDENTIALS_ID = "github_credentials"
final ORIGIN_GIT_URL = "git@github.com:bsantanna/docker-images.git"
final BRANCH_NAME = "3.x"
final OPENSHIFT_CLUSTER = "sdam-openshift"
final OPENSHIFT_PROJECT = "docker-images"

// pipeline utilities
final dockerUtility = new DockerClientUtility(this, [:])
final openshiftUtility = new OpenShiftClientUtility(this, OPENSHIFT_CLUSTER)

// images categories
final IMAGE_MAP = [
    "base"   : [
        "alpine",
        "ubuntu"
    ],
    "clients": [
        //"chromium-kiosk",
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
    "utils"   : [
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

  stage("armhf build") {
    node("armhf") {
      // dockerUtility to build images
      dockerUtility.print("Building ARM Images")

      for (String baseDir : IMAGE_MAP.keySet()) {
        buildImage(dockerUtility, "armhf", baseDir, IMAGE_MAP[baseDir])
      }
    }
  }

  stage("x86_64 build") {
    node("openshiftClient") {
     openshiftUtility.buildProject(OPENSHIFT_PROJECT, 45)
    }
  }

}
