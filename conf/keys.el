(global-set-key (kbd "M-`") 'next-error)
(global-set-key (kbd "<M-up>") 'enlarge-window)
(global-set-key (kbd "<M-down>") 'shrink-window)

(use-package goto-chg
  :ensure t
  :bind ("M-_" . goto-last-change))

(global-set-key (kbd "<C-S-up>") 'scroll-down-line)
(global-set-key (kbd "<C-S-down>") 'scroll-up-line)

(global-set-key (kbd "<M-right>") 'indent-current-region)
(global-set-key (kbd "<M-left>") 'dedent-current-region)

(global-set-key (kbd "C-x m") 'shell)

(windmove-default-keybindings)
