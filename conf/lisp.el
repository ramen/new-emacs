;;; lisp.el --- Lisp mode configuration

;; Use lisp-interaction-mode by default for Emacs Lisp files.
(add-to-list 'auto-mode-alist '("\\.el$" . lisp-interaction-mode))

;; Redefine C-j in lisp-interaction-mode so that the result is displayed on
;; the same line and automatically marked so that it can be easily deleted.
(defun eval-print-last-sexp ()
  "Evaluate sexp before point; print value into current buffer and mark."
  (interactive)
  (push-mark 
   (save-excursion
     (eval-last-sexp t)
     (point))
   t t)
  (setq deactivate-mark nil))
