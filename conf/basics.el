;; UI chrome
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Appearance
(defun db/preferred-font ()
  "Return the best available font family for the current platform."
  (seq-find (lambda (f) (member f (font-family-list)))
            (pcase system-type
              ('darwin       '("SF Mono" "Menlo" "Monaco"))
              ('windows-nt   '("Cascadia Code" "Consolas"))
              (_             '("JetBrains Mono" "Source Code Pro" "DejaVu Sans Mono")))))

(defun db/preferred-height ()
  "Return a font height appropriate for the current platform."
  (pcase system-type
    ('darwin     140)   ; macOS Retina: 14pt
    ('windows-nt 110)   ; Windows: 11pt
    (_           110)))

(set-face-attribute 'default nil
                    :family (db/preferred-font)
                    :height (db/preferred-height))

(load-theme 'modus-vivendi t)

(if window-system
    (set-face-attribute 'default nil :background "#1b1b1b" :foreground "#d4d4d4")
  (set-face-attribute 'default nil :background "unspecified-bg" :foreground "unspecified-fg"))

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
