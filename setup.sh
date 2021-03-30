#/bin/bash

minikube delete

check_brew()
{
  which -s brew
  if [[ $? != 0 ]] ; then
    # Install Homebrew
    printf "\033[1;32mInstall brew\n\033[0m"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

check_hyperkit()
{
  brew list hyperkit || brew install hyperkit
}

check_minikube()
{
  which minikube
  if [[ $? != 0 ]] ; then
    # Install Homebrew
    printf "\033[1;32mInstall minikube\n\033[0m"
    brew install minikube
  fi
}

build_and_deploy()
{
  printf "\033[1;32mBuild $1\n\033[0m"
  docker build srcs/$1 -t hsaadaou/$1 | grep Step
  tput reset
  printf "\033[1;32mDeploy $1\n\033[0m"
  kubectl create -f srcs/$1.yaml
}

deploy_metallb()
{
  printf "\033[1;32mDeploy Metallb\n\033[0m"
  kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
  kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
  kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
  sed -e 's/node_ip/'$1'/g' srcs/metallb/metallb.yaml | kubectl create -f -
}

run_minikube()
{
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
}

run_minikube

node_ip=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)

deploy_metallb $node_ip

eval $(minikube docker-env)

kubectl create -f srcs/dashboard.yaml

kubectl create -f srcs/volumes.yaml
kubectl create -f srcs/secrets.yaml

tput reset

docker build srcs/alpine_base -t hsaadaou/alpine_base | grep Step

build_and_deploy "mysql"
build_and_deploy "influxdb"
build_and_deploy "grafana"
build_and_deploy "phpmyadmin"
build_and_deploy "wordpress"
build_and_deploy "ftps"
build_and_deploy "nginx"

tput reset

eval $(minikube docker-env -u)

printf "\033[1;32mEverything is up :\n\033[0m"

echo https://$node_ip

printf "\033[1;32mAdmin dashboard token :\n\033[0m"

kubectl get secret -n kubernetes-dashboard $(kubectl get serviceaccount admin-user -n kubernetes-dashboard -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode

printf "\033[1;32m\nCopy token and past it here https://$node_ip:8080\n\033[0m"
