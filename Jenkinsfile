pipeline {
    agent {
        docker { image 'node:18' } // Use Node.js in a container
    }
    environment {
        DOCKER_IMAGE = 'angular-learn'  // Image name for deployment
        CONTAINER_NAME = 'angular_container'
    }
    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build Angular App') {
            steps {
                sh 'ng build --configuration=production'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    sh """
                        docker stop ${CONTAINER_NAME} || true
                        docker rm ${CONTAINER_NAME} || true
                        docker run -d --name ${CONTAINER_NAME} -p 4200:80 ${DOCKER_IMAGE}
                    """
                }
            }
        }
    }
}
