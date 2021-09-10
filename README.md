# neovim-lua

Migrating neovim config to lua

Testing neovim 0.5 features

## Screenshot

![](./screenshot.png)

## Features

- [x] Plugins Managed Using Packer
- [x] Packer Installer
- [x] Telescope + ripgrep Fuzze Finder
- [x] Neovim LSP
- [x] Language Specific LSP (`Go`, `Javascript`, `TypeScript`, `Rust`, `lua`)
- [x] LSP, Snippet + Buffer Completion
- [x] Treesitter Syntax Highlighting

## TODO

- [ ] linter on save

old linter setup using ALE

```
let g:ale_linters = {'rust': ['analyzer'], 'go': ['golint', 'gofmt'], 'javascript': ['eslint'],'CloudFormation' : ['cfn-lint']}
let g:ale_fixers = {'rust': ['rustfmt'], 'javascript': ['eslint'], 'json': ['jq']}
```
