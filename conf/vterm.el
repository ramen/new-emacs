;;; vterm.el --- Terminal emulator configuration  -*- lexical-binding: t; -*-

;; vterm requires Unix PTYs and is unsupported in native Windows Emacs.
(use-package vterm
  :unless (eq system-type 'windows-nt)
  :ensure t
  :bind ("C-c v" . vterm))
