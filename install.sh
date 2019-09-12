#!/usr/bin/bash

build_path=$1
template_version=$2

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "==============="
echo -e "=== INSTALL ==="
echo -e "==============="
echo -e "\n"

echo -e "[INSTALL][ARGS] BUILD PATH: ${build_path}"
echo -e "[INSTALL][ARGS] TEMPLATE VERSION: ${template_version}"

cd $build_path

# We finally install template
echo -e "\n"
echo -e "[INSTALL] Installing template-${template_version}..."
echo -e "\n"

make -j${REZ_BUILD_THREAD_COUNT} install

echo -e "\n"
echo -e "[INSTALL] Finished installing template-${template_version}!"
echo -e "\n"
