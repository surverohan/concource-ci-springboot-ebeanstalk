#!/bin/bash

set -euxo pipefail

pushd graphql-src/

mvn package -Dmaven.repo.local=.m2
cp target/*.jar ../build/graphql-poc.jar


popd

ls -lha build/
