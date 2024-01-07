pipeline {
  agent {
    docker { image 'ruby:3.3-alpine3.19' }
  }
  stages {
    stage('Setup') {
      steps {
        sh 'ruby --version'
        sh 'pwd'
        sh 'bundle install'
        sh 'bundle exec rails db:create'
        sh 'bundle exec rails db:schema:load'
      }
    }
    stage('Test') {
      steps {
        sh 'bundle exec rspec'
      }
    }
  }
}
