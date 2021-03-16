#/bin/bash

eval $(minikube -p minikube docker-env)
docker build srcs/mysql -t fortytwo/mysql
docker build srcs/wordpress -t fortytwo/wordpress

kubectl delete -f srcs

kubectl create -f ./srcs/
