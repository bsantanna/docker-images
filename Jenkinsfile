#!groovy

// credentials git
final ORIGIN_GIT_USER_EMAIL = "mail@bsantanna.me"
final ORIGIN_GIT_CREDENTIALS_ID = "github_credentials"
final ORIGIN_GIT_URL = "git@github.com:bsantanna/containers.git"
final ORIGIN_GIT_BRANCH = "2.x"

// build vars
final TIMESTAMP = new Date().format("yyyyMMdd_HHmm")

// reusable functions
def defaultErrorHandler(message, e) {
  echo "==== ERROR ===="
  echo message
  echo "==== CURRENT DIR ===="
  sh "pwd"
  echo "==== DIR CONTENT ===="
  sh "ls -lh ."
  echo "==== STACK TRACE CONTENT ===="
  throw e
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

    final ARCH_x86_64 = "x86_64"

    // parallel build for different architectures
    parallel "Images: ${ARCH_x86_64}": {
      node(ARCH_x86_64) {

        // restart docker environment
        sh "\$(service docker start && sleep 15) || true"
        sh "docker stop \$(docker ps -aq) && docker rm \$(docker ps -aq) || true"

        // cleanup workspace
        deleteDir()

        // unstash
        unstash "sources"

        // define images array
        final images = [
            "openssh-client",
            "openjdk-7-jdk",
            "openjdk-8-jdk",
            "jenkins",
            "jenkins-docker",
            "frontend-dev",
            "frontend-build",
            "backend-dev",
            "backend-build"
        ]

        // build each image
        for (def image : images) {
          dir("images/${image}/arch/${ARCH_x86_64}") {
            sh "./docker_build.sh"
          }
        }
      }
    }

  }

}