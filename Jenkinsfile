pipeline {
  environment {
    imagename = "test/test"
    registry = 'https://https://registry.example.com'
    registryCredential = 'password'

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
        script {
          sh 'docker --version'
          sh 'docker-compose --version'
          dockerImage = docker.build("$imagename:${env.BUILD_ID}")
        }
      }
    }
    // stage('Push Image to registry') {
    //   steps{
    //     script {
    //       docker.withRegistry(registry, registryCredential) {
    //         dockerImage.push("${env.BUILD_ID}")
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
