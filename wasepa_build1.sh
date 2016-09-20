#!/bin/sh
docker run -id -v ~/workspace/data:/data --name wasepa_data busybox
#set up mongo server and portforward 
docker run -id -p 27017:27017 --volumes-from wasepa_data --name wasepa_mongo mongo:latest
#set up rails server and make a link to mongo server
docker run -id -v ~/workspace/mongo-test/wasepa_tomizawa/mongo:/mongo -w /mongo --link wasepa_mongo:wasepa_mongo sivertigo/rails_test1 
