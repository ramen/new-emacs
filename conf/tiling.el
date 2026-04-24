;;; tiling.el --- Tiling (xmonad-style) window management bindings

(global-set-key (kbd "<S-s-return>") 'split-window-dwim)
(global-set-key (kbd "<s-return>") 'swap-with-largest-window)
(global-set-key (kbd "s-'") 'swap-with-largest-window)
(global-set-key (kbd "s-:") 'delete-window-and-balance)
(global-set-key (kbd "s-C") 'delete-window-and-balance)
(global-set-key (kbd "s-J") 'rotate-windows)
(global-set-key (kbd "s-K") 'rotate-windows-reverse)
(global-set-key (kbd "s-[") 'shrink-first-window-horizontally)
(global-set-key (kbd "s-\"") 'split-window-dwim)
(global-set-key (kbd "s-]") 'enlarge-first-window-horizontally)
(global-set-key (kbd "s-j") 'other-window)
(global-set-key (kbd "s-k") 'other-window-reverse)
(global-set-key (kbd "s-m") 'toggle-maximized)

(setq split-width-threshold 140)

(defun delete-window-and-balance ()
  (interactive)
  (delete-window)
  (if (fboundp 'window-combined-p)
      (when (window-combined-p) (balance-windows (window-parent)))
    (balance-windows)))

(defun enlarge-first-window-horizontally (delta)
  "Like enlarge-window, but apply to the first window."
  (interactive "p")
  (with-selected-window (frame-first-window)
    (enlarge-window delta t)))

(defun other-window-reverse (count)
  (interactive "p")
  (other-window (- count)))

(defun rotate-windows (count)
  "Swap or rotate windows with their neighbors."
  (interactive "p")
  (let ((this-buffer (buffer-name)))
    (other-window count)
    (let ((that-buffer (buffer-name)))
      (switch-to-buffer this-buffer)
      (other-window (- count))
      (switch-to-buffer that-buffer)
      (other-window count))))

(defun rotate-windows-reverse (count)
  (interactive "p")
  (rotate-windows (- count)))

(defun shrink-first-window-horizontally (delta)
  "Like shrink-window, but apply to the first window."
  (interactive "p")
  (with-selected-window (frame-first-window)
    (shrink-window delta t)))

(defun split-window-dwim ()
  "Split window horizontally or vertically depending on space."
  (interactive)
  (select-window (if (window-splittable-p (selected-window) t)
                     (split-window-horizontally)
                   (split-window-vertically)))
  (balance-windows (and (fboundp 'window-parent) (window-parent))))

(defun swap-with-largest-window ()
  "Switch the buffer in the current window with that of the largest window."
  (interactive)
  (let ((current-window (selected-window))
        (current-buffer (window-buffer))
        (largest-window (get-largest-window)))
    (set-window-buffer current-window (window-buffer largest-window))
    (set-window-buffer largest-window current-buffer)
    (select-window largest-window)))

(defvar unmaximized-window-configuration)
(defun toggle-maximized ()
  (interactive)
  (cond ((window-parent)
         (setq unmaximized-window-configuration (current-window-configuration))
         (delete-other-windows))
        ((boundp 'unmaximized-window-configuration)
         (set-window-configuration unmaximized-window-configuration))))
