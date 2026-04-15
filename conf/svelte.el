;;; svelte.el --- Svelte mode configuration

;; Install svelte-ts-mode from GitHub (not yet in MELPA)
(unless (package-installed-p 'svelte-ts-mode)
  (package-vc-install "https://github.com/leafOfTree/svelte-ts-mode"))

;; Register and install tree-sitter grammars required by svelte-ts-mode
(require 'treesit)
(dolist (entry (if (and (fboundp 'treesit-library-abi-version)
                        (eq (treesit-library-abi-version) 14))
                   ;; Pin to last ABI-14-compatible releases
                   '((svelte "https://github.com/tree-sitter-grammars/tree-sitter-svelte" "v1.0.2"  "src")
                     (css    "https://github.com/tree-sitter/tree-sitter-css"             "v0.23.2" "src"))
                 '((svelte "https://github.com/tree-sitter-grammars/tree-sitter-svelte")
                   (css    "https://github.com/tree-sitter/tree-sitter-css"))))
  (add-to-list 'treesit-language-source-alist entry))
(dolist (lang '(svelte css))
  (unless (treesit-language-available-p lang)
    (treesit-install-language-grammar lang)))

(require 'svelte-ts-mode)
