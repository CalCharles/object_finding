; Auto-generated. Do not edit!


(cl:in-package image_to_grid-msg)


;//! \htmlinclude filteredImage.msg.html

(cl:defclass <filteredImage> (roslisp-msg-protocol:ros-message)
  ((image
    :reader image
    :initarg :image
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil))
   (length
    :reader length
    :initarg :length
    :type cl:integer
    :initform 0)
   (width
    :reader width
    :initarg :width
    :type cl:integer
    :initform 0)
   (comp_factor
    :reader comp_factor
    :initarg :comp_factor
    :type cl:float
    :initform 0.0))
)

(cl:defclass filteredImage (<filteredImage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <filteredImage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'filteredImage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_to_grid-msg:<filteredImage> is deprecated: use image_to_grid-msg:filteredImage instead.")))

(cl:ensure-generic-function 'image-val :lambda-list '(m))
(cl:defmethod image-val ((m <filteredImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_to_grid-msg:image-val is deprecated.  Use image_to_grid-msg:image instead.")
  (image m))

(cl:ensure-generic-function 'length-val :lambda-list '(m))
(cl:defmethod length-val ((m <filteredImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_to_grid-msg:length-val is deprecated.  Use image_to_grid-msg:length instead.")
  (length m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <filteredImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_to_grid-msg:width-val is deprecated.  Use image_to_grid-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'comp_factor-val :lambda-list '(m))
(cl:defmethod comp_factor-val ((m <filteredImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_to_grid-msg:comp_factor-val is deprecated.  Use image_to_grid-msg:comp_factor instead.")
  (comp_factor m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <filteredImage>) ostream)
  "Serializes a message object of type '<filteredImage>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'image))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'image))
  (cl:let* ((signed (cl:slot-value msg 'length)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'width)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'comp_factor))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <filteredImage>) istream)
  "Deserializes a message object of type '<filteredImage>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'image) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'image)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'length) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'width) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'comp_factor) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<filteredImage>)))
  "Returns string type for a message object of type '<filteredImage>"
  "image_to_grid/filteredImage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'filteredImage)))
  "Returns string type for a message object of type 'filteredImage"
  "image_to_grid/filteredImage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<filteredImage>)))
  "Returns md5sum for a message object of type '<filteredImage>"
  "062cd119e7032c4f31ea925c5820b30a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'filteredImage)))
  "Returns md5sum for a message object of type 'filteredImage"
  "062cd119e7032c4f31ea925c5820b30a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<filteredImage>)))
  "Returns full string definition for message of type '<filteredImage>"
  (cl:format cl:nil "bool[] image #true is 1, false is 0, convert with im_to_ndarray~%int32 length~%int32 width~%float32 comp_factor~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'filteredImage)))
  "Returns full string definition for message of type 'filteredImage"
  (cl:format cl:nil "bool[] image #true is 1, false is 0, convert with im_to_ndarray~%int32 length~%int32 width~%float32 comp_factor~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <filteredImage>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'image) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <filteredImage>))
  "Converts a ROS message object to a list"
  (cl:list 'filteredImage
    (cl:cons ':image (image msg))
    (cl:cons ':length (length msg))
    (cl:cons ':width (width msg))
    (cl:cons ':comp_factor (comp_factor msg))
))
