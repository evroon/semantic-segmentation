#!/bin/bash

if [[ -z "${HRNET_WEIGHTS_PATH}" ]]; then
    echo "Environment variable 'HRNET_WEIGHTS_PATH' does not exist."
    echo "Please set it ~/.bashrc using: 'export HRNET_WEIGHTS_PATH=/path/to/HRNET_WEIGHTS_PATH'"
    exit 1
fi

sudo docker run -it --rm --gpus all \
           --shm-size=512m \
           --volume=$(pwd):/hrnet:rw \
           -v $HRNET_WEIGHTS_PATH:/data \
           evroon/hrnet:latest
