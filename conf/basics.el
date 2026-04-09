(menu-bar-mode -1)
(tool-bar-mode -1)
(setq visible-bell t)
(setq inhibit-startup-screen t)
(setq use-short-answers t)
(load-theme 'modus-vivendi t)

;; Mouse support in terminal
(unless window-system
  (xterm-mouse-mode 1))
