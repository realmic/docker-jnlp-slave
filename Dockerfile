FROM openjdk:8u111-jdk-alpine
MAINTAINER ccatlett2000@mctherealm.net

RUN apk add --no-cache docker curl

ENV HOME /home/jenkins
ARG VERSION=2.62

RUN mkdir /home/jenkins
RUN curl --create-dirs -sSLo /usr/share/jenkins/slave.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${VERSION}/remoting-${VERSION}.jar \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/slave.jar
RUN mkdir /home/jenkins/.jenkins
WORKDIR /home/jenkins

CMD java $JAVA_OPTS $JNLP_PROTOCOL_OPTS -cp /usr/share/jenkins/slave.jar hudson.remoting.jnlp.Main -headless
