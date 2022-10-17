;; Auto-generated. Do not edit!


(when (boundp 'baraja::RawUdp)
  (if (not (find-package "BARAJA"))
    (make-package "BARAJA"))
  (shadow 'RawUdp (find-package "BARAJA")))
(unless (find-package "BARAJA::RAWUDP")
  (make-package "BARAJA::RAWUDP"))

(in-package "ROS")
;;//! \htmlinclude RawUdp.msg.html


(defclass baraja::RawUdp
  :super ros::object
  :slots (_engine_ip _udp_buffer ))

(defmethod baraja::RawUdp
  (:init
   (&key
    ((:engine_ip __engine_ip) "")
    ((:udp_buffer __udp_buffer) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _engine_ip (string __engine_ip))
   (setq _udp_buffer __udp_buffer)
   self)
  (:engine_ip
   (&optional __engine_ip)
   (if __engine_ip (setq _engine_ip __engine_ip)) _engine_ip)
  (:udp_buffer
   (&optional __udp_buffer)
   (if __udp_buffer (setq _udp_buffer __udp_buffer)) _udp_buffer)
  (:serialization-length
   ()
   (+
    ;; string _engine_ip
    4 (length _engine_ip)
    ;; int8[] _udp_buffer
    (* 1    (length _udp_buffer)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _engine_ip
       (write-long (length _engine_ip) s) (princ _engine_ip s)
     ;; int8[] _udp_buffer
     (write-long (length _udp_buffer) s)
     (dotimes (i (length _udp_buffer))
       (write-byte (elt _udp_buffer i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _engine_ip
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _engine_ip (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int8[] _udp_buffer
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _udp_buffer (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _udp_buffer i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _udp_buffer i) 127) (setf (elt _udp_buffer i) (- (elt _udp_buffer i) 256)))
     ))
   ;;
   self)
  )

(setf (get baraja::RawUdp :md5sum-) "eb94c58e0ae8bba1199cfb8b90a1cd25")
(setf (get baraja::RawUdp :datatype-) "baraja/RawUdp")
(setf (get baraja::RawUdp :definition-)
      "string engine_ip
int8[] udp_buffer

")



(provide :baraja/RawUdp "eb94c58e0ae8bba1199cfb8b90a1cd25")


