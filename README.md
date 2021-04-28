# filebeat-kafka-consumer

This repo shows a quick example of HOWTO consume messages from Kafka using Filebeat as a consumer. It comprises:
- A basic Kafka setup: Zookeeper, Broker.
- A basic Elasticsearch single-node, non-protected cluster, and a Kibana instance connecting to it
- Filebeat implementations
  - `filebeat-es` collecting logs from the 'container' input and shipping logs to Elasticsearc

WIP!


## Requirements

- docker in a Linux environment (needed to access container logs)
- docker-compose
- kafka-console-producer (to produce sample data only)


## Data in motion 💪

1. Starting the environment

```
docker-compose up -d
```

2. Starting filebeat

```
./filebeat.sh
```

3. See consumed data in Elasticsearch

```
curl "localhost:9200/filebeat*/_search"
```

4. Visualize data in kibana
- In the browser, go to localhost:5601
- Navigate `Manage` -> `Index patterns` -> `Create index pattern`
- In the index pattern name, type `filebeat*` - those are the indices to which Filebeat writes as default - and proceed
- Select `@timestamp` as the time field and create the index pattern
- In the top-left menu, go to `Analytics` -> `Discover` to check your data for this index pattern

5. Tear down
```
docker stop `docker ps -a -q`
docker rm `docker ps -a -q`
```
