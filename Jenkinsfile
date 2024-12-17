pipeline {
    agent none
    
    stages {
        stage('Test') {
            agent {
                docker { image 'node:22.12.0-alpine3.21' }
            }

            steps {
                sh 'node --eval "console.log(process.platform,process.env.CI)"'
            }
        }
    }
}