;;; modeline.el --- Modeline configuration

(column-number-mode 1)

(use-package nerd-icons
  :ensure t)

(use-package doom-modeline
  :ensure t
  :custom (doom-modeline-unicode-fallback (not (display-graphic-p)))
  :init
  (unless (display-graphic-p)
    (setq doom-modeline-icon nil))
  (doom-modeline-mode 1))
