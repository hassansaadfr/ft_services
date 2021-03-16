#!/bin/bash

kubectl delete --all services --namespace=default
kubectl delete --all deployments --namespace=default
kubectl delete --all pods --namespace=default
