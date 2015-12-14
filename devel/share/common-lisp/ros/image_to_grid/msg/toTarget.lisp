; Auto-generated. Do not edit!


(cl:in-package image_to_grid-msg)


;//! \htmlinclude toTarget.msg.html

(cl:defclass <toTarget> (roslisp-msg-protocol:ros-message)
  ((zumy
    :reader zumy
    :initarg :zumy
    :type geometry_msgs-msg:Transform
    :initform (cl:make-instance 'geometry_msgs-msg:Transform))
   (target
    :reader target
    :initarg :target
    :type geometry_msgs-msg:Transform
    :initform (cl:make-instance 'geometry_msgs-msg:Transform)))
)

(cl:defclass toTarget (<toTarget>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <toTarget>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'toTarget)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_to_grid-msg:<toTarget> is deprecated: use image_to_grid-msg:toTarget instead.")))

(cl:ensure-generic-function 'zumy-val :lambda-list '(m))
(cl:defmethod zumy-val ((m <toTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_to_grid-msg:zumy-val is deprecated.  Use image_to_grid-msg:zumy instead.")
  (zumy m))

(cl:ensure-generic-function 'target-val :lambda-list '(m))
(cl:defmethod target-val ((m <toTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_to_grid-msg:target-val is deprecated.  Use image_to_grid-msg:target instead.")
  (target m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <toTarget>) ostream)
  "Serializes a message object of type '<toTarget>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'zumy) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'target) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <toTarget>) istream)
  "Deserializes a message object of type '<toTarget>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'zumy) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'target) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<toTarget>)))
  "Returns string type for a message object of type '<toTarget>"
  "image_to_grid/toTarget")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'toTarget)))
  "Returns string type for a message object of type 'toTarget"
  "image_to_grid/toTarget")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<toTarget>)))
  "Returns md5sum for a message object of type '<toTarget>"
  "54f6cde095f0ada672d5efcf4f2ed68b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'toTarget)))
  "Returns md5sum for a message object of type 'toTarget"
  "54f6cde095f0ada672d5efcf4f2ed68b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<toTarget>)))
  "Returns full string definition for message of type '<toTarget>"
  (cl:format cl:nil "geometry_msgs/Transform zumy~%geometry_msgs/Transform target~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'toTarget)))
  "Returns full string definition for message of type 'toTarget"
  (cl:format cl:nil "geometry_msgs/Transform zumy~%geometry_msgs/Transform target~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <toTarget>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'zumy))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'target))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <toTarget>))
  "Converts a ROS message object to a list"
  (cl:list 'toTarget
    (cl:cons ':zumy (zumy msg))
    (cl:cons ':target (target msg))
))
