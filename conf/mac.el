;;; mac.el --- Mac-specific configuration

(when (eq system-type 'darwin)
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta)

  (global-set-key (kbd "<f13>") 'overwrite-mode)
  (global-set-key (kbd "<C-f13>") 'ns-copy-including-secondary)
  (global-set-key (kbd "<S-f13>") 'yank))
