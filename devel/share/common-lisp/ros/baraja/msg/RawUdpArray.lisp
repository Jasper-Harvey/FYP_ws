; Auto-generated. Do not edit!


(cl:in-package baraja-msg)


;//! \htmlinclude RawUdpArray.msg.html

(cl:defclass <RawUdpArray> (roslisp-msg-protocol:ros-message)
  ((packets
    :reader packets
    :initarg :packets
    :type (cl:vector baraja-msg:RawUdp)
   :initform (cl:make-array 0 :element-type 'baraja-msg:RawUdp :initial-element (cl:make-instance 'baraja-msg:RawUdp))))
)

(cl:defclass RawUdpArray (<RawUdpArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RawUdpArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RawUdpArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baraja-msg:<RawUdpArray> is deprecated: use baraja-msg:RawUdpArray instead.")))

(cl:ensure-generic-function 'packets-val :lambda-list '(m))
(cl:defmethod packets-val ((m <RawUdpArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baraja-msg:packets-val is deprecated.  Use baraja-msg:packets instead.")
  (packets m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RawUdpArray>) ostream)
  "Serializes a message object of type '<RawUdpArray>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'packets))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'packets))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RawUdpArray>) istream)
  "Deserializes a message object of type '<RawUdpArray>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'packets) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'packets)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'baraja-msg:RawUdp))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RawUdpArray>)))
  "Returns string type for a message object of type '<RawUdpArray>"
  "baraja/RawUdpArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RawUdpArray)))
  "Returns string type for a message object of type 'RawUdpArray"
  "baraja/RawUdpArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RawUdpArray>)))
  "Returns md5sum for a message object of type '<RawUdpArray>"
  "8cbd4d895c0bf5a63184e96e9012fce9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RawUdpArray)))
  "Returns md5sum for a message object of type 'RawUdpArray"
  "8cbd4d895c0bf5a63184e96e9012fce9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RawUdpArray>)))
  "Returns full string definition for message of type '<RawUdpArray>"
  (cl:format cl:nil "RawUdp[] packets~%~%================================================================================~%MSG: baraja/RawUdp~%string engine_ip~%int8[] udp_buffer~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RawUdpArray)))
  "Returns full string definition for message of type 'RawUdpArray"
  (cl:format cl:nil "RawUdp[] packets~%~%================================================================================~%MSG: baraja/RawUdp~%string engine_ip~%int8[] udp_buffer~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RawUdpArray>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'packets) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RawUdpArray>))
  "Converts a ROS message object to a list"
  (cl:list 'RawUdpArray
    (cl:cons ':packets (packets msg))
))
