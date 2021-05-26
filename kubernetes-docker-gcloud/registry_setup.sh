#!/bin/bash
# run from gcloud console
# based on https://cloud.google.com/artifact-registry/docs/docker/quickstart#gcloud

gcloud artifacts repositories create quickstart-docker-repo --repository-format=docker \
--location=us-central1 --description="Docker repository"

gcloud artifacts repositories list

gcloud auth configure-docker us-central1-docker.pkg.dev --quiet




