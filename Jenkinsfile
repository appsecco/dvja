pipeline {
    agent any
    
environment {
        SONARQUBE_SCANNER_HOME = tool 'sonarqube-10.3'
        SONARQUBE_URL = 'http://10.10.30.117:9000' // Replace with your SonarQube server URL
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
                docker.image('newtmitch/sonar-scanner').inside('-v /var/run/docker.sock:/var/run/docker.sock --entrypoint="" --net jenkins_jenkins') {
            sh "/usr/local/bin/sonar-scanner -Dsonar.host.url=http://sonarqube:9000 -Dsonar.sources=."
    }
}
            }
         }

