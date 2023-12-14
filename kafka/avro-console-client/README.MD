# Avro console consumer

## CLI parameters
| Parameter | Required | Script parameter | Default | Description |
| --- | --- | --- | --- | --- |
| topic | | $1 | | The topic to consume on. |
| partition | | $2 | | The partition to consume from. Consumption starts from the end of the partition unless '--offset' is specified. |
| group | | $3 | | The consumer group id of the consumer. |
| bootstrap-server | Yes | In script | The server(s) to connect to. |
| isolation-level | | In script | read_committed | Set to read_committed in order to filter out transactional messages which are not committed. Set to read_uncommitted to read all messages. |
| offset | | In script | earliest | The offset to consume from (a non-negative number), or 'earliest' which means from beginning, or 'latest' which means from end. |
| consumer.config | | In Script | | Consumer config properties file." |
| include | | No | | Regular expression specifying list of topics to include for consumption. |
| consumer-property | | No | | A mechanism to pass user-defined properties in the form key=value to the consumer. |
| property | | No | | The properties to initialize the message formatter |
| from-beginning | | No | | If the consumer does not already have an established offset to consume from, start with the earliest message present in the log rather than the latest message. |
| max-messages | | No | | The maximum number of messages to consume before exiting. If not set, consumption is continual. |
| timeout-ms | | No | | If specified, exit if no message is available for consumption for the specified interval. |
| skip-message-on-error | | No | | If there is an error when processing a message, skip it instead of halt. |
| enable-systest-events | | No | | Log lifecycle events of the consumer in addition to logging consumed messages. (This is specific for system tests.) |



## Default property
| Property | Values | Note |
| --- | --- | --- |
| print.timestamp | true, false | |
| print.key | true, false | |
| print.offset | true, false | |
| print.partition | true, false | |
| print.headers | true, false | |
| print.value | true, false |
| key.separator | <key.separator> | |
| line.separator | <line.separator> | |
| headers.separator | <line.separator> | |
| null.literal | <null.literal> | |
| key.deserializer | <key.deserializer> | |
| value.deserializer | <value.deserializer> | |
| header.deserializer | <header.deserializer> | |
| key.deserializer.property | | Users can pass customized properties for their deserializer formatter |
| value.deserializer.property | | Users can pass customized properties for their deserializer formatter |
| header.deserializer.property | | Users can pass customized properties for their deserializer formatter |

# Avro console producer

## CLI parameters
| Parameter | Required | Script parameter | Default | Description |
| --- | --- | --- | --- | --- |
| topic | Yes | $1 | | The topic id to produce messages to. | 
| bootstrap-server | Yes | In script| | The server(s) to connect to. The broker list string in the form HOST1:PORT1,HOST2:PORT2.|
| sync | | No| | If set message send requests to the brokers are synchronously, one at a time as they arrive.|
| compression-codec | | In script | snappy | The compression codec: either 'none', 'gzip', 'snappy', 'lz4', or 'zstd'. If specified without value, then it defaults to 'gzip'|
| batch-size | | No | 16 * 1024 | Number of messages to send in a single batch if they are not being sent synchronously|
| message-send-max-retries | | No | 3 | Brokers can fail receiving the message for multiple reasons, and being unavailable transiently is just one of them. This property specifies the number of retries before the producer give up and drop this message. |
| retry-backoff-ms | | No | 100 | Before each retry, the producer refreshes the metadata of relevant topics. Since leader election takes a bit of time, this property specifies the amount of time that the producer waits before refreshing the metadata. |
| timeout | | No | 1000 | If set and the producer is running in asynchronous mode, this gives the maximum amount of time a message will queue awaiting sufficient batch size. The value is given in ms. |
| request-required-acks | | No | -1 | The required `acks` of the producer requests |
| request-timeout-ms | | No | 1500  | The ack timeout of the producer requests. Value must be non-negative and non-zero. |
| metadata-expiry-ms | | No | 5*60*1000L | The period of time in milliseconds after which we force a refresh of metadata even if we haven't seen any leadership changes. |
| max-block-ms | | No | 60*1000L | The max time that the producer will block for during a send request. |
| max-memory-bytes | | No | 32 * 1024 * 1024L | The total memory used by the producer to buffer records waiting to be sent to the server. |
| max-partition-memory-bytes | | No | 16 * 1024 | The buffer size allocated for a partition. When records are received which are smaller than this size the producer will attempt to optimistically group them together until this size is reached.  |
| line-reader | | No | | The class name of the class to use for reading lines from standard in. By default each line is read as a separate message. |
| socket-buffer-size | | No | 1024*100 | The size of the tcp RECV size. |
| property | | No | | A mechanism to pass user-defined properties in the form key=value to the message reader. This allows custom configuration for a user-defined message reader. |
| reader-config | | No | | Config properties file for the message reader. Note that property takes precedence over this config. |
| producer-property | | No | | A mechanism to pass user-defined properties in the form key=value to the producer. |
| producer.config | | In script | | Producer config properties file. Note that producer-property takes precedence over this config. |

## Default property
| Property | Default | Note |
| --- | --- | --- |
| parse.key | false | |
| parse.headers | false | |
| ignore.error | false | |
| key.separator | \t | |
| headers.delimiter | \t | |
| headers.separator | , | | 
| headers.key.separator | : | |
| null.marker | |  When set, any fields (key, value and headers) equal to this will be replaced by null |

## Parsing behaviour
| Condition | Input format |
| --- | --- |
| parse.headers=true and parse.key=true | "h1:v1,h2:v2...\tkey\tvalue" |
| parse.key=true | "key\tvalue" |
| parse.headers=true |  "h1:v1,h2:v2...\tvalue" |

