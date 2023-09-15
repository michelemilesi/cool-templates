#!/bin/bash
BOOTSTRAP_SERVER=<bootstrap brokers>
CONFIG_FILE=<config file>
JAAS_FILE=<jaas file>
SR_URL=<SCHEMA_REGISTRY_URL>

export SCHEMA_REGISTRY_OPTS="-Djava.security.auth.login.config=${JAAS_FILE}"

kafka-avro-console-consumer  --bootstrap-server=${BOOTSTRAP_SERVER} --consumer.config=$HOME/.kafka/admin.properties \ 
  --topic $1 --partition $2 --property print.timestamp=true --property print.key=true --property print.offset=true \
  --property print.partition=true --property print.headers=true --property print.value=false \
  --property  key.separator="!-----!" --property line.separator="!+++++!" --property headers.separator="!=====!" \
  --property key.converter=io.confluent.connect.avro.AvroConverter \
  --property key.converter.schema.registry.url="${SR_URL}" \
  --property key.converter.enhanced.avro.schema.support=true \
  --property key.converter.schemas.enable=true \
  --property value.converter=io.confluent.connect.avro.AvroConverter \
  --property value.converter.schema.registry.url="${SR_URL}" \
  --property value.converter.enhanced.avro.schema.support=true \
  --offset earliest --isolation-level read_committed | awk -v RS='!' 'print $0'
