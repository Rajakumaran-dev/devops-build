pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-credentials-id')  // Jenkins credentials ID
    }

    stages {
        stage('Build') {
            steps {
                sh 'bash build.sh'
            }
        }

        stage('Deploy') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials-id', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                    script {
                        // Deploy to development server
                        sh '''
                        export DOCKERHUB_USERNAME=$DOCKERHUB_USERNAME
                        export DOCKERHUB_PASSWORD=$DOCKERHUB_PASSWORD
                        export IMAGE_TAG=dev
                        ./deploy.sh
                        '''

                        // Deploy to production server
                        sh '''
                        export DOCKERHUB_USERNAME=$DOCKERHUB_USERNAME
                        export DOCKERHUB_PASSWORD=$DOCKERHUB_PASSWORD
                        export IMAGE_TAG=prod
                        ./deploy.sh
                        '''
                    }
                }
            }
        }
    }
}
