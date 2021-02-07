pipeline {
  environment {
    imagename = "test/test"
    // registryCredential = 'yenigul-dockerhub'
    // dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/alexey1607/jenkins-test.git', branch: 'master', ])

      }
    }
    stage('Building image') {
      steps{
        sh 'docker --version'
        sh 'docker-compose --version'
        script {
          dockerImage = docker.build("imagename:${env.BUILD_ID}")
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
            dockerImage.push('latest')
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $imagename:$BUILD_NUMBER"
         sh "docker rmi $imagename:latest"

      }
    }
  }
}