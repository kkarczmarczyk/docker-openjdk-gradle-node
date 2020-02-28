FROM openjdk:8-alpine

LABEL maintainer="Kamil Karczmarczyk <kkarczmarczyk@gmail.com>"

ENV GRADLE_VERSION=6.2.1
ENV GRADLE_HOME=/opt/gradle

WORKDIR /tmp

RUN apk --no-cache add curl libstdc++ nodejs npm

RUN curl -O --location --silent --show-error https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
    	&& unzip -q gradle-${GRADLE_VERSION}-bin.zip -d /opt \
    	&& ln -s /opt/gradle-${GRADLE_VERSION} /opt/gradle \
    	&& rm -f gradle-${GRADLE_VERSION}-bin.zip

ENV PATH $PATH:/opt/gradle/bin

WORKDIR /usr/app/

CMD ["/opt/gradle/bin/gradle", "--version"]
