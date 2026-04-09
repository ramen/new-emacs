(defun indent-current-region ()
  "Indent the current region by the current tab width."
  (interactive)
  (indent-rigidly (region-beginning) (region-end) tab-width))

(defun dedent-current-region ()
  "Dedent the current region by the current tab width."
  (interactive)
  (indent-rigidly (region-beginning) (region-end) (- tab-width)))
