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

}