; Auto-generated. Do not edit!


(cl:in-package image_to_grid-msg)


;//! \htmlinclude gridZumy.msg.html

(cl:defclass <gridZumy> (roslisp-msg-protocol:ros-message)
  ((zumy
    :reader zumy
    :initarg :zumy
    :type image_to_grid-msg:pixelxy
    :initform (cl:make-instance 'image_to_grid-msg:pixelxy))
   (image
    :reader image
    :initarg :image
    :type image_to_grid-msg:filteredImage
    :initform (cl:make-instance 'image_to_grid-msg:filteredImage)))
)

(cl:defclass gridZumy (<gridZumy>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gridZumy>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gridZumy)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_to_grid-msg:<gridZumy> is deprecated: use image_to_grid-msg:gridZumy instead.")))

(cl:ensure-generic-function 'zumy-val :lambda-list '(m))
(cl:defmethod zumy-val ((m <gridZumy>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_to_grid-msg:zumy-val is deprecated.  Use image_to_grid-msg:zumy instead.")
  (zumy m))

(cl:ensure-generic-function 'image-val :lambda-list '(m))
(cl:defmethod image-val ((m <gridZumy>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_to_grid-msg:image-val is deprecated.  Use image_to_grid-msg:image instead.")
  (image m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gridZumy>) ostream)
  "Serializes a message object of type '<gridZumy>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'zumy) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'image) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gridZumy>) istream)
  "Deserializes a message object of type '<gridZumy>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'zumy) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'image) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gridZumy>)))
  "Returns string type for a message object of type '<gridZumy>"
  "image_to_grid/gridZumy")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gridZumy)))
  "Returns string type for a message object of type 'gridZumy"
  "image_to_grid/gridZumy")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gridZumy>)))
  "Returns md5sum for a message object of type '<gridZumy>"
  "c69250648b8877b3f704f49ae46fa300")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gridZumy)))
  "Returns md5sum for a message object of type 'gridZumy"
  "c69250648b8877b3f704f49ae46fa300")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gridZumy>)))
  "Returns full string definition for message of type '<gridZumy>"
  (cl:format cl:nil "pixelxy zumy~%filteredImage image~%~%================================================================================~%MSG: image_to_grid/pixelxy~%int16 x~%int16 y~%================================================================================~%MSG: image_to_grid/filteredImage~%bool[] image #true is 1, false is 0, convert with im_to_ndarray~%int32 length~%int32 width~%float32 comp_factor~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gridZumy)))
  "Returns full string definition for message of type 'gridZumy"
  (cl:format cl:nil "pixelxy zumy~%filteredImage image~%~%================================================================================~%MSG: image_to_grid/pixelxy~%int16 x~%int16 y~%================================================================================~%MSG: image_to_grid/filteredImage~%bool[] image #true is 1, false is 0, convert with im_to_ndarray~%int32 length~%int32 width~%float32 comp_factor~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gridZumy>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'zumy))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'image))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gridZumy>))
  "Converts a ROS message object to a list"
  (cl:list 'gridZumy
    (cl:cons ':zumy (zumy msg))
    (cl:cons ':image (image msg))
))
