#!groovy
package software.btech.containers

/**
 * Docker utility class with reusable pipeline functions based on image bsantanna/jenkins-docker-agent
 */
class DockerUtility extends AbstractPipelineUtility {

  /**
   * Constructor with pipeline reference injection.
   * @param pipeline pipeline being executed
   */
  DockerUtility(def pipeline) {
    super(pipeline)
  }

  /**
   * Removes all containers, restarts daemon service and sleeps for cooldown time
   *
   * @param timeoutInSeconds time in seconds after restarting, defaults to 15 seconds
   */
  def daemonCleanRestart(timeoutInSeconds) {
    if (timeoutInSeconds == null) {
      timeoutInSeconds = 15
    }
    print("RESTARTING DOCKER DAEMON...")
    this.pipeline.sh "docker stop \$(docker ps -aq) && docker rm \$(docker ps -aq) || true"
    this.pipeline.sh "\$(service docker start && sleep ${timeoutInSeconds}) || true"
    print("DOCKER DAEMON RESTART COMPLETE")
  }

  /**
   * Logs in into Docker registry.
   * @param registryCredentialsId credentials id configured in Jenkins.
   */
  def registryLogin(registryCredentialsId) {
    print("PERFORMING REGISTRY LOGIN...")
    // perform inside credential injection block
    withCredentials([[$class          : 'UsernamePasswordMultiBinding',
                      credentialsId   : registryCredentialsId,
                      usernameVariable: 'DOCKER_REGISTRY_USERNAME',
                      passwordVariable: 'DOCKER_REGISTRY_PASSWORD']]) {

      this.pipeline.sh "" +
          "docker login " +
          "-u ${this.pipeline.env.DOCKER_REGISTRY_USERNAME} " +
          "-p ${this.pipeline.env.DOCKER_REGISTRY_PASSWORD}"

      print("LOGIN COMPLETE")
    }
  }

}
