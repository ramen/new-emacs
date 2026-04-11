;;; c.el --- C/C++ configuration (tree-sitter)  -*- lexical-binding: t; -*-

(defun db/c-ts-setup ()
  (setq-local comment-start "// ")
  (setq-local comment-end "")
  (setq-local comment-start-skip "// *")
  (let* ((lang (if (eq major-mode 'c++-ts-mode) 'cpp 'c))
         ;; Anchor: first non-whitespace char on the grandparent's start line.
         (gpbol (lambda (_node parent _bol)
                  (save-excursion
                    (goto-char (treesit-node-start (treesit-node-parent parent)))
                    (back-to-indentation)
                    (point))))
         ;; True when inside list-node-type whose first child is on a new line after (.
         (split-list-p
          (lambda (list-type _node parent _bol)
            (when (string= (treesit-node-type parent) list-type)
              (let ((open  (treesit-node-child parent 0))
                    (first (treesit-node-child parent 1)))
                (and open first
                     (< (line-number-at-pos (treesit-node-end open))
                        (line-number-at-pos (treesit-node-start first))))))))
         (split-args-p   (apply-partially split-list-p "argument_list"))
         (split-params-p (apply-partially split-list-p "parameter_list"))
         (split-close-p
          (lambda (node parent bol)
            (and (string= (treesit-node-type node) ")")
                 (or (funcall split-args-p node parent bol)
                     (funcall split-params-p node parent bol))))))
    (setq-local treesit-simple-indent-rules
                (mapcar
                 (lambda (entry)
                   (if (eq (car entry) lang)
                       `(,lang .
                         (;; Preprocessor directives flush left
                          ((node-is "^preproc_") (lambda (_n _p bol) bol) 0)
                          ;; Template type arguments: one level in, closing > at declaration column
                          ((n-p-gp ">" "template_argument_list" nil) parent-bol 0)
                          ((parent-is "template_argument_list") parent-bol c-ts-mode-indent-offset)
                          ;; Split-style call args / params (first item on new line): one level in, ) at call column
                          (,split-close-p parent-bol 0)
                          (,split-args-p parent-bol c-ts-mode-indent-offset)
                          (,split-params-p parent-bol c-ts-mode-indent-offset)
                          ;; Function body: anchor to function_definition line, not the { line
                          ((n-p-gp "}" "compound_statement" "function_definition") ,gpbol 0)
                          ((n-p-gp nil "compound_statement" "function_definition") ,gpbol c-ts-mode-indent-offset)
                          ;; No extra indent inside C++ namespace bodies
                          ,@(when (eq lang 'cpp)
                              '(((n-p-gp nil "declaration_list" "namespace_definition")
                                 grand-parent 0)))
                          ,@(cdr entry)))
                     entry))
                 treesit-simple-indent-rules))))

(use-package c-ts-mode
  :custom (c-ts-mode-indent-style 'bsd)
  :hook ((c-ts-mode c++-ts-mode) . db/c-ts-setup))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-ts-mode))
