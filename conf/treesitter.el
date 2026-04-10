;;; treesitter.el --- Tree-sitter setup via treesit-auto

(use-package treesit-auto
  :ensure t
  :custom (treesit-auto-install 'prompt)
  :config (global-treesit-auto-mode))
