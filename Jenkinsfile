pipeline {
    agent any
    
    stages {
        stage('Build Docker Image') {
            steps {
                sh 'bash build.sh'
            }
        }
        stage('Push Docker Image to Dev') {
            when {
                branch 'dev'
            }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        docker.image('prinzspace/reactapp-dev:latest').push()
                    }
                }
            }
        }
        stage('Push Docker Image to Prod') {
            when {
                branch 'master'
            }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        docker.image('prinzspace/reactapp-prod:latest').push()
                    }
                }
            }
        }
		stage('Deploy Docker Image') {
            steps {
                sh 'bash deploy.sh'
            }
        }
    }
}
