#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/vision_opencv/cv_bridge"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/install/lib/python2.7/dist-packages:/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/build" \
    "/usr/bin/python" \
    "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/vision_opencv/cv_bridge/setup.py" \
    build --build-base "/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/build/vision_opencv/cv_bridge" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/install" --install-scripts="/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/install/bin"
