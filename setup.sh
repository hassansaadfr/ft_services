#/bin/bash

minikube delete

OS=$(uname -s)
if [ $OS = Darwin ]
then
  minikube start --driver=hyperkit
else
  minikube start
fi

minikube kubectl -- get pods -A

minikube addons enable metrics-server
minikube addons enable dashboard

node_ip=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

sed -e 's/node_ip/'$node_ip'/g' srcs/metallb/metallb.yaml | kubectl create -f -

eval $(minikube docker-env)

docker build srcs/mysql -t fortytwo/mysql
docker build srcs/wordpress -t fortytwo/wordpress
docker build srcs/phpmyadmin -t fortytwo/phpmyadmin
docker build srcs/nginx -t fortytwo/nginx
docker build srcs/ftps -t fortytwo/ftps

kubectl delete -f srcs

kubectl create -f srcs/volumes.yaml
kubectl create -f srcs/secrets.yaml
kubectl create -f srcs/mysql.yaml
kubectl create -f srcs/nginx.yaml
kubectl create -f srcs/wordpress.yaml
kubectl create -f srcs/phpmyadmin.yaml
kubectl create -f srcs/ftps.yaml

echo "cluster ip: "
echo http://$node_ip

minikube dashboard &
