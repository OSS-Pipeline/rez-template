#!/usr/bin/bash

# Will exit the Bash script the moment any command will itself exit with a non-zero status, thus an error.
set -e

EXTRACT_PATH=$1
BUILD_PATH=$2
INSTALL_PATH=${REZ_BUILD_INSTALL_PATH}
TEMPLATE_VERSION=${REZ_BUILD_PROJECT_VERSION}

# We print the arguments passed to the Bash script.
echo -e "\n"
echo -e "================="
echo -e "=== CONFIGURE ==="
echo -e "================="
echo -e "\n"

echo -e "[CONFIGURE][ARGS] EXTRACT PATH: ${EXTRACT_PATH}"
echo -e "[CONFIGURE][ARGS] INSTALL PATH: ${INSTALL_PATH}"
echo -e "[CONFIGURE][ARGS] TEMPLATE VERSION: ${TEMPLATE_VERSION}"

# This is a basic configure script, but it is possible to extend it and add more steps if necessary.
# One such example can be found in the "rez-gcc" project.

# We run the configuration script of template.
echo -e "\n"
echo -e "[CONFIGURE] Running the configuration script from template-${TEMPLATE_VERSION}..."
echo -e "\n"

# This is the most common setup, where we use a "configure" script coming with
# the project in order to setup things up before using make on it.
if [ -d ${BUILD_PATH} ]; then
    cd ${BUILD_PATH}
else
    # We create the same hierarchy as the one set in "BUILD_DIR" from CMakeLists.txt from here,
    # in order to make sure that the hierarchy is not affected by the CMake archive extraction script
    # in case we are creating the BUILD_DIR hierarchy in advance.
    mkdir -p ${BUILD_PATH}
    cd ${BUILD_PATH}

    ${EXTRACT_PATH}/configure --prefix=${INSTALL_PATH}
fi

echo -e "\n"
echo -e "[CONFIGURE] Finished configuring template-${TEMPLATE_VERSION}!"
echo -e "\n"
