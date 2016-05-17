;;;; ***********************************************************************
;;;;
;;;; Name:          configuration.lisp
;;;; Project:       rudiment: a lisp webapp template
;;;; Purpose:       runtime parameters for rudiment
;;;; Author:        mikel evins
;;;; Copyright:     2016 by mikel evins
;;;;
;;;; ***********************************************************************

(in-package :rudiment)

;;; ---------------------------------------------------------------------
;;; ABOUT
;;; ---------------------------------------------------------------------
;;; the rudiment webserver looks for a directory containing
;;; configuration information in ~/.rudiment
;;; the layout of the directory is thus:
;;; ~/.rudiment
;;;     private/
;;;       users.lisp
;;; ...plus any additional application-specific files.
;;; it is assumed that rudiment-based applications will
;;; replace the name "rudiment" with some application-defined name.

(defparameter $rudiment-root (pathname "~/Workshop/src/rudiment/"))
(defparameter $rudiment-home (pathname "~/.rudiment/"))

(defparameter $rudiment-private-directory 
  (merge-pathnames "private/" $rudiment-home))

(defparameter $rudiment-users-file 
  (merge-pathnames "users.lisp" $rudiment-private-directory))

