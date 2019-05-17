FROM openjdk:8u212-jre-alpine3.9

ENV APP_HOME /usr/local/chalktool/auth-service
RUN mkdir -p ${APP_HOME}
WORKDIR ${APP_HOME}
ARG JAR_FILE
COPY build/libs/auth-service-0.0.1.jar ${APP_HOME}/app.jar
EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]