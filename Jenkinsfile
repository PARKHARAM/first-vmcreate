pipeline {
    environment {
    PROJECT = "vm-terraform-test-gcloud"
    ZONE = "asia-northeast3-a"
    }
    agent any
    tools {
        terraform 'Terraform14'
        maven('maven3.0.5')

    }

    stages {  
        stage('Git Checkout') {
            steps {
                git branch: 'main', credentialsId: 'gkfka133', url: 'https://github.com/PARKHARAM/vmcreate-terraform' 
         }      
      }
        stage('TF Init&Plan') {
            steps {
                sh 'terraform init'
                sh 'terraform plan'
                dir ('testa') {
                    sh 'pwd'
            }
    
         }      
      }

        stage('TF Apply') {
            steps {
                sh 'terraform apply --auto-approve'
                }
        }
        
     } 
}
