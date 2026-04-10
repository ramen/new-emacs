;; UI chrome
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Appearance
(set-face-attribute 'default nil :height 140)
(load-theme 'modus-vivendi t)
(set-face-attribute 'default nil :background "#2b2b2b" :foreground "#d4d4d4")

;; Behavior
(setq inhibit-startup-screen t)
(setq use-short-answers t)
(delete-selection-mode 1)

;; Subtle visual bell — briefly flash the mode line
(setq visible-bell nil)
(setq ring-bell-function
      (lambda ()
        (invert-face 'mode-line)
        (run-with-timer 0.1 nil #'invert-face 'mode-line)))

;; Mouse support in terminal
(unless window-system
  (xterm-mouse-mode 1))
