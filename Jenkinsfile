pipeline {
    agent any  

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', 
                    url: 'https://github.com/pramod-6695/my-website.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t my-website .' // Use sudo if needed
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Proper cleanup to avoid errors
                    sh 'docker ps -q --filter name=website-container | xargs -r docker stop'
                    sh 'docker ps -aq --filter name=website-container | xargs -r docker rm'

                    // Ensure the container starts successfully
                    sh '''
                    set -e
                    docker run -d -p 8060:80 --name website-container my-website
                    '''
                }
            }
        }
    }
}
