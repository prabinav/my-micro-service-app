pipeline {
    
    agent any 
    
    environment {
        IMAGE_TAG = "${BUILD_NUMBER}"
    }
    
    stages {
        
        stage('Checkout'){
           steps {
                git credentialsId: '53ad6e8d-f843-40d1-8fb6-52ebd9a7504b', 
                url: 'https://github.com/prabinav/my-micro-service-app',
                branch: 'main'
           }
        }
        
        stage('Build Docker'){
            steps{
                script{
                    sh '''
                    echo 'Buid Docker Image'
                    docker build -t iamprabin/cicd:${BUILD_NUMBER} .
                    '''
                }
            }
        }
        
         stage('Push the artifacts'){
           steps{
                script{
                    sh '''
                    echo 'Push to Repo'
                    docker push iamprabin/cicd:${BUILD_NUMBER}
                    '''
                }
            }
        }
        
        stage('Checkout K8S manifest SCM'){
            steps {
                git credentialsId: '53ad6e8d-f843-40d1-8fb6-52ebd9a7504b', 
                url: 'https://github.com/prabinav/argocd-my-app',
                branch: 'main'
            }
        }
        
        
        
        
        
    }
  
}
