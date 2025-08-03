# 🔨 Build Stage with Maven and JDK 17
FROM maven:3.9.6-eclipse-temurin-17-alpine AS build

# Set working directory
WORKDIR /opt/app

# Copy source code
COPY ./ /opt/app

# Build the project, skipping tests
RUN mvn clean install -DskipTests

# 🚀 Runtime Stage with JDK 17
FROM eclipse-temurin:17-jdk-alpine

# Copy the built JAR from the build stage
COPY --from=build /opt/app/target/*.jar app.jar

# Environment variables
ENV PORT=8081
EXPOSE $PORT

# Command to run the application
ENTRYPOINT ["java", "-jar", "-Xmx1024M", "-Dserver.port=${PORT}", "app.jar"]
