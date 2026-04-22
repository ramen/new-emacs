;;; grep.el --- Grep configuration

(with-eval-after-load 'grep
  (add-hook 'grep-mode-hook (lambda () (setq-local truncate-lines t)))

  (add-to-list 'grep-find-ignored-directories "node_modules")
  (add-to-list 'grep-find-ignored-directories "target"))
