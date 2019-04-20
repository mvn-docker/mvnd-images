#!/bin/bash

set -e
set -x

# poor man stack trace
err_report() {
    echo "Error on line $0 $1"
}
trap 'err_report $LINENO' ERR

if [[ "${TRAVIS_BRANCH}" == "master" ]]; then
    TAG="build-${TRAVIS_BUILD_NUMBER}";
    docker login -u ${DOCKER_USER} -p ${DOCKER_PASS};
    docker tag ${IMAGE} ${IMAGE}:${TAG};
    docker push ${IMAGE};
    docker push ${IMAGE}:${TAG};
fi
