#!groovy
@Library("btech-pipeline-library@1.x")

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
    node("armhf && dockerClient") {
      // TODO: use dockerUtility to build images
    }
  }

  stage("x86_64 build") {
    node("openshiftClient") {
      // openshiftUtility.buildProject(OPENSHIFT_PROJECT, 45)
    }
  }

}
