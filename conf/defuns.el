;;; defuns.el --- Custom functions

(defun db/comment-line (arg)
  "Comment or uncomment the current line."
  (interactive "*P")
  (cond (mark-active (comment-dwim arg))
        ((= (line-beginning-position) (line-end-position)) (forward-line 1))
        (t (back-to-indentation)
           (set-mark-command nil)
           (end-of-line nil)
           (comment-dwim arg)
           (forward-line 1)
           (back-to-indentation))))

(defun db/duplicate-line-or-region (arg)
  "Clone the current region if active, otherwise clone the current line."
  (interactive "p")
  (if mark-active
      (db/duplicate-region arg)
    (db/duplicate-line arg)))

(defun db/duplicate-line (arg)
  "Clone the current line ARG times without changing the column position."
  (interactive "p")
  (let ((col (current-column)))
    (end-of-line 1)
    (if (eobp) (open-line 1))
    (beginning-of-line 1)
    (kill-new "")
    (kill-line 1)
    (yank)
    (yank)
    (when (> arg 1)
      (save-excursion
        (dotimes (i (- arg 1)) (yank))))
    (forward-line -1)
    (move-to-column col)))

(defun db/duplicate-region (arg)
  "Clone the current region ARG times."
  (interactive "p")
  (kill-region (region-beginning) (region-end))
  (yank)
  (yank)
  (when (> arg 1)
    (save-excursion
      (dotimes (i (- arg 1)) (yank))))
  (setq deactivate-mark nil))

(defun db/indent-current-region ()
  "Indent the current region by the current tab width."
  (interactive)
  (indent-rigidly (region-beginning) (region-end) tab-width))

(defun db/dedent-current-region ()
  "Dedent the current region by the current tab width."
  (interactive)
  (indent-rigidly (region-beginning) (region-end) (- tab-width)))

(defun db/enlarge-first-window-horizontally (delta)
  "Like enlarge-window, but apply to the first window."
  (interactive "p")
  (with-selected-window (frame-first-window)
    (enlarge-window delta t)))

(defun db/shrink-first-window-horizontally (delta)
  "Like shrink-window, but apply to the first window."
  (interactive "p")
  (with-selected-window (frame-first-window)
    (shrink-window delta t)))
