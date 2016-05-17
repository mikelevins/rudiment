;;;; ***********************************************************************
;;;;
;;;; Name:          routes-login.lisp
;;;; Project:       rudiment: a network of common interests
;;;; Purpose:       page-route definitions for the login page
;;;; Author:        mikel evins
;;;; Copyright:     2016 by mikel evins
;;;;
;;;; ***********************************************************************

(in-package #:restas.rudiment)

;;; =====================================================================
;;; helper functions
;;; =====================================================================

(defun login-page ()
  (rudiment::process-template (asdf:system-relative-pathname :rudiment "templates/login.tmpl")
                              nil))

;;; =====================================================================
;;; routes
;;; =====================================================================

;;; ---------------------------------------------------------------------
;;; route: /login
;;; ---------------------------------------------------------------------
;;; the main rudiment landing page

(define-route main ("login")
  (login-page))
