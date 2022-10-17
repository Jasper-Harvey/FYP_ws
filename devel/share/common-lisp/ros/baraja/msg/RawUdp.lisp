; Auto-generated. Do not edit!


(cl:in-package baraja-msg)


;//! \htmlinclude RawUdp.msg.html

(cl:defclass <RawUdp> (roslisp-msg-protocol:ros-message)
  ((engine_ip
    :reader engine_ip
    :initarg :engine_ip
    :type cl:string
    :initform "")
   (udp_buffer
    :reader udp_buffer
    :initarg :udp_buffer
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass RawUdp (<RawUdp>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RawUdp>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RawUdp)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baraja-msg:<RawUdp> is deprecated: use baraja-msg:RawUdp instead.")))

(cl:ensure-generic-function 'engine_ip-val :lambda-list '(m))
(cl:defmethod engine_ip-val ((m <RawUdp>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baraja-msg:engine_ip-val is deprecated.  Use baraja-msg:engine_ip instead.")
  (engine_ip m))

(cl:ensure-generic-function 'udp_buffer-val :lambda-list '(m))
(cl:defmethod udp_buffer-val ((m <RawUdp>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baraja-msg:udp_buffer-val is deprecated.  Use baraja-msg:udp_buffer instead.")
  (udp_buffer m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RawUdp>) ostream)
  "Serializes a message object of type '<RawUdp>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'engine_ip))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'engine_ip))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'udp_buffer))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    ))
   (cl:slot-value msg 'udp_buffer))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RawUdp>) istream)
  "Deserializes a message object of type '<RawUdp>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'engine_ip) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'engine_ip) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'udp_buffer) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'udp_buffer)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RawUdp>)))
  "Returns string type for a message object of type '<RawUdp>"
  "baraja/RawUdp")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RawUdp)))
  "Returns string type for a message object of type 'RawUdp"
  "baraja/RawUdp")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RawUdp>)))
  "Returns md5sum for a message object of type '<RawUdp>"
  "eb94c58e0ae8bba1199cfb8b90a1cd25")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RawUdp)))
  "Returns md5sum for a message object of type 'RawUdp"
  "eb94c58e0ae8bba1199cfb8b90a1cd25")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RawUdp>)))
  "Returns full string definition for message of type '<RawUdp>"
  (cl:format cl:nil "string engine_ip~%int8[] udp_buffer~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RawUdp)))
  "Returns full string definition for message of type 'RawUdp"
  (cl:format cl:nil "string engine_ip~%int8[] udp_buffer~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RawUdp>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'engine_ip))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'udp_buffer) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RawUdp>))
  "Converts a ROS message object to a list"
  (cl:list 'RawUdp
    (cl:cons ':engine_ip (engine_ip msg))
    (cl:cons ':udp_buffer (udp_buffer msg))
))
