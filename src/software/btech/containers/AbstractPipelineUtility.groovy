#!groovy
package software.btech.containers

/**
 * Base class with shared functions and class scoped fields
 * - pipeline being executed
 * - className resolved to subclasses
 */
abstract class AbstractPipelineUtility implements Serializable {

  final def pipeline
  final def className

  /**
   * Constructor with pipeline reference injection.
   * @param pipeline pipeline being executed
   */
  AbstractPipelineUtility(pipeline) {
    this.pipeline = pipeline
    this.className = this.getClass().getSimpleName()
  }

  /**
   * Print with className
   * @param inputMessage message to print
   */
  def print(String inputMessage) {
    this.pipeline.echo this.className + ": " + inputMessage
  }

}