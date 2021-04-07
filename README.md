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


2. Produce sample data

```
kafka-console-producer  \
    --bootstrap-server localhost:29092 \
    --topic my-topic 
```


3. See consumed data in STDOUT

```
docker-compose logs -f filebeat
```


4. Tear down
```
docker-compose down -v
```

    