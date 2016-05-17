;;;; ***********************************************************************
;;;;
;;;; Name:          utils.lisp
;;;; Project:       rudiment: a network of common interests
;;;; Purpose:       general utility functions
;;;; Author:        mikel evins
;;;; Copyright:     2016 by mikel evins
;;;;
;;;; ***********************************************************************

(in-package :rudiment)

;;; ---------------------------------------------------------------------
;;; string utilities
;;; ---------------------------------------------------------------------

(defmethod starts-with? ((string string)(prefix string))
  (if (< (length string)
         (length prefix))
      nil
      (equal 0 (search prefix string :test #'equal))))

;;; ---------------------------------------------------------------------
;;; time utilities
;;; ---------------------------------------------------------------------

(defmethod timestamp< ((left rfc3339:timestamp)(right rfc3339:timestamp))
  (< (rfc3339:utc-time-of left)
     (rfc3339:utc-time-of right)))


