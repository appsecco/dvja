pipeline {
    agent any

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
                    withSonarQubeEnv('sonarqube-10.3') {
                        sh "${SONARQUBE_HOME}/bin/sonar-scanner -Dsonar.host.url=${'http://10.10.30.117:9000'}"
                    }
    }
}
            }
         }
}
