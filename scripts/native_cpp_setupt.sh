# Official tutorial setup for native cpp API

#!/bin/bash
set -ex

# Building the C++ application (x86 Linux)
# https://developer.qualcomm.com/sites/default/files/docs/snpe/cplus_plus_tutorial.html
cd $SNPE_ROOT/examples/NativeCpp/SampleCode
export CXX=g++
make -f Makefile.x86_64-linux-clang

# Run `snpe-sample` on tensorflow model (inception_v3)
# Make sure you had already run `./tf_inception_v3_setup.sh`
cd $SNPE_ROOT/models/inception_v3/data/
$SNPE_ROOT/examples/NativeCpp/SampleCode/obj/local/x86_64-linux-clang/snpe-sample -b ITENSOR -d ../dlc/inception_v3.dlc -i target_raw_list.txt -o output

# Show model's output
python $SNPE_ROOT/models/inception_v3/scripts/show_inceptionv3_classifications.py -i target_raw_list.txt -o output/ -l imagenet_slim_labels.txt
