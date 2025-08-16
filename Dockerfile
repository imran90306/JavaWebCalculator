# Step 1: Use Maven image to build the JAR
FROM maven:3.9.5-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Step 2: Run the JAR with a slim JDK image
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app
# copy JAR from build stage
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
