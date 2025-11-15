# Stage 1: Build the application using Maven and Java 21
FROM maven:3.9.4-eclipse-temurin-21-alpine AS build
WORKDIR /app

# Copy Maven config and source code
COPY pom.xml .
COPY src ./src

# Download dependencies (cached)
RUN mvn dependency:copy-dependencies

# Build the Spring Boot project
RUN mvn -X package -DskipTests

# Stage 2: Create a lightweight runtime image
FROM eclipse-temurin:21-alpine
WORKDIR /app

# Copy the built JAR from stage 1
COPY --from=build /app/target/*.jar studentmarkservice.jar

# Application runs on port 8100
EXPOSE 8100

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "studentmarkservice.jar"]
