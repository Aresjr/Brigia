FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /app
COPY . .

RUN mvn clean package

# FROM azul/zulu-openjdk-alpine:21
FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8009

# ENTRYPOINT ["sh", "-c", "java -jar app.jar"]
ENTRYPOINT ["java", "-Dnetworkaddress.cache.ttl=0", "-jar", "app.jar"]