#!/bin/bash

ENV_FILE=.env.dev

source $ENV_FILE
export $(cut -d= -f1 $ENV_FILE)

cat docker-compose.yaml | envsubst | docker-compose -p "personal" -f - up -d --force-recreate --no-build
