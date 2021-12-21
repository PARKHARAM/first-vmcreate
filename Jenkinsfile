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
          sh 'terraform init'
          sh 'terraform plan'
        }      
      }

      

      stage('TF Apply') {
        steps {
          sh 'terraform apply --auto-approve'
          sh 'gcloud projects list'
          sh 'gcloud compute instances set-service-account $PROJECT --zone=$ZONE --scopes=default,storage-rw '
          
          
        }
      }
    } 
  }
