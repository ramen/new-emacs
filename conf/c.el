;;; c.el --- C/C++ configuration (tree-sitter)

(defun db/c-ts-setup ()
  "Configure indentation and comments for C/C++ tree-sitter modes."
  (setq-local comment-start "// ")
  (setq-local comment-end "")
  (setq-local comment-start-skip "// *")
  ;; Indent continuation parameters one level from the function start,
  ;; and align the closing ) with the function start.
  (let ((lang (if (eq major-mode 'c++-ts-mode) 'cpp 'c)))
    (setq-local treesit-simple-indent-rules
                (mapcar
                 (lambda (entry)
                   (if (eq (car entry) lang)
                       `(,lang .
                         (((n-p-gp ")" "parameter_list" nil) parent-bol 0)
                          ((parent-is "parameter_list") parent-bol c-ts-mode-indent-offset)
                          ,@(cdr entry)))
                     entry))
                 treesit-simple-indent-rules)))
  ;; No extra indent inside C++ namespace bodies.
  (when (eq major-mode 'c++-ts-mode)
    (setq-local treesit-simple-indent-rules
                (mapcar
                 (lambda (entry)
                   (if (eq (car entry) 'cpp)
                       `(cpp .
                         (((n-p-gp nil "declaration_list" "namespace_definition")
                           grand-parent 0)
                          ,@(cdr entry)))
                     entry))
                 treesit-simple-indent-rules))))

(use-package c-ts-mode
  :custom
  (c-ts-mode-indent-style 'bsd)
  :hook
  ((c-ts-mode c++-ts-mode) . db/c-ts-setup))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-ts-mode))
