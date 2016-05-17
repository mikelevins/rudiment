;;;; ***********************************************************************
;;;;
;;;; Name:          system-html.lisp
;;;; Project:       rudiment: a lisp webapp template
;;;; Purpose:       tools for processing html templates
;;;; Author:        mikel evins
;;;; Copyright:     2016 by mikel evins
;;;;
;;;; ***********************************************************************

(in-package #:rudiment)

;;; ---------------------------------------------------------------------
;;; template processing
;;; ---------------------------------------------------------------------

(defmethod process-template ((path pathname) &optional env)
  (emb:execute-emb path :env env))

(defmethod process-template ((path string) &optional env)
  (process-template (pathname path) env))

(defmethod compile-template ((path pathname) &optional env)
  (let* ((static-files-path (pathname (asdf:system-relative-pathname :rudiment #P"public/")))
         (basename (make-pathname :name (pathname-name path)
                                  :type "html"))
         (out-path (merge-pathnames basename static-files-path))
         (out-text (process-template path env)))
    (with-open-file (out out-path :direction :output
                         :element-type 'character
                         :external-format :utf-8
                         :if-does-not-exist :create
                         :if-exists :supersede)
      (write-string out-text out))))

(defmethod compile-template ((path string) &optional env)
  (compile-template (pathname path) env))


