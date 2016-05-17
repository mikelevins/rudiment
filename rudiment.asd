;;;; ***********************************************************************
;;;;
;;;; Name:          rudiment.asd
;;;; Project:       rudiment: a lisp web-app template
;;;; Purpose:       main client
;;;; Author:        mikel evins
;;;; Copyright:     2016 by mikel evins
;;;;
;;;; ***********************************************************************

(in-package :cl-user)

;;; ---------------------------------------------------------------------
;;; the rudiment system
;;; ---------------------------------------------------------------------

(asdf:defsystem :rudiment
  :description "rudiment: a template for lisp webapps"
  :author "mikel evins <mevins@me.com>"
  :license "Apache 2.0"
  :depends-on (:queues :ironclad :uuid :rfc3339-timestamp :restas :cl-markup :cl-emb :parenscript :lass)
  :serial t
  :components ((:module "src"
                        :serial t
                        :components ((:file "system-package") ; program namespace definitions
                                     (:file "system-module") ; module definition for the restas library
                                     (:file "system-utils") ; general helper functions
                                     (:file "system-configuration") ; configuring the server
                                     (:file "system-handle") ; request handling
                                     (:file "system-styles") ; tools for compiling css
                                     (:file "system-html") ; tools for compiling html templates
                                     (:file "model-passwords") ; managing password data
                                     (:file "model-users") ; representing user accounts
                                     (:file "routes-main") ; the main landing page
                                     ))))

;;; controlling the server:
;;; (asdf:load-system :rudiment)
;;; (restas:start '#:restas.rudiment :port 8080)
;;; (restas:stop-all)
;;; (hunchentoot:reset-sessions (first restas::*acceptors*))

