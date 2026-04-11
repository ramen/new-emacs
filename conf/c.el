;;; c.el --- C/C++ configuration (tree-sitter)

(defun db/c-ts-setup ()
  "Configure indentation and comments for C/C++ tree-sitter modes."
  (setq-local comment-start "// ")
  (setq-local comment-end "")
  (setq-local comment-start-skip "// *")
  (let* ((lang    (if (eq major-mode 'c++-ts-mode) 'cpp 'c))
         ;; Regex matching control-flow statement node types
         (ctrl-re "\\(if\\|for\\|while\\|do\\)_statement")
         ;; Anchor: first non-whitespace column on the grandparent's start line.
         ;; This handles multi-line conditions where { ends up on a continuation
         ;; line far from the controlling keyword.
         (gpbol   (lambda (_node parent _bol)
                    (save-excursion
                      (goto-char (treesit-node-start
                                  (treesit-node-parent parent)))
                      (back-to-indentation)
                      (point)))))
    (setq-local treesit-simple-indent-rules
                (mapcar
                 (lambda (entry)
                   (if (eq (car entry) lang)
                       `(,lang .
                         (;; Preprocessor directives flush left
                          ((node-is "^preproc_") (lambda (_n _p bol) bol) 0)
                          ;; Continuation parameters: one level in, closing ) at function column
                          ((n-p-gp ")" "parameter_list" nil) parent-bol 0)
                          ((parent-is "parameter_list") parent-bol c-ts-mode-indent-offset)
                          ;; Template type arguments: one level in, closing > at declaration column
                          ((n-p-gp ">" "template_argument_list" nil) parent-bol 0)
                          ((parent-is "template_argument_list") parent-bol c-ts-mode-indent-offset)
                          ;; Control-flow compound body: anchor to keyword line, not to the {-line
                          ((n-p-gp "{" "compound_statement" ,ctrl-re) ,gpbol 0)
                          ((n-p-gp "}" "compound_statement" ,ctrl-re) ,gpbol 0)
                          ((n-p-gp nil "compound_statement" ,ctrl-re) ,gpbol c-ts-mode-indent-offset)
                          ;; No extra indent inside C++ namespace bodies
                          ,@(when (eq lang 'cpp)
                              '(((n-p-gp nil "declaration_list" "namespace_definition")
                                 grand-parent 0)))
                          ,@(cdr entry)))
                     entry))
                 treesit-simple-indent-rules))))

(use-package c-ts-mode
  :custom
  (c-ts-mode-indent-style 'bsd)
  :hook
  ((c-ts-mode c++-ts-mode) . db/c-ts-setup))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-ts-mode))
