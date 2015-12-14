## *********************************************************
## 
## File autogenerated for the hough_lines package 
## by the dynamic_reconfigure package.
## Please do not edit.
## 
## ********************************************************/

from dynamic_reconfigure.encoding import extract_params

inf = float('inf')

config_description = {'upper': 'DEFAULT', 'lower': 'groups', 'srcline': 233, 'name': 'Default', 'parent': 0, 'srcfile': '/opt/ros/indigo/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'cstate': 'true', 'parentname': 'Default', 'class': 'DEFAULT', 'field': 'default', 'state': True, 'parentclass': '', 'groups': [], 'parameters': [{'srcline': 262, 'description': 'Indicates that the camera_info topic should be subscribed to to get the default input_frame_id. Otherwise the frame from the image message will be used.', 'max': True, 'cconsttype': 'const bool', 'ctype': 'bool', 'srcfile': '/opt/ros/indigo/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'use_camera_info', 'edit_method': '', 'default': True, 'level': 0, 'min': False, 'type': 'bool'}, {'srcline': 262, 'description': 'Hough Line Methods', 'max': 1, 'cconsttype': 'const int', 'ctype': 'int', 'srcfile': '/opt/ros/indigo/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'hough_type', 'edit_method': "{'enum_description': 'An enum for Hough Transform Mehtods', 'enum': [{'srcline': 42, 'description': 'Standard Hough Line', 'srcfile': '/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/vision_opencv/opencv_apps/cfg/HoughLines.cfg', 'cconsttype': 'const int', 'value': 0, 'ctype': 'int', 'type': 'int', 'name': 'Standard_Hough_Transform'}, {'srcline': 43, 'description': 'Probabilistic Hough Line', 'srcfile': '/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/vision_opencv/opencv_apps/cfg/HoughLines.cfg', 'cconsttype': 'const int', 'value': 1, 'ctype': 'int', 'type': 'int', 'name': 'Probabilistic_Hough_Transform'}]}", 'default': 0, 'level': 0, 'min': 0, 'type': 'int'}, {'srcline': 262, 'description': 'Hough Line Threshold', 'max': 150, 'cconsttype': 'const int', 'ctype': 'int', 'srcfile': '/opt/ros/indigo/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'threshold', 'edit_method': '', 'default': 150, 'level': 150, 'min': 50, 'type': 'int'}], 'type': '', 'id': 0}

min = {}
max = {}
defaults = {}
level = {}
type = {}
all_level = 0

#def extract_params(config):
#    params = []
#    params.extend(config['parameters'])    
#    for group in config['groups']:
#        params.extend(extract_params(group))
#    return params

for param in extract_params(config_description):
    min[param['name']] = param['min']
    max[param['name']] = param['max']
    defaults[param['name']] = param['default']
    level[param['name']] = param['level']
    type[param['name']] = param['type']
    all_level = all_level | param['level']

HoughLines_Standard_Hough_Transform = 0
HoughLines_Probabilistic_Hough_Transform = 1
