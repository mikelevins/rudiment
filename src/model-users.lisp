;;;; ***********************************************************************
;;;;
;;;; Name:          users.lisp
;;;; Project:       rudiment: a lisp webapp template
;;;; Purpose:       modeling rudiment users
;;;; Author:        mikel evins
;;;; Copyright:     2016 by mikel evins
;;;;
;;;; ***********************************************************************

(in-package :rudiment)

;;; ---------------------------------------------------------------------
;;; 
;;; ---------------------------------------------------------------------

(defmethod read-registered-users ((in stream))
  (loop for line = (read in nil nil nil)
     until (null line)
     collect line))

(defmethod write-registered-users ((users cons)(out stream))
  (loop for user in users
     do (progn (format out "~S" user)
	       (terpri out))))

(defmethod read-registered-users ((path pathname))
  (with-open-file (in path :direction :input)
    (read-registered-users in)))

(defmethod write-registered-users ((users cons)(path pathname))
  (with-open-file (out path :direction :output
		      :if-does-not-exist :create
		      :if-exists :supersede)
    (write-registered-users users out)))

(defmethod read-registered-users ((path string))
  (read-registered-users (pathname path)))

(defmethod write-registered-users ((users cons)(path string))
  (write-registered-users users (pathname path)))

(defun registered-users ()
  (read-registered-users $rudiment-users-file))

(defun list-registered-users ()
  (sort (mapcar (lambda (u)(getf u :username nil))
		(read-registered-users $rudiment-users-file))
	#'string<))

(defun create-user-account (username password)
  (let* ((old-users (registered-users))
	 (password-hash (hash-password password))
	 (new-user `(:username ,username :password ,password-hash :attributes nil))
	 (new-users (sort (cons new-user old-users) 
			  #'string< :key (lambda (u)(getf u :username)))))
    (write-registered-users new-users $rudiment-users-file)))

(defmethod find-user ((username string))
  (let* ((users (registered-users)))
    (find username users
          :key (lambda (u)(getf u :username nil))
          :test #'equal)))

;;; (registered-users)
;;; (find-user "mikel")

