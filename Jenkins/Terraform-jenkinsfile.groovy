pipeline{
    agent any 
    stages{
        stage('checkout'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions:[], userRemoteConfigs:[[url: '']])
            }
        }
        stage('Terraform init'){
            steps{
                sh 'Terraform init'
            }
        }
        stage('infrastructure plan'){
            steps{
                sh 'Terraform plan'
            }
        }
        stage('action'){
            steps{
                echo 'Terraform action is --> $(action)'
                sh ('terraform ${action} --auto-approve')
            }
        }
    }
}