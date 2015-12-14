; Auto-generated. Do not edit!


(cl:in-package model_ops-msg)


;//! \htmlinclude startGoal.msg.html

(cl:defclass <startGoal> (roslisp-msg-protocol:ros-message)
  ((sx
    :reader sx
    :initarg :sx
    :type cl:fixnum
    :initform 0)
   (sy
    :reader sy
    :initarg :sy
    :type cl:fixnum
    :initform 0)
   (gx
    :reader gx
    :initarg :gx
    :type cl:fixnum
    :initform 0)
   (gy
    :reader gy
    :initarg :gy
    :type cl:fixnum
    :initform 0))
)

(cl:defclass startGoal (<startGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <startGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'startGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name model_ops-msg:<startGoal> is deprecated: use model_ops-msg:startGoal instead.")))

(cl:ensure-generic-function 'sx-val :lambda-list '(m))
(cl:defmethod sx-val ((m <startGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader model_ops-msg:sx-val is deprecated.  Use model_ops-msg:sx instead.")
  (sx m))

(cl:ensure-generic-function 'sy-val :lambda-list '(m))
(cl:defmethod sy-val ((m <startGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader model_ops-msg:sy-val is deprecated.  Use model_ops-msg:sy instead.")
  (sy m))

(cl:ensure-generic-function 'gx-val :lambda-list '(m))
(cl:defmethod gx-val ((m <startGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader model_ops-msg:gx-val is deprecated.  Use model_ops-msg:gx instead.")
  (gx m))

(cl:ensure-generic-function 'gy-val :lambda-list '(m))
(cl:defmethod gy-val ((m <startGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader model_ops-msg:gy-val is deprecated.  Use model_ops-msg:gy instead.")
  (gy m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <startGoal>) ostream)
  "Serializes a message object of type '<startGoal>"
  (cl:let* ((signed (cl:slot-value msg 'sx)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'sy)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'gx)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'gy)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <startGoal>) istream)
  "Deserializes a message object of type '<startGoal>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sx) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sy) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gx) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gy) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<startGoal>)))
  "Returns string type for a message object of type '<startGoal>"
  "model_ops/startGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'startGoal)))
  "Returns string type for a message object of type 'startGoal"
  "model_ops/startGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<startGoal>)))
  "Returns md5sum for a message object of type '<startGoal>"
  "c0cb8f097e0ebf320d31d88f85383a90")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'startGoal)))
  "Returns md5sum for a message object of type 'startGoal"
  "c0cb8f097e0ebf320d31d88f85383a90")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<startGoal>)))
  "Returns full string definition for message of type '<startGoal>"
  (cl:format cl:nil "int16 sx~%int16 sy~%int16 gx~%int16 gy~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'startGoal)))
  "Returns full string definition for message of type 'startGoal"
  (cl:format cl:nil "int16 sx~%int16 sy~%int16 gx~%int16 gy~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <startGoal>))
  (cl:+ 0
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <startGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'startGoal
    (cl:cons ':sx (sx msg))
    (cl:cons ':sy (sy msg))
    (cl:cons ':gx (gx msg))
    (cl:cons ':gy (gy msg))
))
