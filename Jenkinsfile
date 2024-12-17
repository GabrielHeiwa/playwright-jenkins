pipeline {
    agent {
        docker { image 'node:22.12.0-alpine3.21' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'ls -lha'
                sh 'node --eval "console.log(process.platform,process.env.CI)"'
            }
        }
    }
}