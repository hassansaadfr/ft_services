#/bin/bash

docker build srcs/mysql -t mysql
docker build srcs/wordpress -t wp

kubectl create -f ./srcs/
