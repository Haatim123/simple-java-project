FROM openjdk:8-jdk-slim
WORKDIR /app 
COPY target/works-with-heroku.war /app/works-with-heroku.war
EXPOSE 8081
CMD ["Java", "-jar", "jetty-runner.jar", "/app/works-with-heroku.war"]