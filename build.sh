#!/usr/bin/bash

build_path=$1
template_version=$2

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "============="
echo -e "=== BUILD ==="
echo -e "============="
echo -e "\n"

echo -e "[BUILD][ARGS] BUILD PATH: ${build_path}"
echo -e "[BUILD][ARGS] TEMPLATE VERSION: ${template_version}"

cd $build_path

# We build template
echo -e "\n"
echo -e "[BUILD] Building template-${template_version}..."
echo -e "\n"

make -j${REZ_BUILD_THREAD_COUNT}

echo -e "\n"
echo -e "[BUILD] Finished building template-${template_version}!"
echo -e "\n"
