#!/usr/bin/bash

extract_path=$1
install_path=$2
template_version=$3

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "================="
echo -e "=== CONFIGURE ==="
echo -e "================="
echo -e "\n"

echo -e "[CONFIGURE][ARGS] EXTRACT PATH: ${extract_path}"
echo -e "[CONFIGURE][ARGS] INSTALL PATH: ${install_path}"
echo -e "[CONFIGURE][ARGS] TEMPLATE VERSION: ${template_version}"

# This is a basic configure script, but it is possible to extend it and add more steps if necessary.
# One such example can be found in the "rez-gcc" project.

cd ${extract_path}

# We run the configuration script of template
echo -e "\n"
echo -e "[CONFIGURE] Running the configuration script from template-${template_version}..."
echo -e "\n"

# This is the most common setup, where we use a "configure" script coming with
# the project in order to setup things up before using make on it.
if [ -d build ]; then
    cd build
else
    # We create the same hierarchy as the one set in "BUILD_DIR" from CMakeLists.txt from here,
    # in order to make sure that the hierarchy is not affected by the CMake archive extraction script
    # in case we are creating the BUILD_DIR hierarchy in advance.
    mkdir build
    cd build

    ../configure --prefix=${install_path}
fi

echo -e "\n"
echo -e "[CONFIGURE] Finished configuring template-${template_version}!"
echo -e "\n"
