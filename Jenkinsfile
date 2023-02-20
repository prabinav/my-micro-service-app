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
                branch: 'php'
           }
        }
        
        stage('Build PHP Docker Image'){
            steps{
                script{
                    sh '''
                    echo 'Buid Docker Image'
                    docker build -t iamprabin/php:${BUILD_NUMBER} .
                    '''
                }
            }
        }
        
         stage('Push the artifacts'){
           steps{
                script{
                    sh '''
                    echo 'Push to Repo'
                    docker push iamprabin/php:${BUILD_NUMBER}
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
        
        
     stage('Update K8S manifest & push to Repo'){
  steps {
    script{
      withCredentials([sshUserPrivateKey(credentialsId: '07b60c02-3cf2-4632-a791-32c9eb56aa38', keyFileVariable: 'SSH_KEY_FILE', passphraseVariable: 'SSH_PASSPHRASE', usernameVariable: 'SSH_USERNAME')]) {
        sh '''
        cat micro-app/microservice.yaml
        sed -i "s|image: docker.io/iamprabin/php:[^ ]*|image: docker.io/iamprabin/php:${BUILD_NUMBER}|g" micro-app/microservice.yaml
        cat micro-app/microservice.yaml
        git add micro-app/microservice.yaml
        git commit -m 'Updated the microservice.yaml | Jenkins Pipeline'
        git remote -v
     
       
        # Set the remote URL to use SSH
        git remote set-url origin git@github.com:prabinav/argocd-my-app.git
        
        # Use ssh-agent to add the SSH key and push the changes
        
      
        ssh-agent bash -c 'ssh-add ${SSH_KEY_FILE}; git push origin HEAD:main'
        '''
      }
    }
  }
}


        
       
        
        
        
        
        
    }
  
}
