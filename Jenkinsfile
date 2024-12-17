pipeline {
    agent none

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    checkout([
                        $class: 'GitSCM', 
                        branches: [[name: '*/master']],
                        userRemoteConfigs: [[
                            url: 'https://github.com/GabrielHeiwa/playwright-jenkins.git',
                            credentialsId: null
                        ]]
                    ])
                }
            }
        }

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