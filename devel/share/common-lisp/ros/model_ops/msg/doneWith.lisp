; Auto-generated. Do not edit!


(cl:in-package model_ops-msg)


;//! \htmlinclude doneWith.msg.html

(cl:defclass <doneWith> (roslisp-msg-protocol:ros-message)
  ((done
    :reader done
    :initarg :done
    :type cl:boolean
    :initform cl:nil)
   (withX
    :reader withX
    :initarg :withX
    :type cl:fixnum
    :initform 0)
   (withY
    :reader withY
    :initarg :withY
    :type cl:fixnum
    :initform 0))
)

(cl:defclass doneWith (<doneWith>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <doneWith>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'doneWith)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name model_ops-msg:<doneWith> is deprecated: use model_ops-msg:doneWith instead.")))

(cl:ensure-generic-function 'done-val :lambda-list '(m))
(cl:defmethod done-val ((m <doneWith>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader model_ops-msg:done-val is deprecated.  Use model_ops-msg:done instead.")
  (done m))

(cl:ensure-generic-function 'withX-val :lambda-list '(m))
(cl:defmethod withX-val ((m <doneWith>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader model_ops-msg:withX-val is deprecated.  Use model_ops-msg:withX instead.")
  (withX m))

(cl:ensure-generic-function 'withY-val :lambda-list '(m))
(cl:defmethod withY-val ((m <doneWith>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader model_ops-msg:withY-val is deprecated.  Use model_ops-msg:withY instead.")
  (withY m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <doneWith>) ostream)
  "Serializes a message object of type '<doneWith>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'done) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'withX)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'withY)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <doneWith>) istream)
  "Deserializes a message object of type '<doneWith>"
    (cl:setf (cl:slot-value msg 'done) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'withX) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'withY) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<doneWith>)))
  "Returns string type for a message object of type '<doneWith>"
  "model_ops/doneWith")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'doneWith)))
  "Returns string type for a message object of type 'doneWith"
  "model_ops/doneWith")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<doneWith>)))
  "Returns md5sum for a message object of type '<doneWith>"
  "e020320727b1b65dfc98f52ebbb81459")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'doneWith)))
  "Returns md5sum for a message object of type 'doneWith"
  "e020320727b1b65dfc98f52ebbb81459")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<doneWith>)))
  "Returns full string definition for message of type '<doneWith>"
  (cl:format cl:nil "bool done~%int16 withX~%int16 withY~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'doneWith)))
  "Returns full string definition for message of type 'doneWith"
  (cl:format cl:nil "bool done~%int16 withX~%int16 withY~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <doneWith>))
  (cl:+ 0
     1
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <doneWith>))
  "Converts a ROS message object to a list"
  (cl:list 'doneWith
    (cl:cons ':done (done msg))
    (cl:cons ':withX (withX msg))
    (cl:cons ':withY (withY msg))
))
