#!/bin/bash

if [[ -z "${HRNET_WEIGHTS_PATH}" ]]; then
    echo "Environment variable 'HRNET_WEIGHTS_PATH' does not exist."
    echo "Please set it ~/.bashrc using: 'export HRNET_WEIGHTS_PATH=/path/to/HRNET_WEIGHTS_PATH'"
    exit 1
fi

dataset_dir=""

while test $# -gt 0
do
    case "$1" in
        --run) COMMAND="./run.sh"
            ;;
        --dataset)
            dataset_dir="$2"
            echo "data directory:" $dataset_dir
            shift
            ;;
    esac
    shift
done

sudo docker run -it --rm --gpus all \
           --shm-size=512m \
           --volume=$(pwd):/hrnet:rw \
           -v $dataset_dir:/hrnet/imgs/test_imgs \
           -v $HRNET_WEIGHTS_PATH:/data \
           evroon/hrnet:latest \
           bash -c "$COMMAND"
