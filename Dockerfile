FROM openjdk:8
EXPOSE 8080
ADD target/docker-calculator.jar docker-calculator.jar
ENTRYPOINT ["java","-jar","/docker-calculator.jar"]
