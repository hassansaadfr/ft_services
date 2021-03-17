#/bin/bash

# minikube start

# kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml

eval $(minikube -p minikube docker-env)

docker build srcs/mysql -t fortytwo/mysql
docker build srcs/wordpress -t fortytwo/wordpress
docker build srcs/phpmyadmin -t fortytwo/phpmyadmin
docker build srcs/nginx -t fortytwo/nginx

kubectl delete -f srcs

kubectl create -f ./srcs/

