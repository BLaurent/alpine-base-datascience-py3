cmake_minimum_required(VERSION 2.8)
SET(DEVSHELL_PATH ${CMAKE_CURRENT_SOURCE_DIR})
SET(DEVSHELL_TAG "blaurent/edge-python")
SET(DEVSHELL_CONTAINER_NAME edge-python)
SET(TAG_RELEASE "blaurent/edge-python")
SET(build-args --build-arg 'http_proxy=$ENV{http_proxy}' --build-arg 'https_proxy=$ENV{https_proxy}' --build-arg 'no_proxy=$ENV{no_proxy}' --build-arg 'ARTIFACTORY_CREDS_USR=$ENV{ARTIFACTORY_CREDS_USR}' --build-arg 'ARTIFACTORY_CREDS_PSW=$ENV{ARTIFACTORY_CREDS_PSW}' --build-arg ARTIFACTORY_REPOSITORY="IEWMS-SNAPSHOT" )


add_custom_target(build_arm
  COMMAND docker build --no-cache ${build_args} --tag=${DEVSHELL_TAG}:arm -f arm/Dockerfile .
  WORKING_DIRECTORY ${DEVSHELL_PATH})

add_custom_target(build_x86
  COMMAND docker build --no-cache ${build_args} --tag=${DEVSHELL_TAG} -f x86/Dockerfile .
  WORKING_DIRECTORY ${DEVSHELL_PATH})
