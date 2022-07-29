FROM alpine:3.15.5

RUN  apk update \
    && apk upgrade \
    && apk add ca-certificates \
    && update-ca-certificates \
    && apk add git \
    && apk add bash \
    && apk add curl \
    && apk add wget \
    && apk add zip \
    && apk add unzip \
    && apk add --no-cache libstdc++

RUN mkdir -p /home/gradle/.gradle \
    && adduser -h /home/gradle -s /bin/bash -u 1001 -D gradle

# add Azul's public key
RUN wget -P /etc/apk/keys/ \
    https://cdn.azul.com/public_keys/alpine-signing@azul.com-5d5dc44c.rsa.pub

# add the Azul APK repository
RUN echo "https://repos.azul.com/zulu/alpine" | tee -a /etc/apk/repositories     
RUN apk update \
    && apk add zulu8-jdk

RUN wget https://services.gradle.org/distributions/gradle-2.10-bin.zip -P /tmp
RUN unzip -d /opt/gradle /tmp/gradle-2.10-bin.zip
ENV GRADLE_USER_HOME /home/gradle/.gradle
ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV PATH "$PATH:${JAVA_HOME}/bin:/opt/gradle/gradle-2.10/bin"