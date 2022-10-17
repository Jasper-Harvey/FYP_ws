;; Auto-generated. Do not edit!


(when (boundp 'baraja::RawUdpArray)
  (if (not (find-package "BARAJA"))
    (make-package "BARAJA"))
  (shadow 'RawUdpArray (find-package "BARAJA")))
(unless (find-package "BARAJA::RAWUDPARRAY")
  (make-package "BARAJA::RAWUDPARRAY"))

(in-package "ROS")
;;//! \htmlinclude RawUdpArray.msg.html


(defclass baraja::RawUdpArray
  :super ros::object
  :slots (_packets ))

(defmethod baraja::RawUdpArray
  (:init
   (&key
    ((:packets __packets) (let (r) (dotimes (i 0) (push (instance baraja::RawUdp :init) r)) r))
    )
   (send-super :init)
   (setq _packets __packets)
   self)
  (:packets
   (&rest __packets)
   (if (keywordp (car __packets))
       (send* _packets __packets)
     (progn
       (if __packets (setq _packets (car __packets)))
       _packets)))
  (:serialization-length
   ()
   (+
    ;; baraja/RawUdp[] _packets
    (apply #'+ (send-all _packets :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; baraja/RawUdp[] _packets
     (write-long (length _packets) s)
     (dolist (elem _packets)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; baraja/RawUdp[] _packets
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _packets (let (r) (dotimes (i n) (push (instance baraja::RawUdp :init) r)) r))
     (dolist (elem- _packets)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get baraja::RawUdpArray :md5sum-) "8cbd4d895c0bf5a63184e96e9012fce9")
(setf (get baraja::RawUdpArray :datatype-) "baraja/RawUdpArray")
(setf (get baraja::RawUdpArray :definition-)
      "RawUdp[] packets

================================================================================
MSG: baraja/RawUdp
string engine_ip
int8[] udp_buffer

")



(provide :baraja/RawUdpArray "8cbd4d895c0bf5a63184e96e9012fce9")


