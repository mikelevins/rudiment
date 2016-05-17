;;;; ***********************************************************************
;;;;
;;;; Name:          passwords.lisp
;;;; Project:       rudiment: a network of common interests
;;;; Purpose:       password hash
;;;; Author:        mikel evins
;;;; Copyright:     2016 by mikel evins
;;;;
;;;; ***********************************************************************

(in-package :rudiment)

;;; from: http://www.cliki.net/ironclad
;;; March 17th, 2016
;;; TODO: add salt to defend against rainbow-table attacks
(defun hash-password (password)
  (ironclad:byte-array-to-hex-string 
   (ironclad:digest-sequence 
    :sha256
    (ironclad:ascii-string-to-byte-array password))))

;;; (hash-password "foo")
;;; (hash-password "password")


