pipeline {
    agent any
    
       stage('SonarQube Analysis') {
            steps {
                script {
                    // Run SonarQube analysis
                    docker.image('sonarqube:latest').withRun('-p 9000:9000') { 
                        // Assuming your SonarQube server is running on port 9000
                        sh "mvn sonar:sonar \
                            -Dsonar.host.url=http://10.10.30.117:9001 \
                            -Dsonar.login=9d291b444b6babf514bcc70457d9c601e07171df"
                    }
                }
            }
        }

        stage('Quality Gate') {
            steps {
                script {
                    // Check the SonarQube quality gate status
                    def qualityGate = waitForQualityGate()
                    if (qualityGate.status != 'OK') {
                        error "Pipeline aborted due to quality gate failure: ${qualityGate.status}"
                    }
                }
            }
        }
    }
}

def waitForQualityGate() {
    // Reuse taskId if SonarQube version is 8.x or below, otherwise use analysisId
    def qg = waitForQualityGate()
    if (qg) {
        return qg
    }
    error "Failed to get SonarQube task details"
}


