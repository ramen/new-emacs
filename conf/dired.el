(setq insert-directory-program "gls")
(setq dired-listing-switches "-alh --group-directories-first")

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd ".") 'dired-up-directory))
