# neovim-lua

Migrating neovim config to lua

Testing neovim 0.5 nightly features

Currently mainly tested / setup for `Rust` using Neovim LSP


## TODO

- [ ] linter on save (currently setup with ALE)


```
let g:ale_linters = {'rust': ['analyzer'], 'go': ['golint', 'gofmt'], 'javascript': ['eslint'],'CloudFormation' : ['cfn-lint']}
let g:ale_fixers = {'rust': ['rustfmt'], 'javascript': ['eslint'], 'json': ['jq']}
```

- [ ] set transparency (guibg=NONE) using lua
- [ ] add language specific config for LSP (`Go`, `Javascript`, `TypeScript`)
- [ ] set current keybindings in lua
- [ ] set language specific indent settings
- [ ] highlight whitespace

