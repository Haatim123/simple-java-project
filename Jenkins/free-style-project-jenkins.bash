1. Build Automation for project
usecase:Java Project- Build and package a Maven project
create freestyle project -->configure source code management -->git--add url of repo and credentilas 
add build step --> invoke maven targets --> set the goals as 'clean package'
save and build now

2. simple Deployment tasks
usecase: Deploy WAR file to tomcat server 
create freestyle project--> add build step as 'execute shell'
write script: 
cp target/app.WAR /opt/tomcat/webapps 
save and build now 

3. Backup Automation 
usecase: Backup a database dump to an AWS S3 bucket
create freestyle project --> add build step as 'execute shell'
write script: 
mysqldump -u root -p mydb > /backup/mydb.sql
aws s3 cp /backup/mydb.sql s3://mybucket/
schedule periodic backups using build triggers-->build periodically
Ex: * 2 * * * ---> it will take backup at 2 AM everyday
apply and save

4.Periodic Maintenance
usecase: Clean old log files every week
create freestyle project -->add build step as 'execute shell'
write script:
find /var/log/my-app -type f -mtime +7 -delete
configure build triggers--> build periodically
Ex: 0 * * * 0 --> on every sunday at 12 AM it will trigger job automatically.
apply and save

5. continuous integration
usecase: Automatically build when changes are pushed to a GitHub repository.
create a freestyle project -->add source code management --> git --> add url of repo and credentials
select build triggers --> poll scm --> set a cron job to run at every 5 minutes H/5 * * * *
select build step -->Execute shell --> write script: 
mvn test
apply,save and push changes to repository to trigger the build with poll scm

6.Testing Automation
usecase: Run Selenium UI tests
create freestyle --> add build step as --> execute shell
write script: 
python -m unittest discover -s tests/
apply,save and build now

7. code quality analysis
usecase: Run sonarQube for static code analysis
create a freestyle project --> add build step as --> Invoke standalone sonar analysis
configure sonarQube properties like project key, sources, etc.
apply,save and build

8. Multi-step workflows
usecase: Fetch code, run tests and deploy
create a freestyle project --> add source control management --> git --> add url of repo and credentials 
add first build step as --> invoke maven targets for building as clean test.
add second build step as --> execute shell -->for deployment
script: 
scp taget/app.war user@server:/path/to/deploy/
apply,save and build

9. Environment setup for Developers
usecase: provision a development VM with Ansible
create a freestyle project --> add buld step --> execute shell --> 
write script: 
ansible-playbook setup-dev.yml
apply,save and build now

10. custom scripting or Task Execution
usecase: Run a python scripting for data processing
create  a freestyle project --> add build steps --> execute shell 
script: python process_data.py
apply,save and build now

11. Integration with external tools 
usecase: Upload build artifacts to Artifactory
create a free style project --> add build step -> execute shell
wrire script: 
curl -u user:password -T target/app.jar "https://artifactory.example.com/repository/releases/"
apply,save and build now.

12. Simple proof of concept jobs
usecase: Test API connectivity
create a freestyle project --> add build step --> Execute shell 
write script: 
curl -X GET "https://api.example.com/status"
apply,save and build now