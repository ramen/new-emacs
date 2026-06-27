;;; consult.el --- Consult completion

(recentf-mode 1)

(use-package vertico
  :ensure t
  :init (vertico-mode))

(use-package orderless
  :ensure t
  :custom (completion-styles '(orderless basic)))

(use-package consult
  :ensure t
  :bind (("C-x b" . consult-buffer)
         ("C-c g" . consult-ripgrep)
         ("M-g" . consult-goto-line))
  :config
  (consult-customize
   consult-buffer
   consult-project-buffer
   :preview-key nil))

;; During isearch, C-o exits and opens consult-line with the current search term
(define-key isearch-mode-map (kbd "C-o") (lambda ()
  (interactive)
  (let ((query isearch-string))
    (isearch-exit)
    (consult-line query))))
