;;; defuns.el --- Custom functions

(defun indent-current-region ()
  "Indent the current region by the current tab width."
  (interactive)
  (indent-rigidly (region-beginning) (region-end) tab-width))

(defun dedent-current-region ()
  "Dedent the current region by the current tab width."
  (interactive)
  (indent-rigidly (region-beginning) (region-end) (- tab-width)))

(defun enlarge-first-window-horizontally (delta)
  "Like enlarge-window, but apply to the first window."
  (interactive "p")
  (with-selected-window (frame-first-window)
    (enlarge-window delta t)))

(defun shrink-first-window-horizontally (delta)
  "Like shrink-window, but apply to the first window."
  (interactive "p")
  (with-selected-window (frame-first-window)
    (shrink-window delta t)))
