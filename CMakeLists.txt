cmake_minimum_required(VERSION 2.8)
SET(DEVSHELL_PATH ${CMAKE_CURRENT_SOURCE_DIR})
SET(DEVSHELL_TAG "blaurent/edge-python")
SET(DEVSHELL_CONTAINER_NAME edge-python)
SET(TAG_RELEASE "blaurent/edge-python")


add_custom_target(build_arm
  COMMAND docker build ${build_args} --tag=${DEVSHELL_TAG}:arm -f arm/Dockerfile .
  WORKING_DIRECTORY ${DEVSHELL_PATH})

add_custom_target(build_x86
  COMMAND docker build ${build_args} --tag=${DEVSHELL_TAG} -f x86/Dockerfile .
  WORKING_DIRECTORY ${DEVSHELL_PATH})


