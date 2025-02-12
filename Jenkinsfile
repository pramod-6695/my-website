pipeline {
    agent any  // Jenkins can run this on any available agent

    stages {
        // Stage 1: Clone the Git repository
        stage('Clone Repository') {
            steps {
                // Pull the latest code from your Git repository
                git branch: 'main', 
                    url: 'https://github.com/pramod-6695/my-website.git'
            }
        }

        // Stage 2: Build Docker Image
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile
                    sh 'docker build -t my-website .'
                }
            }
        }

        // Stage 3: Run Docker Container
        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove any running container
                    sh 'docker stop website-container || true'
                    sh 'docker rm website-container || true'
                    // Run the container from the built image
                    sh 'docker run -d -p 8090:80 --name website-container my-website'
                }
            }
        }
    }
}

