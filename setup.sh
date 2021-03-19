#/bin/bash

minikube start

minikubeip=$(minikube ip)

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

eval $(minikube -p minikube docker-env)

docker build srcs/mysql -t fortytwo/mysql
docker build srcs/wordpress -t fortytwo/wordpress
docker build srcs/phpmyadmin -t fortytwo/phpmyadmin
docker build srcs/nginx -t fortytwo/nginx

kubectl delete -f srcs

kubectl create -f srcs/volumes.yaml
kubectl create -f srcs/secrets.yaml
sed -e 's/minikubeip/'$minikubeip'/g' srcs/metallb/metallb.yaml | kubectl create -f -
kubectl create -f srcs/mysql.yaml
kubectl create -f srcs/wordpress.yaml
sed -e 's/IP_ADDR/'$minikubeip'/g' srcs/phpmyadmin.yaml | kubectl create -f -
kubectl create -f srcs/nginx.yaml

echo http://$minikubeip
