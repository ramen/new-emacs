;; Windows-specific configuration
(when (eq system-type 'windows-nt)
  (setq find-ls-option '("-exec ls -ld {} \\;" . "-ld"))
  (setq find-program "wsl find")
  (setq diff-command "wsl diff")
  (setq grep-find-template "wsl find . <X> -type f <F> -exec grep <C> -nHP -e <R> {} /dev/null \\;")
  (setq ;; w32-pass-lwindow-to-system nil
        ;; w32-pass-rwindow-to-system nil
        w32-lwindow-modifier 'super
        w32-rwindow-modifier 'super))
