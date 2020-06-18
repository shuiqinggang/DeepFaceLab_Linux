#!/bin/sh

dirname=`readlink -e "$0"`
dirname=`dirname "$dirname"`
export LD_LIBRARY_PATH="$dirname/lib:$dirname/Plugins:$LD_LIBRARY_PATH"
export QT_PLUGIN_PATH="$dirname/lib:$QT_PLUGIN_PATH"
exec "$dirname/XnView" "$@"
