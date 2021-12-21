  pipeline {
    environment {
    PROJECT = var.VM_NAME
    ZONE = var.VM_ZONE
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
          sh 'gcloud compute instance set-service-account $PROJECT --zone=$ZONE --scopes=default,storage-rw'
          
          
        }
      }
    } 
  }
