FROM ubuntu:18.04
USER root
RUN apt-get update \
    && apt-get -y install openjdk-8-jdk \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

ENV APP_HOME /usr/local/chalktool/auth-service
RUN mkdir -p ${APP_HOME}
WORKDIR ${APP_HOME}
ARG JAR_FILE
COPY build/libs/auth-service-0.0.1.jar ${APP_HOME}/app.jar
EXPOSE 8080

ENTRYPOINT ["java", "-Dspring.profiles.active=prod", "-jar", "app.jar"]