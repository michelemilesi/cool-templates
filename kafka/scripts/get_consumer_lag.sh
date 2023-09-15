#!/bin/bash
BOOTSTRAP_SERVER=<bootstrap brokers>
CONFIG_FILE=<config file>
JAAS_FILE=<jaas file>
# Target consumer group
GROUP=$1
# Target topic(s) (Accept: a grep RgeExp, complete or partial topic(s) name)
TOPIC=$2

export KAFKA_OPTS="-Djava.security.auth.login.config=${JAAS_FILE}"

kafka-consumer-group --bootstrap-server ${BOOTSTRAP_SERVER} --command-config ${CONFIG_FILE} \
  --describe --group ${GROUP} | grep ${TOPIC} | awk '{sum += $6} END {print strftime("%F %T"), sum}'
