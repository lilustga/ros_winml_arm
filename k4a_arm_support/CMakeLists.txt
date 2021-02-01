cmake_minimum_required(VERSION 2.8.3)
project(k4a_arm_support)

add_compile_options(/Od)
#add_compile_options(/std:c++latest)
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 17)
endif()

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  roscpp
  roslib
  std_msgs
  geometry_msgs
  interactive_markers
  visualization_msgs
  ros_msft_onnx
  marker_msgs
  moveit_ros_planning_interface
)
SET( EIGEN3_INCLUDE_DIR "C:\\opt\\ros\\noetic\\x64\\share\\eigen3" )
IF( NOT EIGEN3_INCLUDE_DIR )
    MESSAGE( FATAL_ERROR "Please point the environment variable EIGEN3_INCLUDE_DIR to the include directory of your Eigen3 installation.")
ENDIF()
INCLUDE_DIRECTORIES ( "${EIGEN3_INCLUDE_DIR}" )

include_directories(${catkin_INCLUDE_DIRS} ${EIGEN3_INCLUDE_DIRS})
add_definitions(${EIGEN3_DEFINITIONS})
catkin_package(
  LIBRARIES k4a_arm_support
  CATKIN_DEPENDS ros_msft_onnx geometry_msgs interactive_markers roscpp roslib std_msgs visualization_msgs moveit_ros_planning_interface
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

add_executable(${PROJECT_NAME}_node src/k4a_arm_support.cpp)
add_dependencies(${PROJECT_NAME}_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(${PROJECT_NAME}_node ${catkin_LIBRARIES})

install(TARGETS ${PROJECT_NAME}_node
  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(DIRECTORY launch meshes urdf calibration viz log
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)
