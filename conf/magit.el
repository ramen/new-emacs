;;; magit.el --- Magit customizations

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :custom
  (magit-diff-visit-prefer-worktree t)
  (magit-revision-insert-related-refs-display-alist '((merged . nil)))
  :config
  (transient-suffix-put 'magit-diff "d" :key "D")
  (transient-suffix-put 'magit-diff "r" :key "d")
  (transient-suffix-put 'magit-fetch "u" :key "f")
  (transient-suffix-put 'magit-pull "u" :key "F")
  (transient-suffix-put 'magit-push "u" :key "P")
  ;; Keep the old `P - u P' push workflow available.  Magit now hides
  ;; --set-upstream at transient level 5, above the default level.
  (transient-suffix-put 'magit-push "-u" :level 4)
  (transient-suffix-put 'magit-rebase "e" :key "r"))

;; Stop stealing keyboard shortcuts
(with-eval-after-load 'magit
  (define-key magit-mode-map (kbd "C-<tab>") nil)
  (define-key magit-mode-map (kbd "C-1") 'magit-section-show-level-1-all)
  (define-key magit-mode-map (kbd "C-2") 'magit-section-show-level-2-all)
  (define-key magit-mode-map (kbd "C-3") 'magit-section-show-level-3-all)
  (define-key magit-mode-map (kbd "C-4") 'magit-section-show-level-4-all)
  (define-key magit-mode-map (kbd "M-1") 'digit-argument)
  (define-key magit-mode-map (kbd "M-2") 'digit-argument)
  (define-key magit-mode-map (kbd "M-3") 'digit-argument)
  (define-key magit-mode-map (kbd "M-4") 'digit-argument))

;; Use enter key to view diffs in vc-change-log
(add-hook 'log-view-mode-hook
          (lambda ()
            (define-key log-view-mode-map (kbd "RET")
              'log-view-diff-changeset)))
