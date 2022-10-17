;; Auto-generated. Do not edit!


(when (boundp 'baraja::SetPlaytable)
  (if (not (find-package "BARAJA"))
    (make-package "BARAJA"))
  (shadow 'SetPlaytable (find-package "BARAJA")))
(unless (find-package "BARAJA::SETPLAYTABLE")
  (make-package "BARAJA::SETPLAYTABLE"))
(unless (find-package "BARAJA::SETPLAYTABLEREQUEST")
  (make-package "BARAJA::SETPLAYTABLEREQUEST"))
(unless (find-package "BARAJA::SETPLAYTABLERESPONSE")
  (make-package "BARAJA::SETPLAYTABLERESPONSE"))

(in-package "ROS")





(defclass baraja::SetPlaytableRequest
  :super ros::object
  :slots (_playtable ))

(defmethod baraja::SetPlaytableRequest
  (:init
   (&key
    ((:playtable __playtable) "")
    )
   (send-super :init)
   (setq _playtable (string __playtable))
   self)
  (:playtable
   (&optional __playtable)
   (if __playtable (setq _playtable __playtable)) _playtable)
  (:serialization-length
   ()
   (+
    ;; string _playtable
    4 (length _playtable)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _playtable
       (write-long (length _playtable) s) (princ _playtable s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _playtable
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _playtable (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass baraja::SetPlaytableResponse
  :super ros::object
  :slots (_success ))

(defmethod baraja::SetPlaytableResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass baraja::SetPlaytable
  :super ros::object
  :slots ())

(setf (get baraja::SetPlaytable :md5sum-) "9bf43e869557d516272a55c9c106e00b")
(setf (get baraja::SetPlaytable :datatype-) "baraja/SetPlaytable")
(setf (get baraja::SetPlaytable :request) baraja::SetPlaytableRequest)
(setf (get baraja::SetPlaytable :response) baraja::SetPlaytableResponse)

(defmethod baraja::SetPlaytableRequest
  (:response () (instance baraja::SetPlaytableResponse :init)))

(setf (get baraja::SetPlaytableRequest :md5sum-) "9bf43e869557d516272a55c9c106e00b")
(setf (get baraja::SetPlaytableRequest :datatype-) "baraja/SetPlaytableRequest")
(setf (get baraja::SetPlaytableRequest :definition-)
      "string playtable
---
bool success

")

(setf (get baraja::SetPlaytableResponse :md5sum-) "9bf43e869557d516272a55c9c106e00b")
(setf (get baraja::SetPlaytableResponse :datatype-) "baraja/SetPlaytableResponse")
(setf (get baraja::SetPlaytableResponse :definition-)
      "string playtable
---
bool success

")



(provide :baraja/SetPlaytable "9bf43e869557d516272a55c9c106e00b")


