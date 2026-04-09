# new-emacs

Minimal Emacs configuration. Use with:

```
emacs --init-directory=~/new-emacs
```

## Tree-sitter grammars

Some language modes require tree-sitter grammars. Install them from within Emacs:

```
M-x treesit-install-language-grammar RET javascript RET
M-x treesit-install-language-grammar RET typescript RET
M-x treesit-install-language-grammar RET tsx RET
```

Accept the defaults when prompted.

## Local configuration

`local.el` is loaded last and ignored by git. Use it for machine-specific
settings. For example, on macOS with GNU coreutils (`brew install coreutils`):

```elisp
;; Use GNU ls for better dired sorting
(setq insert-directory-program "gls")
(setq dired-listing-switches "-alh --group-directories-first")
```
