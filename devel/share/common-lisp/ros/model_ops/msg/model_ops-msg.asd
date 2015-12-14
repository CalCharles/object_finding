
(cl:in-package :asdf)

(defsystem "model_ops-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "model" :depends-on ("_package_model"))
    (:file "_package_model" :depends-on ("_package"))
    (:file "startGoal" :depends-on ("_package_startGoal"))
    (:file "_package_startGoal" :depends-on ("_package"))
    (:file "doneWith" :depends-on ("_package_doneWith"))
    (:file "_package_doneWith" :depends-on ("_package"))
    (:file "objectOp" :depends-on ("_package_objectOp"))
    (:file "_package_objectOp" :depends-on ("_package"))
    (:file "startGoalCentroid" :depends-on ("_package_startGoalCentroid"))
    (:file "_package_startGoalCentroid" :depends-on ("_package"))
    (:file "model" :depends-on ("_package_model"))
    (:file "_package_model" :depends-on ("_package"))
    (:file "startGoal" :depends-on ("_package_startGoal"))
    (:file "_package_startGoal" :depends-on ("_package"))
    (:file "doneWith" :depends-on ("_package_doneWith"))
    (:file "_package_doneWith" :depends-on ("_package"))
    (:file "objectOp" :depends-on ("_package_objectOp"))
    (:file "_package_objectOp" :depends-on ("_package"))
    (:file "startGoalCentroid" :depends-on ("_package_startGoalCentroid"))
    (:file "_package_startGoalCentroid" :depends-on ("_package"))
  ))