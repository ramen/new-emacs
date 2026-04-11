;;; treesitter.el --- Tree-sitter setup via treesit-auto

(use-package treesit-auto
  :ensure t
  :custom (treesit-auto-install 'prompt)
  :config
  ;; Pin grammars to last ABI-14-compatible release
  (when (and (fboundp 'treesit-library-abi-version)
             (eq (treesit-library-abi-version) 14))
    (add-to-list 'treesit-language-source-alist
                 '(javascript "https://github.com/tree-sitter/tree-sitter-javascript" "v0.23.1" "src"))
    (add-to-list 'treesit-language-source-alist
                 '(lua "https://github.com/tree-sitter-grammars/tree-sitter-lua" "v0.3.0" "src"))
    (add-to-list 'treesit-language-source-alist
                 '(c "https://github.com/tree-sitter/tree-sitter-c" "v0.21.4" "src"))
    (add-to-list 'treesit-language-source-alist
                 '(cpp "https://github.com/tree-sitter/tree-sitter-cpp" "v0.21.0" "src"))
    (add-to-list 'treesit-language-source-alist
                 '(rust "https://github.com/tree-sitter/tree-sitter-rust" "v0.21.2" "src")))
  (global-treesit-auto-mode))
