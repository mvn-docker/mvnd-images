FROM {{BASE_IMAGE}}
MAINTAINER Marvin Herman Froeder <velobr@gmail.com>

COPY {{OS}}/install-{{JAVA_DISTRIBUTION}} /{{OS}}/install-{{JAVA_DISTRIBUTION}}

RUN set -x && \
  JAVA_DISTRIBUTION={{JAVA_DISTRIBUTION}} \
  JAVA_VERSION={{JAVA_VERSION}} \
  /{{OS}}/install-{{JAVA_DISTRIBUTION}}

COPY {{OS}}/install-maven /{{OS}}/install-maven

RUN set -x && \
  MAVEN_VERSION={{MAVEN_VERSION}} \
  {{OS}}/install-maven

RUN mkdir -p /source
WORKDIR /source

# create and downgrade to the `maven` user
ENV USER maven
COPY {{OS}}/create-user /{{OS}}/create-user
RUN /{{OS}}/create-user
USER ${USER}

CMD mvn
