pipeline {
  agent {
    docker { image 'ruby:3.3-alpine3.19' }
  }
  stages {
    stage('Setup') {
      steps {
        sh 'ruby --version'
        sh 'pwd'
      }
    }
  }
}
