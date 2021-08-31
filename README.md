# neovim-lua

Migrating neovim config to lua

Testing neovim 0.5 features

## Features

- [x] Plugins Managed Using Packer
- [x] ripgrep
- [x] telescope
- [x] Neovim LSP
- [x] LSP + Snippet Autocomplete
- [x] rust-analyzer lsp (Rust)
- [x] gopls lsp (Golang)
- [x] tsserver lsp (Typescript, Javascript)
- [x] lightline with powerline colors

## Extras

- [x] Packer installer (https://github.com/tjdevries/config_manager)

## Notes

Currently have treesitter disabled due to performance

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

