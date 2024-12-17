pipeline {
    agent none

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("test/playwright:latest", ".")
                }
            }
        }

        stage('Run Pipeline on Docker Agent') {
            agent {
                docker {
                    image 'test/playwright:latest'
                    reuseNode true
                }
            }
            steps {
                echo 'Running pipeline inside custom Docker agent...'
                sh 'node --version' // Exemplo de comando no agente
                sh 'npm --version'  // Outro exemplo de comando
            }
        }
    }
}