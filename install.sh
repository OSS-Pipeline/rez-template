#!/usr/bin/bash

# Will exit the Bash script the moment any command will itself exit with a non-zero status, thus an error.
set -e

BUILD_PATH=$1
TEMPLATE_VERSION=${REZ_BUILD_PROJECT_VERSION}

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "==============="
echo -e "=== INSTALL ==="
echo -e "==============="
echo -e "\n"

echo -e "[INSTALL][ARGS] BUILD PATH: ${BUILD_PATH}"
echo -e "[INSTALL][ARGS] TEMPLATE VERSION: ${TEMPLATE_VERSION}"

cd ${BUILD_PATH}

# We install template
echo -e "\n"
echo -e "[INSTALL] Installing template-${TEMPLATE_VERSION}..."
echo -e "\n"

make -j${REZ_BUILD_THREAD_COUNT} install

echo -e "\n"
echo -e "[INSTALL] Finished installing template-${TEMPLATE_VERSION}!"
echo -e "\n"
