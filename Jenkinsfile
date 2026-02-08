pipeline {
    agent any

    environment {
        IMAGE_NAME = "Priyankapalsaniya/jenkins-demo"
        IMAGE_TAG  = "latest"
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build & Push Docker Image') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId:'jenkins-dockerhub',
                        usernameVariable: 'DOCKER_USERNAME',
                        passwordVariable: 'DOCKER_PASSWORD'
                    )
                ]) {
                    sh '''
                     echo "Docker user is: $DOCKER_USERNAME"
                        echo "Making script executable..."
                        chmod +x scripts/build_push.sh

                        echo "Running Docker build & push script..."
                        ./scripts/build_push.sh
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "✅ Docker image built and pushed successfully!"
        }
        failure {
            echo "❌ Pipeline failed. Check logs for details."
        }
    }
}
