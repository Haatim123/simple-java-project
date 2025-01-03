pipeline{
    agent any
    stages{
        stage('checkout'){
           steps{
            checkout scmGit(branches:[[name: '*/main']], extensions:[], userRemoteConfigs:[[url:'']])
           }
        }
        stage('Run SonarQube Analysis'){
            steps{
                withSonarQubeEnv('SonarQube'){ //Replace SonarQube with name of our actual sonar server
                   sh 'mvn sonar:sonar'
                }
            }
        }
        stage('Quality Gate'){
            steps{
                waitForQualityGate abortpipeline:true
            }
        }
    }
}