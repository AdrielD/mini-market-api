pipeline {
  agent {
    docker { image 'ruby:3.3-alpine3.19' }
  }
  stages {
    stage('Setup') {
      steps {
        sh 'gem install bundler'
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

// pipeline {
//   agent {
//     docker { image 'ruby:3.3-alpine3.19' }
//   }
//   stages {
//     stage('Setup') {
//       steps {
//         sh 'ruby --version'
//         sh 'pwd'
//         sh 'gem install bundler'
//         sh 'bundle install'
//         sh 'bundle exec rails db:create'
//         sh 'bundle exec rails db:schema:load'
//       }
//     }
//     stage('Test') {
//       steps {
//         sh 'bundle exec rspec'
//       }
//     }
//   }
// }

// pipeline {
//   agent any
//   stages {
//     stage('Test') {
//       steps {
//         sh 'docker compose run -e "RAILS_ENV=test" web bundle exec rails db:create'
//         sh 'docker compose run -e "RAILS_ENV=test" web bundle exec rails db:schema:load'
//         sh 'docker compose run -e "RAILS_ENV=test" web bundle install && bundle exec rspec'
//       }
//     }
//   }
// }
