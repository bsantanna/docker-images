#!groovy

stage("prototype_build"){
    node('openshiftClient') {
        openshift.withCluster('sdam-openshift') {
            openshift.withProject('docker-images') {

                def builds = openshift.selector('bc')
                builds.withEach {
                    it.startBuild()
                }

                timeout(30) {
                    builds.untilEach(1) {
                        return it.object().status.phase == "Complete"
                    }
                }
            }
        }
    }
}