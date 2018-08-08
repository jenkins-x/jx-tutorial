pipeline {
  environment {
    GH_CREDS = credentials('jenkins-x-github')
  }
  agent {
    label "jenkins-go"
  }
  stages {
    stage('CI Build') {
      when {
        branch 'PR-*'
      }
      steps {
        checkout scm
        container('go') {
          echo "pr build"
        }
      }
    }

    stage('Build and Push Release') {
      when {
        branch 'master'
      }
      steps {
        checkout scm
        container('go') {
          echo "release build"
        }
      }
    }
  }
}
