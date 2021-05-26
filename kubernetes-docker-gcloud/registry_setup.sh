#!/bin/bash
# run from gcloud console
# based on https://cloud.google.com/artifact-registry/docs/docker/quickstart#gcloud

gcloud artifacts repositories create quickstart-docker-repo --repository-format=docker \
--location=us-central1 --description="Docker repository"

gcloud artifacts repositories list

gcloud auth configure-docker us-central1-docker.pkg.dev --quiet

git clone https://github.com/nic-instruction/docker-kubernetes.git

cd docker-kubernetes/docker/project/sucessfull-attempt/

docker build . -t appsrv:v1

# $GOOGLE_CLOUD_PROJECT is the environmental variable that holds your current google cloud project ID

docker tag docker.io/library/appsrv:v1 \
us-central1-docker.pkg.dev/$GOOGLE_CLOUD_PROJECT/quickstart-docker-repo/appsrv:tag1

docker push us-central1-docker.pkg.dev/$GOOGLE_CLOUD_PROJECT/quickstart-docker-repo/appsrv:tag1

docker pull us-central1-docker.pkg.dev/$GOOGLE_CLOUD_PROJECT/quickstart-docker-repo/appsrv:tag1





