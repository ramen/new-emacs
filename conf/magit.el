;;; magit.el --- Magit customizations

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :custom
  (magit-revision-insert-related-refs-display-alist '((merged . nil)))
  :config
  (transient-suffix-put 'magit-diff "r" :key "d")
  (transient-suffix-put 'magit-fetch "u" :key "f")
  (transient-suffix-put 'magit-pull "u" :key "F")
  (transient-suffix-put 'magit-push "u" :key "P")
  (transient-suffix-put 'magit-rebase "e" :key "r"))
