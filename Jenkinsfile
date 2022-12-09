pipeline {
    agent {label 'node'}
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
                sh 'docker image build -t student:1.0 .'
                sh 'docker image tag student:1.0 gopivurata/student:1.0'
                sh 'docker image push gopivurata/student:1.0'
                sh 'docker container run --name my-student -d -p 8088:8080 gopivurata/student:1.0'
               // sh 'docker compose up -d'
            }
        }
    }
}
