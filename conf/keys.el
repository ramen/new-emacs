;; Navigation
(global-set-key (kbd "M-`") 'next-error)
(use-package goto-chg
  :ensure t
  :bind ("M-_" . goto-last-change))

;; Scrolling
(global-set-key (kbd "<C-S-up>") 'scroll-down-line)
(global-set-key (kbd "<C-S-down>") 'scroll-up-line)

;; Window management
(global-set-key (kbd "<M-up>") 'enlarge-window)
(global-set-key (kbd "<M-down>") 'shrink-window)
(global-set-key (kbd "s-[") 'shrink-first-window-horizontally)
(global-set-key (kbd "s-]") 'enlarge-first-window-horizontally)
(windmove-default-keybindings)

;; Indentation
(global-set-key (kbd "<M-right>") 'indent-current-region)
(global-set-key (kbd "<M-left>") 'dedent-current-region)

;; Shell
(global-set-key (kbd "C-x m") 'shell)
