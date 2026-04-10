;;; typescript.el --- TypeScript mode configuration

;; Use tree-sitter modes for TypeScript and TSX
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))
