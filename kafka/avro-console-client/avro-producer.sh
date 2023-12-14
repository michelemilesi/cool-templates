#!/bin/bash
topic=$1
partition=$2

JAAS_FILE=<jaas file>
CONFIG_FILE=config.properties
CODEC=snappy

export KAFKA_OPTS="-Djava.security.auth.login.config=${JAAS_FILE}"
export SCHEMA_REGISTRY_OPTS="-Djava.security.auth.login.config=${JAAS_FILE}"

kafka-avro-console-producer  --bootstrap-server=${BOOTSTRAP_SERVER} --producer.config=${CONFIG_FILE} \ 
  --topic $topic --compression-codec $CODEC