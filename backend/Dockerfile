FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY . .
RUN mvn clean package

FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app

RUN apk add --no-cache curl bash

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8009

ENTRYPOINT ["java", "-jar", "app.jar"]