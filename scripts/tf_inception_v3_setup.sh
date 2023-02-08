# Official tutorial setup for tensorflow

#!/bin/bash
set -ex

# Environment setup for TensorFlow
# https://developer.qualcomm.com/sites/default/files/docs/snpe/setup.html#setup_platform_libs
source $SNPE_ROOT/bin/envsetup.sh -t $TENSORFLOW_DIR

# Getting Inception v3
# https://developer.qualcomm.com/sites/default/files/docs/snpe/tutorial_setup.html
python $SNPE_ROOT/models/inception_v3/scripts/setup_inceptionv3.py -a ./tmp/inception_v3 -d
