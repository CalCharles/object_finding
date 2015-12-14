; Auto-generated. Do not edit!


(cl:in-package model_ops-msg)


;//! \htmlinclude objectOp.msg.html

(cl:defclass <objectOp> (roslisp-msg-protocol:ros-message)
  ((ox
    :reader ox
    :initarg :ox
    :type cl:fixnum
    :initform 0)
   (oy
    :reader oy
    :initarg :oy
    :type cl:fixnum
    :initform 0)
   (newOp
    :reader newOp
    :initarg :newOp
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass objectOp (<objectOp>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <objectOp>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'objectOp)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name model_ops-msg:<objectOp> is deprecated: use model_ops-msg:objectOp instead.")))

(cl:ensure-generic-function 'ox-val :lambda-list '(m))
(cl:defmethod ox-val ((m <objectOp>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader model_ops-msg:ox-val is deprecated.  Use model_ops-msg:ox instead.")
  (ox m))

(cl:ensure-generic-function 'oy-val :lambda-list '(m))
(cl:defmethod oy-val ((m <objectOp>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader model_ops-msg:oy-val is deprecated.  Use model_ops-msg:oy instead.")
  (oy m))

(cl:ensure-generic-function 'newOp-val :lambda-list '(m))
(cl:defmethod newOp-val ((m <objectOp>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader model_ops-msg:newOp-val is deprecated.  Use model_ops-msg:newOp instead.")
  (newOp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <objectOp>) ostream)
  "Serializes a message object of type '<objectOp>"
  (cl:let* ((signed (cl:slot-value msg 'ox)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'oy)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'newOp) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <objectOp>) istream)
  "Deserializes a message object of type '<objectOp>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ox) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'oy) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:slot-value msg 'newOp) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<objectOp>)))
  "Returns string type for a message object of type '<objectOp>"
  "model_ops/objectOp")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'objectOp)))
  "Returns string type for a message object of type 'objectOp"
  "model_ops/objectOp")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<objectOp>)))
  "Returns md5sum for a message object of type '<objectOp>"
  "43114985d67bb1bd58bb205d1a0a2adc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'objectOp)))
  "Returns md5sum for a message object of type 'objectOp"
  "43114985d67bb1bd58bb205d1a0a2adc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<objectOp>)))
  "Returns full string definition for message of type '<objectOp>"
  (cl:format cl:nil "int16 ox~%int16 oy~%bool newOp~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'objectOp)))
  "Returns full string definition for message of type 'objectOp"
  (cl:format cl:nil "int16 ox~%int16 oy~%bool newOp~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <objectOp>))
  (cl:+ 0
     2
     2
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <objectOp>))
  "Converts a ROS message object to a list"
  (cl:list 'objectOp
    (cl:cons ':ox (ox msg))
    (cl:cons ':oy (oy msg))
    (cl:cons ':newOp (newOp msg))
))
