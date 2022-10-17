; Auto-generated. Do not edit!


(cl:in-package baraja-srv)


;//! \htmlinclude SetPlaytable-request.msg.html

(cl:defclass <SetPlaytable-request> (roslisp-msg-protocol:ros-message)
  ((playtable
    :reader playtable
    :initarg :playtable
    :type cl:string
    :initform ""))
)

(cl:defclass SetPlaytable-request (<SetPlaytable-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetPlaytable-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetPlaytable-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baraja-srv:<SetPlaytable-request> is deprecated: use baraja-srv:SetPlaytable-request instead.")))

(cl:ensure-generic-function 'playtable-val :lambda-list '(m))
(cl:defmethod playtable-val ((m <SetPlaytable-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baraja-srv:playtable-val is deprecated.  Use baraja-srv:playtable instead.")
  (playtable m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetPlaytable-request>) ostream)
  "Serializes a message object of type '<SetPlaytable-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'playtable))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'playtable))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetPlaytable-request>) istream)
  "Deserializes a message object of type '<SetPlaytable-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'playtable) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'playtable) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetPlaytable-request>)))
  "Returns string type for a service object of type '<SetPlaytable-request>"
  "baraja/SetPlaytableRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPlaytable-request)))
  "Returns string type for a service object of type 'SetPlaytable-request"
  "baraja/SetPlaytableRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetPlaytable-request>)))
  "Returns md5sum for a message object of type '<SetPlaytable-request>"
  "9bf43e869557d516272a55c9c106e00b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetPlaytable-request)))
  "Returns md5sum for a message object of type 'SetPlaytable-request"
  "9bf43e869557d516272a55c9c106e00b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetPlaytable-request>)))
  "Returns full string definition for message of type '<SetPlaytable-request>"
  (cl:format cl:nil "string playtable~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetPlaytable-request)))
  "Returns full string definition for message of type 'SetPlaytable-request"
  (cl:format cl:nil "string playtable~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetPlaytable-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'playtable))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetPlaytable-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetPlaytable-request
    (cl:cons ':playtable (playtable msg))
))
;//! \htmlinclude SetPlaytable-response.msg.html

(cl:defclass <SetPlaytable-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetPlaytable-response (<SetPlaytable-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetPlaytable-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetPlaytable-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baraja-srv:<SetPlaytable-response> is deprecated: use baraja-srv:SetPlaytable-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetPlaytable-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baraja-srv:success-val is deprecated.  Use baraja-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetPlaytable-response>) ostream)
  "Serializes a message object of type '<SetPlaytable-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetPlaytable-response>) istream)
  "Deserializes a message object of type '<SetPlaytable-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetPlaytable-response>)))
  "Returns string type for a service object of type '<SetPlaytable-response>"
  "baraja/SetPlaytableResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPlaytable-response)))
  "Returns string type for a service object of type 'SetPlaytable-response"
  "baraja/SetPlaytableResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetPlaytable-response>)))
  "Returns md5sum for a message object of type '<SetPlaytable-response>"
  "9bf43e869557d516272a55c9c106e00b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetPlaytable-response)))
  "Returns md5sum for a message object of type 'SetPlaytable-response"
  "9bf43e869557d516272a55c9c106e00b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetPlaytable-response>)))
  "Returns full string definition for message of type '<SetPlaytable-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetPlaytable-response)))
  "Returns full string definition for message of type 'SetPlaytable-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetPlaytable-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetPlaytable-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetPlaytable-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetPlaytable)))
  'SetPlaytable-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetPlaytable)))
  'SetPlaytable-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPlaytable)))
  "Returns string type for a service object of type '<SetPlaytable>"
  "baraja/SetPlaytable")