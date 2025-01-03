pipeline{
    agent any
    stages{
        stage('checkout'){
            steps{
             checkout scmGit (branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[]])
            }     
        }
        stage('install Dependenccies'){
            steps{
             sh 'pip install -r requiremnets.txt'
            }        
        }
        stage('Run Tests'){
            steps{
             sh 'pytest tests/ --html=report.html'    

            }
        }
        stage('publish report'){
            steps{
                publishHTML(target: [
                    reportDir: '.',
                    reportFiles: 'report.html',
                    reportName: 'Test Report'
                ])
            }
        }
    }
    
}