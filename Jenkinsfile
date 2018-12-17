pipeline {
  agent any
  environment {
    GH_CREDS = credentials('jx-pipeline-git-github-github')
  }
  stages {
    stage('CI Build') {
      when {
        branch 'PR-*'
      }
      steps {
        checkout scm
        echo "pr build"
      }
    }

    stage('Build and Push Release') {
      when {
        branch 'master'
      }
      steps {
        git "https://github.com/jenkins-x/jx-tutorial"
        echo "release build"
      }
    }
  }
}
