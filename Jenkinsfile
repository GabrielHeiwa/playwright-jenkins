pipeline {
    agent none

    stages {
        stage('Test') {
            agent {
                docker { image 'mcr.microsoft.com/playwright:v1.49.1-noble' }
            }

            steps {

                sh 'npx playwright test'
            }
        }
    }
}