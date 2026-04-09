(menu-bar-mode -1)
(setq visible-bell t)
(setq inhibit-startup-screen t)
(setq use-short-answers t)

;; Mouse support in terminal
(unless window-system
  (xterm-mouse-mode 1))
