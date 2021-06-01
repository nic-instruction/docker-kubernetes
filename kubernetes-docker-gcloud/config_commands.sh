#!/bin/bash
terraform init
terraform plan
terraform deploy

gcloud container clusters list
gcloud container clusters describe my-app-cluster


kubectl apply -f appsrv-php.yaml
kubectl get pods

kubectl apply -f appsrv-php-service.yaml
kubectl get service

kubectl apply -f load-balancer.yaml
kubectl get service load-balancer


kubectl scale deployment frontend --replicas=5

kubectl delete service load-balancer

terraform destroy
