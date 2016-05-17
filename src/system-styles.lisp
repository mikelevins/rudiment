;;;; ***********************************************************************
;;;;
;;;; Name:          system-styles.lisp
;;;; Project:       rudiment: a lisp webapp template
;;;; Purpose:       tools for compiling stylesheets
;;;; Author:        mikel evins
;;;; Copyright:     2016 by mikel evins
;;;;
;;;; ***********************************************************************

(in-package :rudiment)

;;; ---------------------------------------------------------------------
;;; 
;;; ---------------------------------------------------------------------

(defmethod construct-output-path-for-stylesheet ((in-path pathname))
  (let* ((basename (pathname-name in-path))
         (output-directory (asdf:system-relative-pathname :rudiment "public/css/"))
         (filename (make-pathname :name basename :type "css")))
    (merge-pathnames filename output-directory)))

(defmethod construct-output-path-for-stylesheet ((in-path string))
  (construct-output-path-for-stylesheet (pathname in-path)))

(defmethod compile-styles ((in-path pathname) &optional out-path)
  (let* ((out-path (or out-path
                       (construct-output-path-for-stylesheet in-path))))
    (lass:generate in-path :out out-path :pretty t :if-exists :supersede)))


(defmethod compile-styles ((in-path string) &optional out-path)
  (compile-styles (pathname in-path) out-path))
