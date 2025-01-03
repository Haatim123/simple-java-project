pipeline{
    agent any
    tools{
        maven 'Maven-3.8.5' //name of maven tool in jenkins
        // JDK 'JDK-11'
    } 
    
    stages{
        stage("checkout"){
           steps{
              checkout scmGit(branches:[[name:*/main]],extensions:[], userRemoteConfigs:[[url: 'a' ]] )
           }
        }
        stage('Build with Maven'){
            steps{
                sh 'mvn clean package'
            }
        }
        stage('Deploy to tomacat'){
            steps{
                sh '" 
                sudo cp target/*.war /opt/tomcat/webapps/
                sudo systemctl restart tomcat "'
            }
        }
    }
}