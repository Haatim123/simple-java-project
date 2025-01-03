// Before running this pipeline we need to give sudo permission to jenkins by adding jenkins in sudoer file
// cat /etc/sudoers file
// vim /etc/sudoers file
// jenkins ALL=(ALL) NOPASSWD: ALL
// usermod -a -G root jenkins


pipeline{
    agent any 
    stages{
       stage("install nginx"){
          steps{
            sh 'sudo apt update-y'
            sh 'sudo apt install nginx-y'
          }

       }
       stage ("deply index.html file"){
          steps {
            sh 'sudo echo "Hello nginx server, this is index.html file!" > index.html'
            sh 'sudo mv index.html /var/www/html/index.html'
          }
       }
       stage ("stop-nginx server"){
          steps {
            sh 'sudo systemcl stop nginx -y'
          }
       }
       stage ('start nginx server'){
          steps {
            sh 'sudo systemctl start nginx-y'
          }
       }
    }
}