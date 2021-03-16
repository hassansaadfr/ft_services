#/bin/bash

docker build srcs/mysql -t mysql
docker build srcs/wordpress -t wordpress42

kubectl create -f ./srcs/
