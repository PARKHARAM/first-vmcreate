  pipeline {
    environment {
    PROJECT = "vm-terraform-test-gcloud"
    ZONE = "asia-northeast3-a"
    }
    agent any
    tools {
        terraform 'Terraform14'

    }

    stages {  

      stage('Git Checkout') {
        steps {
          git branch: 'main', credentialsId: 'gkfka133', url: 'https://github.com/PARKHARAM/vmcreate-terraform' 
         
        }      
      }

      stage('TF Init&Plan') {
        steps {
          sh 'pwd'
          sh 'ls -al'
          sh 'cd testa'
          sh 'pwd'
          
        }      
      }

      


      
    } 
  }
