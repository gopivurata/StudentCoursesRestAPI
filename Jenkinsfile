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
                sh 'docker image build -t student:1.2 .'
                sh 'docker image tag student:1.2 gopivurata/student:1.2'
                sh 'docker image push gopivurata/student:1.2'
                sh 'docker container run --name my-student-1 -d -p 8099:8080 gopivurata/student:1.2'
               // sh 'docker compose up -d'
            }
        }
    }
}
