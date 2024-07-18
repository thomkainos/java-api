# Specify the base image
FROM maven:latest

# Set the working directory inside the container
WORKDIR /code

# Copy the current directory's contents into the container at /code
COPY . /code

# Commands to run during the build (compile and package the application)
RUN mvn clean install -DskipTests=true

# Informs Docker that the container listens on port 8080 at runtime.
EXPOSE 8080

# Commands to execute when a container is started
CMD ["java", "-jar", "/code/target/JavaWebService-1.0-SNAPSHOT.jar", "server", "/code/config.yml"]

ARG DB_HOST
ENV DB_HOST ${DB_HOST}

ARG DB_USERNAME
ENV DB_USERNAME ${DB_USERNAME}

ARG DB_PASSWORD
ENV DB_PASSWORD ${DB_PASSWORD}

ARG DB_NAME
ENV DB_NAME ${DB_NAME}