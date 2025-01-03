pipeline{
    agent any
    stages{
        stage('checkout'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions:[], userRemoteConfigs: [[url: 'ghdhcdbccbbc']])
            }
        }
        stage('docker build'){
            steps{
                sh '" 
                docker build -t myapp:latest .
                docker tag my-app:latest my-dockerhub-user/my-app:latest
                "'
            }
        }
        stage('push to docker hub'){
            steps{
                withCredentials([string(credentialsId:'dockerhub-password', variable:'DOCKER_PASSWORD')]){
                    sh '"
                    echo $DOCKER_PASSWORD | docker login -u my-dockerhub-user --password-stdin
                    docker push my-dockerhub-user/my-app:latest
                    "'
                }
            }
        }
    }
}