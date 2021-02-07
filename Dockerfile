#######################################
FROM maven:3.6.1-jdk-8 AS dependency
WORKDIR /app
COPY pom.xml /app/
RUN mvn -e -B dependency:resolve
COPY . /app
#######################################
FROM dependency AS test
RUN mvn test
#######################################
FROM dependency AS builder
RUN mvn -e -B package
#######################################
FROM openjdk:8-jre-alpine AS run
WORKDIR /app
COPY --from=builder /app/target/*-jar-with-dependencies.jar /app/app.jar
EXPOSE 8080
CMD [ "java", "-jar", "/app/app.jar" ]
#######################################


