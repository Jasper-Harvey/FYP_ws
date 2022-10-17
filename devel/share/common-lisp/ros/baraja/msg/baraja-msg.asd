
(cl:in-package :asdf)

(defsystem "baraja-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "RawUdp" :depends-on ("_package_RawUdp"))
    (:file "_package_RawUdp" :depends-on ("_package"))
    (:file "RawUdpArray" :depends-on ("_package_RawUdpArray"))
    (:file "_package_RawUdpArray" :depends-on ("_package"))
  ))