pipeline {
    agent {
        label 'docker-agent'
    }
    stages {
        stage('Test docker') {
            docker.image('alpine:latest').inside {
                sh 'echo "Hello, World!"'
            }
        }
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
