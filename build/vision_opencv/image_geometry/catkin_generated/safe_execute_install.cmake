execute_process(COMMAND "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/build/vision_opencv/image_geometry/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/build/vision_opencv/image_geometry/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
