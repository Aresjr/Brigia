FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /app
COPY . .

RUN mvn clean package

FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE ${BACKEND_PORT}

ENTRYPOINT ["sh", "-c", "java -jar -Dserver.port=${BACKEND_PORT} app.jar"]