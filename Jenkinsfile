pipeline {
    agent any
    
environment {
        SONARQUBE_SCANNER_HOME = tool 'sonarqube-10.3'
        SONARQUBE_URL = 'http://10.10.30.117:9003' // Replace with your SonarQube server URL
    }
    
    stages {
        stage('SCM') {
            steps {
                git 'https://github.com/mansib24/dvja.git'
            }
        }
        stage('DP Check') {
           steps {
        dependencyCheck additionalArguments: ''' 
                    -o './'
                    -s './'
                    -f 'ALL' 
--prettyPrint''', odcInstallation: 'owasp-dependency-checker'
        
        dependencyCheckPublisher pattern: 'dependency-check-report.xml'
      }
        }

        stage ('Check-Git-Secrets') {
      steps {
        sh 'rm trufflehog || true'
        sh 'docker run gesellix/trufflehog --json https://github.com/mansib24/dvja.git > trufflehog'
        sh 'cat trufflehog'
      }
    }
       stage('SonarQube Analysis') {
            steps {
                script {
                    // Run SonarQube analysis
                    docker.image('sonarqube:latest').withRun('-p 9003:9003') { 
                        // Assuming your SonarQube server is running on port 9003
                        sh "mvn sonar:sonar \
                            -Dsonar.host.url=http://10.10.30.117:9003 \
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
