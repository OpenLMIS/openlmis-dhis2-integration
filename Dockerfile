FROM openlmis/service-base:7

COPY build/libs/*.jar /service.jar
COPY src/main/resources/db/base-data/*.csv /demo-data/
COPY build/schema /schema

COPY build/consul /consul
WORKDIR /consul

RUN npm install --production

WORKDIR /
