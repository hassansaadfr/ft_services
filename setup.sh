#/bin/bash

START=$(date +%s);

start_time=$(date)

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
  printf "\033[1;34m⌛️  Current Step $3\n\033[0m"
  printf "\033[1;32m$2  Build \e[4m$1\n\033[0m"
  docker build srcs/$1 -t hsaadaou/$1 | grep Step
  tput reset
  printf "\033[1;32m$2  Deploy \e[4m$1\n\033[0m"
  kubectl create -f srcs/$1.yaml
  kubectl get pods
}

deploy_metallb()
{
  printf "\033[1;32m🚏  Deploy \e[4mMetallb\n\033[0m"
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

tput reset

kubectl create -f srcs/dashboard.yaml >> /dev/null

kubectl create -f srcs/volumes.yaml >> /dev/null
kubectl create -f srcs/secrets.yaml >> /dev/null

printf "\033[1;32m🏗  Build \e[4mAlpine base image\n\033[0m"
docker build srcs/alpine_base -t hsaadaou/alpine_base | grep Step

tput reset

build_and_deploy "mysql" "🧠" "1/7"
build_and_deploy "influxdb" "💾" "2/7"
build_and_deploy "grafana" "📈" "3/7"
build_and_deploy "phpmyadmin" "📝" "4/7"
build_and_deploy "wordpress" "🛒" "5/7"
build_and_deploy "ftps" "🗂" "6/7"
build_and_deploy "nginx" "🚦" "7/7"

tput reset

eval $(minikube docker-env -u)

kubectl get pods

printf "\033[1;32m\e[4mAdmin dashboard token :\n\033[0m"

kubectl get secret -n kubernetes-dashboard $(kubectl get serviceaccount admin-user -n kubernetes-dashboard -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode

printf "\033[1;32m\n\nCopy the token and past it here https://$node_ip:8080\n\033[0m"

end_time=$(date)

printf "\033[1;34m\nStarted at: \e[4m$start_time\n\033[0m"
printf "\033[1;34mStarted at: \e[4m$end_time\n\033[0m"

END=$(date +%s);

printf "\033[1;34mElapsed time: "
echo $((END-START)) | awk '{printf "%d:%02d:%02d", $1/3600, ($1/60)%60, $1%60}'
printf "\n\033[0m"

printf "\033[1;32m🤩  Everything is up :\n\033[0m"
echo https://$node_ip
