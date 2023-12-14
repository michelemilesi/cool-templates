#!/bin/bash
topic=$1
partition=$2
group=$3

JAAS_FILE=<jaas file>
CONFIG_FILE=config.properties

export KAFKA_OPTS="-Djava.security.auth.login.config=${JAAS_FILE}"
export SCHEMA_REGISTRY_OPTS="-Djava.security.auth.login.config=${JAAS_FILE}"

kafka-avro-console-consumer  --bootstrap-server=${BOOTSTRAP_SERVER} --consumer.config=${CONFIG_FILE} \ 
  --topic $topic --partition $partition --group $group \
  --offset earliest --isolation-level read_committed | awk -v RS='!' 'print $0'