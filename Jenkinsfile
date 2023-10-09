pipeline {
    agent any
    triggers { pollSCM('* * * * *') }
    environment {
        // Define Docker registry credentials
        DOCKER_REGISTRY = 'https://hub.docker.com'
        DOCKER_CREDENTIALS_ID = 'DOCKER_CREDENTIALS' // Credential ID from Jenkins Credential Store
    }
    stages {
        stage ('git clone') {
            steps {
                git branch: 'master', 
                    url: 'https://github.com/gopivurata/StudentCoursesRestAPI.git'
            }
        }
        stage ('docker image build') {
            steps {
                script {
                    // Log in to the Docker registry using credentials
                    withDockerRegistry([credentialsId: env.DOCKER_CREDENTIALS_ID, url: env.DOCKER_REGISTRY]) {
                        // Build and push your Docker image here
                        sh 'docker image build -t student:0.0.2 .'
                        sh 'docker image tag student:0.0.2 gopivurata/student:0.0.2'
                        sh 'docker image push gopivurata/student:0.0.2'
                        sh 'docker compose up -d'
                    }
            }
        }
    }
}
