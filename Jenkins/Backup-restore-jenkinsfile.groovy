pipeline{
    agent any
    stages{
        stage('Backup files'){
            steps{
                sh '"
              tar -czf backup.tar.gz /important/files
              scp backup.tar.gz user@backup-server:/backups/
              "'
            }
        }
    }
}