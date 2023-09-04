pipeline {
  environment {
    imagename = "nikhilk814/todoapp:v1"
    registryCredential= 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/nikhilk814/jenkins-intgreation-with-docker.git', branch: 'master', credentialsId: 'github'])

      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('v1')

          }
        }
      }
    }
    stage('Release') {
      steps{
        sh 'docker run -d --name notodoapp -p 8000:8000 nikhilk814/todoapp:v1'
         

      }
    }
  }
}
