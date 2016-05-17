;;;; ***********************************************************************
;;;;
;;;; Name:          module.lisp
;;;; Project:       rudiment: a lisp webapp template
;;;; Purpose:       the restas module definition
;;;; Author:        mikel evins
;;;; Copyright:     2016 by mikel evins
;;;;
;;;; ***********************************************************************

(in-package :rudiment)

;;; ---------------------------------------------------------------------
;;; the rudiment restas module
;;; ---------------------------------------------------------------------

(restas:define-module #:restas.rudiment
  (:use :cl :cl-markup :hunchentoot :rudiment)
  (:import-from #:restas #:define-route))
