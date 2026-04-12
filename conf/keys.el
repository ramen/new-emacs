;;; keys.el --- Custom key bindings

(require 'misc) ; for zap-up-to-char

;; Navigation
(global-set-key (kbd "M-`") 'next-error)
(use-package goto-chg
  :ensure t
  :bind ("M-_" . goto-last-change))

;; Scrolling
(global-set-key (kbd "<C-S-down>") 'scroll-up-line)
(global-set-key (kbd "<C-S-up>") 'scroll-down-line)
(global-set-key (kbd "<mouse-4>") 'scroll-down-line)
(global-set-key (kbd "<mouse-5>") 'scroll-up-line)

;; Window management
(global-set-key (kbd "<M-up>") 'enlarge-window)
(global-set-key (kbd "<M-down>") 'shrink-window)
(global-set-key (kbd "s-[") 'db/shrink-first-window-horizontally)
(global-set-key (kbd "s-]") 'db/enlarge-first-window-horizontally)
(global-set-key (kbd "<C-tab>") 'next-window-any-frame)
(global-set-key (kbd "<C-S-tab>") 'previous-window-any-frame)
(windmove-default-keybindings)

;; Indentation
(global-set-key (kbd "<M-right>") 'db/indent-current-region)
(global-set-key (kbd "<M-left>") 'db/dedent-current-region)

;; Shell
(global-set-key (kbd "C-x m") 'shell)

;; Editing
(global-set-key (kbd "M-#") 'db/comment-line)
(global-set-key (kbd "M-)") 'close-open-paren)
(global-set-key (kbd "M-+") 'db/duplicate-line-or-region)
(global-set-key (kbd "M-z") 'zap-up-to-char)

;; Line-oriented commands
(global-set-key (kbd "<home>") 'move-beginning-of-line)
(global-set-key (kbd "<end>") 'move-end-of-line)

;; During isearch, C-o exits and opens consult-line with the current search term
(define-key isearch-mode-map (kbd "C-o") (lambda ()
  (interactive)
  (let ((query isearch-string))
    (isearch-exit)
    (consult-line query))))
