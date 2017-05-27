#!/usr/bin/env bash

docker-compose up -d

# get the node1 hostname
master=`docker exec -it dockerrabbitmqcluster_rabbitmq_1 hostname | tr -d '\r'`
docker-compose scale rabbitmq=3

# wait for 10 seconds for the nodes to boot
sleep 10

docker exec -it dockerrabbitmqcluster_rabbitmq_2 rabbitmqctl stop_app
docker exec -it dockerrabbitmqcluster_rabbitmq_2 rabbitmqctl join_cluster rabbit@${master}
docker exec -it dockerrabbitmqcluster_rabbitmq_2 rabbitmqctl start_app

docker exec -it dockerrabbitmqcluster_rabbitmq_3 rabbitmqctl stop_app
docker exec -it dockerrabbitmqcluster_rabbitmq_3 rabbitmqctl join_cluster rabbit@${master}
docker exec -it dockerrabbitmqcluster_rabbitmq_3 rabbitmqctl start_app
