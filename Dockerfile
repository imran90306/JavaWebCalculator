FROM ubuntu:20.04 AS build

# Prevents Ubuntu from asking for input during package installation (like timezone or yes/no questions).
ENV DEBIAN_FRONTEND=noninteractive  

RUN apt update -y
RUN apt install -y maven git openjdk-17-jdk

# Clone repo and build jar
RUN git clone https://github.com/imran90306/JavaWebCalculator.git
WORKDIR /JavaWebCalculator
RUN mvn clean package -DskipTests

# ---- Runtime Stage ----
FROM openjdk:17-jdk-slim
COPY --from=build /JavaWebCalculator/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
