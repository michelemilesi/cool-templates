#!/bin/bash

BOOTSTRAP_SERVER=<bootstrap brokers>
CONFIG_FILE=<config file>
JAAS_FILE=<jaas file>
# Comma separated broker ids
BROKERS=$1
# JSON file with topic list
TOPICS_FILE=$1
# Generated target reassignement file
REASSIGNEMENT_FILE=$2

export KAFKA_OPTS="-Djava.security.auth.login.config=${JAAS_FILE}"

kafka-reassign-partitions --bootstrap-server ${BOOTSTRAP_SERVER} \ 
  --command-config ${CONFIG_FILE} --broker-list ${BROKERS} \
  --generate --topics-to-move-json-file ${TOPICS_FILE} > ${REASSIGNEMENT_FILE}

kafka-reassign-partitions --bootstrap-server ${BOOTSTRAP_SERVER} \
  --command-config ${CONFIG_FILE} --execute --reassignment-json-file ${REASSIGNEMENT_FILE}


