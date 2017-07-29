#!/bin/bash

# If himond is running, lets make sure its killed with fire
# We do not want multiple processes running on the same host
if [[ ! -z $(ps -AF |grep "root" |grep "himond" |awk '{print $2}') ]]
then
  sudo kill $(ps -AF |grep "root" |grep "himond" |awk '{print $2}');
  sleep 10;
fi

# Create a container volume to persist our Postgres data
if [[ -z $(docker ps -a |grep pgdata_grafana |awk '{print $1}') ]]
then
  docker create -v /dbdata --name pgdata_grafana postgres:alpine;
fi

# Tear down pre-existing stacks
docker-compose -f ../docker-compose.yml down;

# Compose up our stack!
docker-compose -f ../docker-compose.yml up &

# Wait 10 seconds
sleep 10;

# Launch himond and start sending metrics to Graphite/StatsD
sudo ./himond localhost 8125 wlp3s0;

