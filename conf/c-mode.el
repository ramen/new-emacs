;;; c-mode.el --- c/c++ style configuration

(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-style "java")

            (c-set-offset 'access-label '-)
            (c-set-offset 'arglist-close 0)
            (c-set-offset 'arglist-intro '+)
            (c-set-offset 'case-label '+)
            (c-set-offset 'innamespace 0)
            (c-set-offset 'statement-case-open 0)
            (c-set-offset 'substatement-open 0)

            (setq comment-end "")
            (setq comment-start "// ")
            (setq comment-start-skip "// *")))

(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
