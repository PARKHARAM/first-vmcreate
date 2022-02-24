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


              
        stage('SonarQube analysis') {
            steps{
                withSonarQubeEnv('testsonar'){
                    //sh "mvn -version"
                    sh "mvn clean package"
                    
                    sh "mvn sonar:sonar -Dsonar.projectKey=demo -Dsonar.host.url=http://34.64.88.47:9000/ -Dsonar.login=9f40ea6d870c2c7b24f4ecc6f40350b8030a170a"
                }
            }
        }
        
        stage('SonarQube Quality Gate'){
            steps{
                timeout(time: 1, unit: 'MINUTES') {
                    script{
                        echo "Start~~~~"
                        def qg = waitForQualityGate()
                        echo "Status: ${qg.status}"
                        if(qg.status != 'OK') {
                            echo "NOT OK Status: ${qg.status}"
                            updateGitlabCommitStatus(name: "SonarQube Quality Gate", state: "failed")
                            error "Pipeline aborted due to quality gate failure: ${qg.status}"
                        } else{
                            echo "OK Status: ${qg.status}"
                            updateGitlabCommitStatus(name: "SonarQube Quality Gate", state: "success")
                        }
                        echo "End~~~~"
                    }
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
