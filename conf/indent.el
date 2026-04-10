;;; indent.el --- Indentation

;; Default to 2 spaces, no tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Auto-detect indentation style from file contents
(use-package dtrt-indent
  :ensure t
  :config (dtrt-indent-global-mode 1))
