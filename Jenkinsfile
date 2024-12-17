pipeline {
    agent none

    stages {
        stage('Clone') {
            // Clones the repository from the current branch name
            echo 'Make the output directory'
            sh 'mkdir -p build'

            echo 'Cloning files from (branch: "master" )'
            dir('build') {
                git branch: 'master', credentialsId: 	gitCredentials, url: 'https://github.com/GabrielHeiwa/playwright-jenkins'
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