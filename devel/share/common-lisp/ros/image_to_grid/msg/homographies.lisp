; Auto-generated. Do not edit!


(cl:in-package image_to_grid-msg)


;//! \htmlinclude homographies.msg.html

(cl:defclass <homographies> (roslisp-msg-protocol:ros-message)
  ((floorX
    :reader floorX
    :initarg :floorX
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (floorY
    :reader floorY
    :initarg :floorY
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (objectX
    :reader objectX
    :initarg :objectX
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (objectY
    :reader objectY
    :initarg :objectY
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (size
    :reader size
    :initarg :size
    :type cl:fixnum
    :initform 0)
   (intervalSize
    :reader intervalSize
    :initarg :intervalSize
    :type cl:float
    :initform 0.0))
)

(cl:defclass homographies (<homographies>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <homographies>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'homographies)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_to_grid-msg:<homographies> is deprecated: use image_to_grid-msg:homographies instead.")))

(cl:ensure-generic-function 'floorX-val :lambda-list '(m))
(cl:defmethod floorX-val ((m <homographies>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_to_grid-msg:floorX-val is deprecated.  Use image_to_grid-msg:floorX instead.")
  (floorX m))

(cl:ensure-generic-function 'floorY-val :lambda-list '(m))
(cl:defmethod floorY-val ((m <homographies>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_to_grid-msg:floorY-val is deprecated.  Use image_to_grid-msg:floorY instead.")
  (floorY m))

(cl:ensure-generic-function 'objectX-val :lambda-list '(m))
(cl:defmethod objectX-val ((m <homographies>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_to_grid-msg:objectX-val is deprecated.  Use image_to_grid-msg:objectX instead.")
  (objectX m))

(cl:ensure-generic-function 'objectY-val :lambda-list '(m))
(cl:defmethod objectY-val ((m <homographies>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_to_grid-msg:objectY-val is deprecated.  Use image_to_grid-msg:objectY instead.")
  (objectY m))

(cl:ensure-generic-function 'size-val :lambda-list '(m))
(cl:defmethod size-val ((m <homographies>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_to_grid-msg:size-val is deprecated.  Use image_to_grid-msg:size instead.")
  (size m))

(cl:ensure-generic-function 'intervalSize-val :lambda-list '(m))
(cl:defmethod intervalSize-val ((m <homographies>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_to_grid-msg:intervalSize-val is deprecated.  Use image_to_grid-msg:intervalSize instead.")
  (intervalSize m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <homographies>) ostream)
  "Serializes a message object of type '<homographies>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'floorX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'floorX))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'floorY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'floorY))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'objectX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'objectX))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'objectY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'objectY))
  (cl:let* ((signed (cl:slot-value msg 'size)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'intervalSize))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <homographies>) istream)
  "Deserializes a message object of type '<homographies>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'floorX) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'floorX)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'floorY) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'floorY)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'objectX) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'objectX)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'objectY) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'objectY)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'size) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'intervalSize) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<homographies>)))
  "Returns string type for a message object of type '<homographies>"
  "image_to_grid/homographies")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'homographies)))
  "Returns string type for a message object of type 'homographies"
  "image_to_grid/homographies")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<homographies>)))
  "Returns md5sum for a message object of type '<homographies>"
  "e3b0945bcd6fa0c0d74e5f6a102c0551")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'homographies)))
  "Returns md5sum for a message object of type 'homographies"
  "e3b0945bcd6fa0c0d74e5f6a102c0551")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<homographies>)))
  "Returns full string definition for message of type '<homographies>"
  (cl:format cl:nil "int32[] floorX~%int32[] floorY~%int32[] objectX~%int32[] objectY~%int8 size ~%float32 intervalSize #should be 1/3 * the size of a tile~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'homographies)))
  "Returns full string definition for message of type 'homographies"
  (cl:format cl:nil "int32[] floorX~%int32[] floorY~%int32[] objectX~%int32[] objectY~%int8 size ~%float32 intervalSize #should be 1/3 * the size of a tile~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <homographies>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'floorX) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'floorY) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'objectX) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'objectY) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <homographies>))
  "Converts a ROS message object to a list"
  (cl:list 'homographies
    (cl:cons ':floorX (floorX msg))
    (cl:cons ':floorY (floorY msg))
    (cl:cons ':objectX (objectX msg))
    (cl:cons ':objectY (objectY msg))
    (cl:cons ':size (size msg))
    (cl:cons ':intervalSize (intervalSize msg))
))
