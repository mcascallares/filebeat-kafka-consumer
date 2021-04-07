# filebeat-kafka-consumer

This repo shows a quick example of HOWTO consume messages from Kafka using Filebeat as a consumer.

WIP!


## Requirements

- Docker


## Running it

1. Starting the environment

```
docker-compose up -d
```


2. Create a sample topic

```
kafka-topics --create \
    --bootstrap-server localhost:29092 \
    --replication-factor 1 \
    --partitions 2 \
    --topic my-topic
```

3. Produce sample data

```
kafka-console-producer  \
    --bootstrap-server localhost:29092 \
    --topic my-topic 
```
    