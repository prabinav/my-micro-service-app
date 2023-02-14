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
    }
  
}
