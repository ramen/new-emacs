;;; c.el --- C/C++ configuration (tree-sitter)

(defun db/c-ts-no-namespace-indent ()
  "Zero out indentation inside C++ namespace bodies."
  (setq-local treesit-simple-indent-rules
              (mapcar
               (lambda (entry)
                 (if (eq (car entry) 'cpp)
                     `(cpp . (((n-p-gp nil "declaration_list" "namespace_definition")
                               grand-parent 0)
                              ,@(cdr entry)))
                   entry))
               treesit-simple-indent-rules)))

(use-package c-ts-mode
  :custom
  (c-ts-mode-indent-style 'bsd)
  :hook
  ((c-ts-mode c++-ts-mode) . (lambda ()
                               (setq-local comment-start "// ")
                               (setq-local comment-end "")
                               (setq-local comment-start-skip "// *")))
  (c++-ts-mode . db/c-ts-no-namespace-indent))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-ts-mode))
