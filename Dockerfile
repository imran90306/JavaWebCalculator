# Use official Tomcat image with JDK 17
FROM tomcat:9.0-jdk17-temurin

# Set working directory inside the container
WORKDIR /usr/local/tomcat/webapps/

# Remove default ROOT app (optional)
RUN rm -rf ROOT

# Copy WAR from build into Tomcat's webapps folder
COPY target/*.war ROOT.war

# Expose port 8080 for Tomcat
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
