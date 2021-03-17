#!/bin/bash

kubectl delete --all services --namespace=metallb-system
kubectl delete --all deployments --namespace=metallb-system
kubectl delete --all pods --namespace=metallb-system

# minikube stop
