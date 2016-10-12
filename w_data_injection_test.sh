#!/bin/sh
docker run -id -v ~/workspace/data:/data --name wasepa_data busybox
docker run -d -it -p 27017:27017 --privileged --volumes-from wasepa_data --name wasepa_mongo mongo:latest
docker exec -it wasepa_mongo ip addr add 172.17.0.8/24 dev eth0
docker run -d -it -v ~/workspace/mongo-test/wasepa_tomizawa/mongo:/mongo -w /mongo --link wasepa_mongo:wasepa_mongo sivertigo/rails_test1 ruby mongo.rb generated_json10

