source ~/anaconda3/etc/profile.d/conda.sh 2> /dev/null
conda activate deepfacelab 2> /dev/null
cd ..

export DFL_PYTHON="python3.6"
export DFL_WORKSPACE="workspace/"

if [ ! -d "$DFL_WORKSPACE" ]; then
    mkdir "$DFL_WORKSPACE"
    mkdir "$DFL_WORKSPACE/data_src"
    mkdir "$DFL_WORKSPACE/data_src/aligned"
    mkdir "$DFL_WORKSPACE/data_src/aligned_debug"
    mkdir "$DFL_WORKSPACE/data_dst"
    mkdir "$DFL_WORKSPACE/data_dst/aligned"
    mkdir "$DFL_WORKSPACE/data_dst/aligned_debug"
    mkdir "$DFL_WORKSPACE/model"
fi


export DFL_ROOT="./"
export DFL_SRC="./DeepFaceLab"


# set plugin path for QT, otherwise, the program may be terminated unexpectedly
tmp=`which python`
tmpPath=`dirname $(dirname $tmp) `/envs/deepfacelab/lib/python3.6/site-packages/PyQt5/Qt/plugins
export QT_QPA_PLATFORM_PLUGIN_PATH=$tmpPath
#echo $QT_QPA_PLATFORM_PLUGIN_PATH
export QT_DEBUG_PLUGINS="1"  # if the program may be terminated unexpectedly, it will output detailed debug info


export XNVIEWMP_PATH="XnView"