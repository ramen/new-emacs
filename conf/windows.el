;;; windows.el --- Windows-specific configuration

(when (eq system-type 'windows-nt)
  (setq frame-title-format "%b")

  (setq diff-command "wsl diff")
  (setq find-ls-option '("-exec ls -ld {} \\;" . "-ld"))
  (setq find-program "wsl find")
  (setq grep-find-template "wsl find . <X> -type f <F> -exec grep <C> -nHP -e <R> {} /dev/null \\;")

  (setq consult-ripgrep-args "wsl rg --null --line-buffered --color=never --max-columns=1000 --path-separator / --smart-case --no-heading --with-filename --line-number --search-zip")

  (setq ;; w32-pass-lwindow-to-system nil
        ;; w32-pass-rwindow-to-system nil
        w32-lwindow-modifier 'super
        w32-rwindow-modifier 'super))
