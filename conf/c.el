;;; c.el --- C/C++ configuration (tree-sitter)

(use-package c-ts-mode
  :custom
  (c-ts-mode-indent-style 'bsd)
  :hook
  ((c-ts-mode c++-ts-mode) . (lambda ()
                               (setq-local comment-start "// ")
                               (setq-local comment-end "")
                               (setq-local comment-start-skip "// *"))))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-ts-mode))
