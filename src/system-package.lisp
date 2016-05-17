;;;; ***********************************************************************
;;;;
;;;; Name:          package.lisp
;;;; Project:       rudiment: a lisp webapp template
;;;; Purpose:       package definitions
;;;; Author:        mikel evins
;;;; Copyright:     2016 by mikel evins
;;;;
;;;; ***********************************************************************

(in-package :cl-user)

;;; ---------------------------------------------------------------------
;;; the rudiment package
;;; ---------------------------------------------------------------------

(defpackage #:rudiment
  (:use #:cl)
  (:export #:starts-with?))


