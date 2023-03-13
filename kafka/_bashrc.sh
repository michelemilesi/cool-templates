export KAFKA_OPTS="-Djava.security.auth.login.config=$HOME/.kafka/jaas.conf"

BOOTSTRAP_SERVER="<broker1>:9094"
BOOTSTRAP_SERVER="$BOOTSTRAP_SERVER,<broker2>:9094"
BOOTSTRAP_SERVER="$BOOTSTRAP_SERVER,<broker3>:9094"
export BOOTSTRAP_SERVER

# User specific aliases and functions
alias kt='kafka-topics --bootstrap-server=${BOOTSTRAP_SERVER} --command-config=$HOME/.kafka/admin.properties'
alias kf='kafka-features --bootstrap-server=${BOOTSTRAP_SERVER} --command-config=$HOME/.kafka/admin.properties'
alias kcg='kafka-consumer-groups --bootstrap-server=${BOOTSTRAP_SERVER} --command-config=$HOME/.kafka/admin.properties'
alias kcc='kafka-console-consumer --bootstrap-server=${BOOTSTRAP_SERVER} --consumer.config=$HOME/.kafka/admin.properties'
alias kacls='kafka-acls --bootstrap-server=${BOOTSTRAP_SERVER} --command-config=$HOME/.kafka/admin.properties'
alias kconfigs='kafka-configs --bootstrap-server=${BOOTSTRAP_SERVER} --command-config=$HOME/.kafka/admin.properties'

alias koffset='kafka-run-class kafka.tools.GetOffsetShell --bootstrap-server ${BOOTSTRAP_SERVER} --command-config=$HOME/.kafka/admin.properties'
