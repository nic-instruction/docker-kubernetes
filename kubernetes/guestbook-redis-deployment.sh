#!/bin/bash

# automated version of: https://cloud.google.com/kubernetes-engine/docs/tutorials/guestbook
# mostly for reference to YAML files and workflow, so we can see it clearly
# to do: create kubernetes cluster via both terraform and gcloud and deploy our example app to it with redis backend and cloudsql backend

gcloud components install kubectl
#gcloud config set project project-id
#gcloud config set compute/zone compute-zone
gcloud container clusters create guestbook --num-nodes=4
gcloud container clusters list
gcloud container clusters describe guestbook
gcloud container clusters get-credentials guestbook

#local config deployment pulled from github
git clone https://github.com/GoogleCloudPlatform/kubernetes-engine-samples
cd kubernetes-engine-samples/guestbook
git checkout abbb383

# see other folder files for deployment yaml
kubectl apply -f redis-leader-deployment.yaml
kubectl get pods

# check logs
kubectl logs deployment/redis-leader

#service config
kubectl apply -f redis-leader-service.yaml

kubectl get service

kubectl apply -f redis-follower-deployment.yaml
kubectl get pods
kubectl logs deployment/redis-follower
kubectl apply -f redis-follower-service.yaml
kubectl get service

kubectl apply -f frontend-deployment.yaml

# verify replicas running by tag
kubectl get pods -l app=guestbook -l tier=frontend

kubectl apply -f frontend-service.yaml

kubectl get service frontend

#scale frontend
kubectl scale deployment frontend --replicas=5
kubectl get pods

# burn down
kubectl delete service frontend
gcloud compute forwarding-rules list
gcloud container clusters delete guestbook


