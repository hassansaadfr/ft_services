#/bin/bash

minikube delete

check_brew()
{
  which -s brew
  if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

check_hyperkit()
{
  brew list hyperkit || brew install hyperkit
}

check_minikube()
{
  which -s minikube
  if [[ $? != 0 ]] ; then
    # Install Homebrew
    brew install minikube
  fi
}

OS=$(uname -s)

check_minikube

if [ $OS = Darwin ]
then
  check_brew
  minikube start --driver=hyperkit
else
  minikube start
fi

minikube kubectl -- get pods -A

minikube addons enable dashboard
minikube addons enable metrics-server

node_ip=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

sed -e 's/node_ip/'$node_ip'/g' srcs/metallb/metallb.yaml | kubectl create -f -

eval $(minikube docker-env)

docker build srcs/mysql -t fortytwo/mysql
docker build srcs/influxdb -t fortytwo/influxdb
docker build srcs/grafana -t fortytwo/grafana
docker build srcs/wordpress -t fortytwo/wordpress
docker build srcs/phpmyadmin -t fortytwo/phpmyadmin
docker build srcs/nginx -t fortytwo/nginx
docker build srcs/ftps -t fortytwo/ftps

kubectl create -f srcs/volumes.yaml
kubectl create -f srcs/secrets.yaml
kubectl create -f srcs/mysql.yaml
kubectl create -f srcs/influxdb.yaml
kubectl create -f srcs/grafana.yaml
kubectl create -f srcs/nginx.yaml
kubectl create -f srcs/wordpress.yaml
kubectl create -f srcs/phpmyadmin.yaml
kubectl create -f srcs/ftps.yaml

echo "Everything is up: "
echo http://$node_ip

echo "Kubernetes dashboard url:"
minikube dashboard --url=true
