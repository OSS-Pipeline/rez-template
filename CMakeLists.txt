CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

include(RezBuild)
include(RezRepository)
include(ExternalProject)

set(template_version x.x.x)

# template
rez_set_archive(
    # This is a relative path from the ${REZ_REPO_PAYLOAD_DIR} environment variable,
    # that is pointing to the root directory where we can find all the archives of the package
    # we can build, using the following hierarchy:
    # "${REZ_REPO_PAYLOAD_DIR}/project_name/archive.what.ever"
    template_url template/template-${template_version}.tar.gz
    https://url.to/my/package.tar.gz
)

# The environment variable REZ_TMP_PATH is meant to point to a location, such as "/tmp/rez".
set(EXTRACT_DIR $ENV{REZ_TMP_PATH}/template/${template_version})
set(BUILD_DIR ${EXTRACT_DIR}/build)

# We configure/build/install "template" through the ExternalProject_Add macro,
# using three different shell scripts for each of these steps.
# If necessary, it is possible to skip one of these steps by replacing the command
# by "", an empty string.
ExternalProject_Add(
    build_template
    URL ${template_url}
    PREFIX template
    SOURCE_DIR ${EXTRACT_DIR}
    CONFIGURE_COMMAND bash ${CMAKE_SOURCE_DIR}/configure.sh ${EXTRACT_DIR} ${CMAKE_INSTALL_PREFIX} ${template_version}
    BUILD_COMMAND bash ${CMAKE_SOURCE_DIR}/build.sh ${BUILD_DIR} ${template_version}
    INSTALL_COMMAND bash ${CMAKE_SOURCE_DIR}/install.sh ${BUILD_DIR} ${template_version}
)

# We use a bogus CMake "install" step in order to be able to properly finish
# and get out of the CMake script.
install(
    CODE
    "execute_process(
        COMMAND echo \"\n[CMAKE] template-${template_version} PACKAGE SETUP FINISHED!\n\"
    )"
)