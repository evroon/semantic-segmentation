#!/bin/bash

python3 -m runx.runx scripts/dump_folder.yml -i

LOGDIR=$(ls -td logs/dump_folder/*/ | head -1)
cp $LOGDIR/*_prediction.png /hrnet/imgs/test_imgs/hrnet/
