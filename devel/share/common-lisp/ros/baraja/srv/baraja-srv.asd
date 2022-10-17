
(cl:in-package :asdf)

(defsystem "baraja-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "SetPlaytable" :depends-on ("_package_SetPlaytable"))
    (:file "_package_SetPlaytable" :depends-on ("_package"))
  ))