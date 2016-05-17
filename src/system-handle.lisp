;;;; ***********************************************************************
;;;;
;;;; Name:          handle.lisp
;;;; Project:       rudiment: a lisp webapp template
;;;; Purpose:       custom request handler (handles authentication)
;;;; Author:        mikel evins
;;;; Copyright:     2016 by mikel evins
;;;;
;;;; ***********************************************************************

(in-package #:restas.rudiment)

;;; ---------------------------------------------------------------------
;;; unprotected routes
;;; ---------------------------------------------------------------------

(defun account-request? ()
  (equal "/create-account"
         (hunchentoot:script-name hunchentoot:*request*)))

(defun account-submission? ()
  (equal "/create-account-submit"
         (hunchentoot:script-name hunchentoot:*request*)))

(defun css-request? ()
  (starts-with? (hunchentoot:script-name hunchentoot:*request*)
                "/css/"))

(defun image-request? ()
  (starts-with? (hunchentoot:script-name hunchentoot:*request*)
                "/images/"))

(defun login-request? ()
  (equal "/login" 
	 (hunchentoot:script-name hunchentoot:*request*)))

(defun login-submission? ()
  (equal "/login-submit" 
	 (hunchentoot:script-name hunchentoot:*request*)))

(defun error-message? ()
  (equal "/error" 
	 (hunchentoot:script-name hunchentoot:*request*)))

(defun unprotected-route? ()
  (or (login-request?)
      (login-submission?)
      (account-request?)
      (account-submission?)
      (error-message?)
      (css-request?)
      (image-request?)))

;;; ---------------------------------------------------------------------
;;; session validity
;;; ---------------------------------------------------------------------

(defun session-valid? ()
  (and *session*
       (hunchentoot:session-value :username hunchentoot:*session*)
       t))

;;; ---------------------------------------------------------------------
;;; custom request-handler
;;; ---------------------------------------------------------------------

(defmethod handle-request :before ((acceptor acceptor) (request request))
  (unless (session-valid?)
    (unless (unprotected-route?)
      (redirect "/login"))))
