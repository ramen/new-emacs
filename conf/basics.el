(menu-bar-mode -1)
(tool-bar-mode -1)
(set-face-attribute 'default nil :height 140)
(setq inhibit-startup-screen t)
(setq use-short-answers t)
(load-theme 'modus-vivendi t)

;; Subtle visual bell — briefly flash the mode line
(setq visible-bell nil)
(setq ring-bell-function
      (lambda ()
        (invert-face 'mode-line)
        (run-with-timer 0.1 nil #'invert-face 'mode-line)))

;; Mouse support in terminal
(unless window-system
  (xterm-mouse-mode 1))
