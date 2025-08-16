# Use lightweight JDK base image
FROM eclipse-temurin:17-jdk-jammy

# Set working directory
WORKDIR /app

# Copy the jar built by GitHub Actions (always renamed to app.jar)
COPY target/app.jar app.jar

# Expose application port
EXPOSE 8080

# Run the jar
ENTRYPOINT ["java", "-jar", "app.jar"]
