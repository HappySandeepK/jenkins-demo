pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = "docker.io/sandeepapps"
        IMAGE_NAME = "jenkins-demo"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git url: 'https://github.com/HappySandeepK/jenkins-demo.git',
                    branch: 'main',
                    credentialsId: 'github-creds'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'podman build -t $DOCKER_REGISTRY/$IMAGE_NAME:latest .'
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-creds', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                    sh 'echo $DOCKER_PASS | podman login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh 'podman push $DOCKER_REGISTRY/$IMAGE_NAME:latest'
            }
        }
    }
}
