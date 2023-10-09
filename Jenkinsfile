pipeline {
    agent any
    triggers { pollSCM('* * * * *') }
    stages {
        stage ('git clone') {
            steps {
                git branch: 'master', 
                    url: 'https://github.com/gopivurata/StudentCoursesRestAPI.git'
            }
        }
        stage ('docker image build') {
            steps {
                sh 'docker image build -t student:0.0.1 .'
                sh 'docker image tag student:0.0.1 gopivurata/student:0.0.1'
                sh 'docker login https://hub.docker.com -u gopivurata  --password-stdin GOPI$2727'
                sh 'docker image push gopivurata/student:0.0.1'
                sh 'docker compose up -d'
            }
        }
    }
}
