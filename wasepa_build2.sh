#!/bin/sh
docker run -id -p 27017:27017 --privileged \
	-v ~/workspace/data:/data \
	--name wasepa_mongo \
	mongo:latest
#set up rails server and make a link to mongo server
docker run -id --name wasepa_rails \
	--link wasepa_mongo:wasepa_mongo \
	sivertigo/rails_test1 
	#-v ~/workspace/mongo-test/wasepa_tomizawa/mongo:/mongo \
	#-w /mongo \
	
