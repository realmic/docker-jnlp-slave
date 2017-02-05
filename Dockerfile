FROM jenkinsci/jnlp-slave:2.62-alpine
MAINTAINER ccatlett2000@mctherealm.net

USER root
RUN apk add --no-cache docker
