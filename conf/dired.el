;;; dired.el --- Dired mode customizations

(with-eval-after-load 'dired
  (define-key dired-mode-map "." 'dired-up-directory)
  (define-key dired-mode-map "\C-o" 'dired-find-file-other-window)
  (define-key dired-mode-map "o" 'dired-display-file))
