pipeline {
  environment {
    imagename = "test/test"
    registry = 'https://registry.example.com'
    registryCredential = 'my-key'

  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/alexey-akhmetov/java-WebServer.git', branch: 'master', ])

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
    // stage('Push Image to registry') {
    //   steps{
    //     script {
    //       docker.withRegistry(registry, registryCredential) {
    //         dockerImage.push("$BUILD_NUMBER")
    //         dockerImage.push('latest')
    //       }
    //     }
    //   }
    // }
    stage('Deploy app') {
      steps{
        sh "echo 'deploy app'"
      }
    }
  }
}