pipeline {
    agent none

    stages {
        stage('Build Docker Image') {
            agent { label 'master' } // Executa na máquina principal do Jenkins para criar a imagem Docker
            steps {
                script {
                    dockerImage = docker.build("custom-agent:latest", "-f Dockerfile .")
                }
            }
        }

        stage('Run Pipeline on Docker Agent') {
            agent {
                docker {
                    image 'custom-agent:latest'
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