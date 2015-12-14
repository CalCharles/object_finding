; Auto-generated. Do not edit!


(cl:in-package image_to_grid-msg)


;//! \htmlinclude pixelxy.msg.html

(cl:defclass <pixelxy> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:fixnum
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:fixnum
    :initform 0))
)

(cl:defclass pixelxy (<pixelxy>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <pixelxy>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'pixelxy)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_to_grid-msg:<pixelxy> is deprecated: use image_to_grid-msg:pixelxy instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <pixelxy>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_to_grid-msg:x-val is deprecated.  Use image_to_grid-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <pixelxy>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_to_grid-msg:y-val is deprecated.  Use image_to_grid-msg:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <pixelxy>) ostream)
  "Serializes a message object of type '<pixelxy>"
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <pixelxy>) istream)
  "Deserializes a message object of type '<pixelxy>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<pixelxy>)))
  "Returns string type for a message object of type '<pixelxy>"
  "image_to_grid/pixelxy")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'pixelxy)))
  "Returns string type for a message object of type 'pixelxy"
  "image_to_grid/pixelxy")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<pixelxy>)))
  "Returns md5sum for a message object of type '<pixelxy>"
  "6d78a6b8c9650c754bf0432d3d1707c3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'pixelxy)))
  "Returns md5sum for a message object of type 'pixelxy"
  "6d78a6b8c9650c754bf0432d3d1707c3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<pixelxy>)))
  "Returns full string definition for message of type '<pixelxy>"
  (cl:format cl:nil "int16 x~%int16 y~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'pixelxy)))
  "Returns full string definition for message of type 'pixelxy"
  (cl:format cl:nil "int16 x~%int16 y~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <pixelxy>))
  (cl:+ 0
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <pixelxy>))
  "Converts a ROS message object to a list"
  (cl:list 'pixelxy
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
