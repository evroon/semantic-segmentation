#!/bin/bash

python3 -m runx.runx scripts/dump_folder.yml -i

LOGDIR=$(ls -td /hrnet/logs/dump_folder/* | head -1)
mkdir -p /hrnet/imgs/test_imgs/hrnet
cp $LOGDIR/best_images/*_prediction.png /hrnet/imgs/test_imgs/hrnet/
