FROM alpine:3.15.5

RUN  apk update \
    && apk upgrade \
    && apk add ca-certificates \
    && update-ca-certificates \
    && apk add git \
    && apk add bash \
    && apk add curl \
    && apk add wget \
    && apk fetch openjdk7 \
    && apk add openjdk7

RUN wget https://services.gradle.org/distributions/gradle-2.10-bin.zip -P /tmp
RUN unzip -d /opt/gradle /tmp/gradle-2.10-bin.zip
ENV PATH "$PATH:/usr/lib/jvm/java-1.7-openjdk/bin:/opt/gradle/gradle-2.10/bin"