pipeline{
    agent any
    tools{
        Nodejs 'node-1.2.3'
    }
    environmet {
        NODE_HOME= '/usr/local/nodejs' //path to Node.js installation
        PATH = ${NODE_HOME}/bin:${env.PATH}
        DEPLOY_SERVER= 'https//deploy-server'
    }
    stages{
        stage('checkout'){ 
            steps{
               checkout scmGit (branches: [[name: */main]], extensions: [], userRemoteConfigs:[[url:'']])
            }
        }
        stage('install dependencies'){
            steps{
                sh 'npm install'
            }
        }
        stage('Run Tests'){
            steps{
                sh 'npm test'
            }
        }
        stage('Build Application'){
            steps{
            sh 'npm run build'
            }
        }
        stage('Deploy Application'){
            steps{
                sh '"
                  sudo cp -r build/* var/www/html/
                  sudo systemctl restart niginx
                "'
            }
        }
    }
    post{
        always{
            echo 'pipeline execution completed'
        }
        success{
            echo 'Application Deployed Successfully'
        }
        failure {
            echo 'pipeline failed. check the logs for details'
        }
    }
}