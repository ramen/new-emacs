;; Custom file — keep custom-set-variables/faces out of init.el
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

;; Backups and auto-save
(setq auto-save-default nil)
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

;; Package management
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Load all config files from conf/
(let ((conf-dir (concat user-emacs-directory "conf/")))
  (when (file-directory-p conf-dir)
    (mapc #'load (directory-files conf-dir t "\\.el$"))))

;; Local overrides (not checked into git)
(load (concat user-emacs-directory "local") 'noerror)
