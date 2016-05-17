;;;; ***********************************************************************
;;;;
;;;; Name:          routes-main.lisp
;;;; Project:       rudiment: a network of common interests
;;;; Purpose:       page-route definitions for the main landing page
;;;; Author:        mikel evins
;;;; Copyright:     2016 by mikel evins
;;;;
;;;; ***********************************************************************

(in-package #:restas.rudiment)

;;; =====================================================================
;;; helper functions
;;; =====================================================================

(defun main-page (env)
  (rudiment::process-template (asdf:system-relative-pathname :rudiment "templates/main.tmpl")
                              env))

;;; =====================================================================
;;; routes
;;; =====================================================================

;;; ---------------------------------------------------------------------
;;; route: /
;;; ---------------------------------------------------------------------
;;; the main rudiment landing page

(define-route main ("")
  (let* ((username (hunchentoot:session-value :username hunchentoot:*session*))
	 (user (rudiment::find-user username)))
    (if user
        (let* ((env `(:username ,username)))
          (main-page env))
        (redirect "/login"))))
