;;; c-mode.el --- c/c++ style configuration

(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-style "java")
            (c-set-offset 'access-label '-)
            (c-set-offset 'case-label '+)
            (c-set-offset 'innamespace 0)
            (c-set-offset 'substatement-open 0)
            (setq c-basic-offset tab-width)
            (setq comment-start "// ")
            (setq comment-end "")
            (setq comment-start-skip "// *")
            (subword-mode 1)))

(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
