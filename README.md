# filebeat-kafka-consumer

This repo shows a quick example of HOWTO consume messages from Kafka using Filebeat as a consumer. It comprises:
- A basic Kafka setup: Zookeeper, Broker.
- A basic Elasticsearch single-node, non-protected cluster, and a Kibana instance connecting to it
- Filebeat implementations
  - `filebeat-console` writing to STDOUT the messages received in the topic `my-topic` with its own consumer group id
  - `filebeat-es` writing to Elasticsearch the messages received in the topic `my-topic` with its own consumer group id

WIP!


## Requirements

- docker
- docker-compose
- kafka-console-producer (to produce sample data only)


## Data in motion 💪

1. Starting the environment

```
docker-compose up -d
```


2. Produce sample data for the topic `my-topic`

```
kafka-console-producer  \
    --bootstrap-server localhost:29092 \
    --topic my-topic
```

![Screenshot](https://github.com/mcascallares/filebeat-kafka-consumer/raw/main/assets/images/screenshot.png)

3. See consumed data in STDOUT

```
docker-compose logs -f filebeat-console
```

4. Scale consumers up in the same consumer group

```
docker-compose up --scale filebeat-console=3
```

5. See consumed data in Elasticsearch

```
curl "localhost:9200/filebeat*/_search"
```

6. Visualize data in kibana
- In the browser, go to localhost:5601
- Navigate `Manage` -> `Index patterns` -> `Create index pattern`
- In the index pattern name, type `filebeat*` - those are the indices to which Filebeat writes as default - and proceed
- Select `@timestamp` as the time field and create the index pattern
- In the top-left menu, go to `Analytics` -> `Discover` to check your data for this index pattern

7. Tear down
```
docker-compose down -v
```
