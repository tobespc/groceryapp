#!/bin/bash
## docker-push secret used to push images to dockerhub
post_data='{
    "name": "docker-push",
    "type": "userpass",
    "username": "'"${DOCKERHUB_USERNAME}"'",
    "password": "'"${DOCKERHUB_PASSWORD}"'",
    "url": {"tekton.dev/docker-0": "https://index.docker.io/v1/"},
    "serviceaccount": "default"
}'
curl -X POST --header Content-Type:application/json -d "$post_data" http://localhost:31001/v1/namespaces/default/credentials
echo 'created docker-push'