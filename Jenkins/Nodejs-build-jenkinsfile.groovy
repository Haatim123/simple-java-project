pipeline{
    agent any 
    tools{
        nodejs 'nodes-0.1.3'
    }
    environment{
        NODE_HOME = '/user/local/node.js'
        PATH = ${NODE_HOME}/bin:${env.PATH}
    }
    stages{
        stage('checkout'){
            steps{
                checkout scmGit (branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'a']])
            }
        }
        stage('Install Dependencies'){
            steps{
                sh 'npm install'
            }
        }
        stage('Run Tests'){
            steps{
                sh 'npm tests'
            }
        } 
        stage('Build App'){
            steps{
                sh 'npm run build'
            }
        }
        stage('Deploy APP'){
            steps{
                sh '"
                sudo systemctl stop nginx
                sudo cp -r */build /var/www/html
                sudo systemctl start nginx
                "'
            }
        }
    }
    post{
        always{
            echo "Pipeline execution completed"
        }
        success{
            echo "Application Deployed Successfully "
        }
        failure{
            echo "pipeline failed.check the logs for details"
        }
    }
}