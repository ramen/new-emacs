;;; dired.el --- Dired mode customizations

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd ".") 'dired-up-directory))
