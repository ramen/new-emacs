(recentf-mode 1)

(use-package vertico
  :ensure t
  :init (vertico-mode))

(use-package orderless
  :ensure t
  :custom (completion-styles '(orderless basic)))

(use-package consult
  :ensure t
  :bind ("C-x b" . consult-buffer))
