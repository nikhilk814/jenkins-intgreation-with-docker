pipeline {
  environment {
    imagename = "nikhilk814/todoapp:v1"
    
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
          withDockerRegistry(credentialsId: 'nikhilk814-dockerhub', toolName: 'docker', url: 'https://hub.docker.com/u/nikhilk814') {
    // some block
          }
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
    stage('Deploy') {
      steps{
        sh 'sudo docker run -d - name todoapp -p 8000:8000 nikhilk814/todoapp:v1'
         

      }
    }
  }
}
