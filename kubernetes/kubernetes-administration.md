# Useful Administrative Commands

Notes based on tutorials from 
* https://cloud.google.com/kubernetes-engine/docs/tutorials/guestbook
* https://kubernetes.io/docs/tutorials/kubernetes-basics/explore/explore-intro/

```
kubectl version
```
```
kubectl get nodes

kubectl cluster-info

```

## Deployment Configuration
Once the application instances are created, a **Kubernetes Deployment Controller** continuously monitors those instances. If the Node hosting an instance goes down or is deleted, the Deployment controller replaces the instance with an instance on another Node in the cluster. 

Example:
```
kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1
```
list deployments
```
kubectl get deployments
```
create a proxy to expose environment
```
kubectl proxy
```
query the api through the proxy
```
curl http://localhost:8001/version
```

The API server will automatically create an endpoint for each pod, based on the pod name, that is also accessible through the proxy.

First we need to get the Pod name, and we'll store in the environment variable POD_NAME:

```
export POD_NAME=$(kubectl get pods -o go-template --template '{{rnge .items}}{{.metadata.name}}{{"\n"}}{{end}}')
```

## Services
To expose without a proxy, create a service (liminiting the scope for security)
