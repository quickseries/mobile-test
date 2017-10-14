#!/bin/sh
#

git submodule update --recursive

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${DIR}/generate_objc_config.sh

set -e

echo "Building Core"
${DIR}/generate_objc_specific.sh `find ${SOURCE_DIR} -name '*.java'`
