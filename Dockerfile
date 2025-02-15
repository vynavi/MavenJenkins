# Build stage: Use OpenJDK 17 and Maven to build the project
FROM maven:3.8.4-openjdk-17 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the project files into the container
COPY . /app

# Run the Maven build inside the container
RUN mvn clean install

# Run stage: Use OpenJDK 17 runtime to run the project
FROM openjdk:17-jre-slim

# Copy the generated .jar file from the build stage
COPY --from=build /app/target/maven-project-1.0-SNAPSHOT.jar /app/maven-project.jar

# Command to run the application
CMD ["java", "-jar", "/app/maven-project.jar"]
