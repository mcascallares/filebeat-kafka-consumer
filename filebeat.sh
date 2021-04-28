#!/bin/bash

echo "Configuring Elasticsearch (pipelines and templates), and Kibana (patterns, views and dashboards)"

docker run --rm \
    --network `basename $(pwd)`_default \
    --volume="$(pwd)/filebeat-es.yml:/usr/share/filebeat/filebeat.yml:ro" \
    docker.elastic.co/beats/filebeat:7.12.1 -e -strict.perms=false setup

echo "Launching filebeat"

docker run -d \
    --network `basename $(pwd)`_default \
    --user=root \
    --volume="$(pwd)/filebeat-es.yml:/usr/share/filebeat/filebeat.yml:ro" \
    --volume="/var/run/docker.sock:/var/run/docker.sock:ro" \
    --volume="/var/lib/docker/containers:/var/lib/docker/containers:ro" \
    docker.elastic.co/beats/filebeat:7.12.1 -e -strict.perms=false

