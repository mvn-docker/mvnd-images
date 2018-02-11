FROM {{BASE_IMAGE}}
MAINTAINER Marvin Herman Froeder <velobr@gmail.com>

COPY {{OS}}/install-{{JAVA_DISTRIBUTION}} /{{OS}}/install-{{JAVA_DISTRIBUTION}}

RUN set -x && \
  JAVA_DISTRIBUTION={{JAVA_DISTRIBUTION}} \
  JAVA_VERSION={{JAVA_VERSION}} \
  /{{OS}}/install-{{JAVA_DISTRIBUTION}}

COPY {{OS}}/install-maven /{{OS}}/install-maven

RUN set -x && \
  {{OS}}/install-maven

WORKDIR /source

CMD mvn
