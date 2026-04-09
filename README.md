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
