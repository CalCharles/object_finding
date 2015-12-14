# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "image_to_grid: 5 messages, 0 services")

set(MSG_I_FLAGS "-Iimage_to_grid:/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Iimage_to_grid:/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(image_to_grid_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/gridZumy.msg" NAME_WE)
add_custom_target(_image_to_grid_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "image_to_grid" "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/gridZumy.msg" "image_to_grid/filteredImage:image_to_grid/pixelxy"
)

get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/toTarget.msg" NAME_WE)
add_custom_target(_image_to_grid_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "image_to_grid" "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/toTarget.msg" "geometry_msgs/Transform:geometry_msgs/Quaternion:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/homographies.msg" NAME_WE)
add_custom_target(_image_to_grid_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "image_to_grid" "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/homographies.msg" ""
)

get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/filteredImage.msg" NAME_WE)
add_custom_target(_image_to_grid_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "image_to_grid" "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/filteredImage.msg" ""
)

get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/pixelxy.msg" NAME_WE)
add_custom_target(_image_to_grid_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "image_to_grid" "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/pixelxy.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(image_to_grid
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/gridZumy.msg"
  "${MSG_I_FLAGS}"
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/filteredImage.msg;/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/pixelxy.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/image_to_grid
)
_generate_msg_cpp(image_to_grid
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/toTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/image_to_grid
)
_generate_msg_cpp(image_to_grid
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/pixelxy.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/image_to_grid
)
_generate_msg_cpp(image_to_grid
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/filteredImage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/image_to_grid
)
_generate_msg_cpp(image_to_grid
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/homographies.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/image_to_grid
)

### Generating Services

### Generating Module File
_generate_module_cpp(image_to_grid
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/image_to_grid
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(image_to_grid_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(image_to_grid_generate_messages image_to_grid_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/gridZumy.msg" NAME_WE)
add_dependencies(image_to_grid_generate_messages_cpp _image_to_grid_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/toTarget.msg" NAME_WE)
add_dependencies(image_to_grid_generate_messages_cpp _image_to_grid_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/homographies.msg" NAME_WE)
add_dependencies(image_to_grid_generate_messages_cpp _image_to_grid_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/filteredImage.msg" NAME_WE)
add_dependencies(image_to_grid_generate_messages_cpp _image_to_grid_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/pixelxy.msg" NAME_WE)
add_dependencies(image_to_grid_generate_messages_cpp _image_to_grid_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(image_to_grid_gencpp)
add_dependencies(image_to_grid_gencpp image_to_grid_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS image_to_grid_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(image_to_grid
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/gridZumy.msg"
  "${MSG_I_FLAGS}"
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/filteredImage.msg;/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/pixelxy.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/image_to_grid
)
_generate_msg_lisp(image_to_grid
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/toTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/image_to_grid
)
_generate_msg_lisp(image_to_grid
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/pixelxy.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/image_to_grid
)
_generate_msg_lisp(image_to_grid
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/filteredImage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/image_to_grid
)
_generate_msg_lisp(image_to_grid
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/homographies.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/image_to_grid
)

### Generating Services

### Generating Module File
_generate_module_lisp(image_to_grid
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/image_to_grid
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(image_to_grid_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(image_to_grid_generate_messages image_to_grid_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/gridZumy.msg" NAME_WE)
add_dependencies(image_to_grid_generate_messages_lisp _image_to_grid_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/toTarget.msg" NAME_WE)
add_dependencies(image_to_grid_generate_messages_lisp _image_to_grid_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/homographies.msg" NAME_WE)
add_dependencies(image_to_grid_generate_messages_lisp _image_to_grid_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/filteredImage.msg" NAME_WE)
add_dependencies(image_to_grid_generate_messages_lisp _image_to_grid_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/pixelxy.msg" NAME_WE)
add_dependencies(image_to_grid_generate_messages_lisp _image_to_grid_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(image_to_grid_genlisp)
add_dependencies(image_to_grid_genlisp image_to_grid_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS image_to_grid_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(image_to_grid
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/gridZumy.msg"
  "${MSG_I_FLAGS}"
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/filteredImage.msg;/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/pixelxy.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/image_to_grid
)
_generate_msg_py(image_to_grid
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/toTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/image_to_grid
)
_generate_msg_py(image_to_grid
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/pixelxy.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/image_to_grid
)
_generate_msg_py(image_to_grid
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/filteredImage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/image_to_grid
)
_generate_msg_py(image_to_grid
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/homographies.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/image_to_grid
)

### Generating Services

### Generating Module File
_generate_module_py(image_to_grid
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/image_to_grid
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(image_to_grid_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(image_to_grid_generate_messages image_to_grid_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/gridZumy.msg" NAME_WE)
add_dependencies(image_to_grid_generate_messages_py _image_to_grid_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/toTarget.msg" NAME_WE)
add_dependencies(image_to_grid_generate_messages_py _image_to_grid_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/homographies.msg" NAME_WE)
add_dependencies(image_to_grid_generate_messages_py _image_to_grid_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/filteredImage.msg" NAME_WE)
add_dependencies(image_to_grid_generate_messages_py _image_to_grid_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg/pixelxy.msg" NAME_WE)
add_dependencies(image_to_grid_generate_messages_py _image_to_grid_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(image_to_grid_genpy)
add_dependencies(image_to_grid_genpy image_to_grid_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS image_to_grid_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/image_to_grid)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/image_to_grid
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(image_to_grid_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(image_to_grid_generate_messages_cpp image_to_grid_generate_messages_cpp)
add_dependencies(image_to_grid_generate_messages_cpp geometry_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/image_to_grid)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/image_to_grid
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(image_to_grid_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(image_to_grid_generate_messages_lisp image_to_grid_generate_messages_lisp)
add_dependencies(image_to_grid_generate_messages_lisp geometry_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/image_to_grid)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/image_to_grid\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/image_to_grid
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(image_to_grid_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(image_to_grid_generate_messages_py image_to_grid_generate_messages_py)
add_dependencies(image_to_grid_generate_messages_py geometry_msgs_generate_messages_py)
