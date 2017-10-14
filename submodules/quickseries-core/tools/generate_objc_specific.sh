#!/bin/sh
#

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${DIR}/generate_objc_config.sh

# Generate prefixes file
${DIR}/generate_objc_prefix.sh

# Convert Java to ObjC
mkdir ${GENERATED_FILES_DIR_TEMP} >&- 2>&-
${j2objc} -sourcepath ${SOURCE_DIR} -classpath ${SCRATCH_SOURCE_DIR} -d ${GENERATED_FILES_DIR_TEMP} -encoding UTF-8 -q -Werror --batch-translate-max=4096 --doc-comments --generate-deprecated -J-Xmx2G --no-package-directories --prefixes ${DIR}/prefixes.properties --strip-gwt-incompatible --strip-reflection -use-arc $@

# Remove files that are not generated anymore, copy newly generated files and, finally, copy modified files
mkdir ${GENERATED_FILES_DIR} >&- 2>&-
diff -rq ${GENERATED_FILES_DIR_TEMP} ${GENERATED_FILES_DIR} | grep -E "^Only in ${GENERATED_FILES_DIR}:" | sed -n 's/://p' | awk '{print $3"/"$4}' | xargs -I {} rm -rv {}
diff -rq ${GENERATED_FILES_DIR_TEMP} ${GENERATED_FILES_DIR} | grep -E "^Only in ${GENERATED_FILES_DIR_TEMP}:" | sed -n 's/://p' | awk '{print $3"/"$4}' | xargs -I {} cp -rv {} ${GENERATED_FILES_DIR}
diff -rq ${GENERATED_FILES_DIR_TEMP} ${GENERATED_FILES_DIR} | cut -f2 -d' ' | xargs -I {} cp -rv {} ${GENERATED_FILES_DIR}
