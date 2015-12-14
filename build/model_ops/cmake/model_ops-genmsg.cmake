# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "model_ops: 5 messages, 0 services")

set(MSG_I_FLAGS "-Imodel_ops:/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Imodel_ops:/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(model_ops_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/startGoalCentroid.msg" NAME_WE)
add_custom_target(_model_ops_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "model_ops" "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/startGoalCentroid.msg" ""
)

get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/startGoal.msg" NAME_WE)
add_custom_target(_model_ops_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "model_ops" "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/startGoal.msg" ""
)

get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/objectOp.msg" NAME_WE)
add_custom_target(_model_ops_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "model_ops" "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/objectOp.msg" ""
)

get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/model.msg" NAME_WE)
add_custom_target(_model_ops_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "model_ops" "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/model.msg" ""
)

get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/doneWith.msg" NAME_WE)
add_custom_target(_model_ops_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "model_ops" "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/doneWith.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(model_ops
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/doneWith.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/model_ops
)
_generate_msg_cpp(model_ops
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/startGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/model_ops
)
_generate_msg_cpp(model_ops
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/startGoalCentroid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/model_ops
)
_generate_msg_cpp(model_ops
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/model.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/model_ops
)
_generate_msg_cpp(model_ops
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/objectOp.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/model_ops
)

### Generating Services

### Generating Module File
_generate_module_cpp(model_ops
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/model_ops
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(model_ops_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(model_ops_generate_messages model_ops_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/startGoalCentroid.msg" NAME_WE)
add_dependencies(model_ops_generate_messages_cpp _model_ops_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/startGoal.msg" NAME_WE)
add_dependencies(model_ops_generate_messages_cpp _model_ops_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/objectOp.msg" NAME_WE)
add_dependencies(model_ops_generate_messages_cpp _model_ops_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/model.msg" NAME_WE)
add_dependencies(model_ops_generate_messages_cpp _model_ops_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/doneWith.msg" NAME_WE)
add_dependencies(model_ops_generate_messages_cpp _model_ops_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(model_ops_gencpp)
add_dependencies(model_ops_gencpp model_ops_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS model_ops_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(model_ops
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/doneWith.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/model_ops
)
_generate_msg_lisp(model_ops
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/startGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/model_ops
)
_generate_msg_lisp(model_ops
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/startGoalCentroid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/model_ops
)
_generate_msg_lisp(model_ops
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/model.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/model_ops
)
_generate_msg_lisp(model_ops
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/objectOp.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/model_ops
)

### Generating Services

### Generating Module File
_generate_module_lisp(model_ops
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/model_ops
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(model_ops_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(model_ops_generate_messages model_ops_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/startGoalCentroid.msg" NAME_WE)
add_dependencies(model_ops_generate_messages_lisp _model_ops_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/startGoal.msg" NAME_WE)
add_dependencies(model_ops_generate_messages_lisp _model_ops_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/objectOp.msg" NAME_WE)
add_dependencies(model_ops_generate_messages_lisp _model_ops_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/model.msg" NAME_WE)
add_dependencies(model_ops_generate_messages_lisp _model_ops_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/doneWith.msg" NAME_WE)
add_dependencies(model_ops_generate_messages_lisp _model_ops_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(model_ops_genlisp)
add_dependencies(model_ops_genlisp model_ops_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS model_ops_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(model_ops
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/doneWith.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/model_ops
)
_generate_msg_py(model_ops
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/startGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/model_ops
)
_generate_msg_py(model_ops
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/startGoalCentroid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/model_ops
)
_generate_msg_py(model_ops
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/model.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/model_ops
)
_generate_msg_py(model_ops
  "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/objectOp.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/model_ops
)

### Generating Services

### Generating Module File
_generate_module_py(model_ops
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/model_ops
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(model_ops_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(model_ops_generate_messages model_ops_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/startGoalCentroid.msg" NAME_WE)
add_dependencies(model_ops_generate_messages_py _model_ops_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/startGoal.msg" NAME_WE)
add_dependencies(model_ops_generate_messages_py _model_ops_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/objectOp.msg" NAME_WE)
add_dependencies(model_ops_generate_messages_py _model_ops_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/model.msg" NAME_WE)
add_dependencies(model_ops_generate_messages_py _model_ops_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/model_ops/msg/doneWith.msg" NAME_WE)
add_dependencies(model_ops_generate_messages_py _model_ops_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(model_ops_genpy)
add_dependencies(model_ops_genpy model_ops_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS model_ops_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/model_ops)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/model_ops
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(model_ops_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(model_ops_generate_messages_cpp model_ops_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/model_ops)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/model_ops
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(model_ops_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(model_ops_generate_messages_lisp model_ops_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/model_ops)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/model_ops\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/model_ops
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(model_ops_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(model_ops_generate_messages_py model_ops_generate_messages_py)
