;;; treesitter.el --- Tree-sitter setup via treesit-auto

(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  ;; C/C++ excluded; use c-mode/c++-mode by default (c-mode.el).
  ;; Add c/cpp here to opt back in to tree-sitter for those languages.
  (treesit-auto-langs '(javascript typescript tsx lua rust yaml))
  :config
  ;; Pin grammars to last ABI-14-compatible release
  (when (and (fboundp 'treesit-library-abi-version)
             (eq (treesit-library-abi-version) 14))
    (dolist (entry '((c          "https://github.com/tree-sitter/tree-sitter-c"            "v0.21.4" "src")
                     (cpp        "https://github.com/tree-sitter/tree-sitter-cpp"          "v0.21.0" "src")
                     (javascript "https://github.com/tree-sitter/tree-sitter-javascript"   "v0.23.1" "src")
                     (lua        "https://github.com/tree-sitter-grammars/tree-sitter-lua" "v0.3.0"  "src")
                     (rust       "https://github.com/tree-sitter/tree-sitter-rust"         "v0.21.2" "src")))
      (add-to-list 'treesit-language-source-alist entry)))
  (global-treesit-auto-mode))
