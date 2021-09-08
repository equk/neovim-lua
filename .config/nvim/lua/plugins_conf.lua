-- plugin specific config
---- (plugin keybinds in ./keybindings.lua)
--
---- set lightline
vim.g.lightline = {
    colorscheme = 'powerline',
    active = {
        left = {{'mode', 'paste'}, {'gitbranch', 'readonly', 'filename', 'modified'}}
    },
    component_function = {
        gitbranch = 'gitbranch#name'
    }
}
---- lsp config
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
--- load lspconfig
local lspconfig = require 'lspconfig'
---- load completion
local cmp = require 'cmp'
---- completion config
cmp.setup {
  enabled = true,
  min_length = 2,
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    })
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lua' },
    { name = 'buffer' },
    { name = 'path' },
  },
}
---- snippets
-- use snippets from friendly-snippets
local snip_loader = require 'luasnip/loaders/from_vscode'
snip_loader.lazy_load()
---- lsp sources
-- [lsp] rust-analyzer
lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importMergeBehavior = "last",
                importPrefix = "by_self"
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            }
        }
    }
})
-- [lsp] typescript
lspconfig.tsserver.setup({
  capabilities = capabilities,
  flags = {debounce_text_changes = 400}
})
-- [lsp] gopls
lspconfig.gopls.setup({
  capabilities = capabilities,
})
-- [lsp] sumneko lua
lspconfig.sumneko_lua.setup({
  cmd = {
    "/usr/bin/lua-language-server",
    "-E",
    "/main.lua",
  },
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
      diagnostics = {
        enable = true,
        globals = {
          "vim", "describe", "it", "before_each", "after_each",
          "awesome", "theme", "client", "P",
        },
      },
      workspace = {
        preloadFileSize = 400,
      },
    },
  },
})
-- treesitter config
local ts = require 'nvim-treesitter.configs'
ts.setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true
  }
}
---- telescope config
--- setup telescope
require('telescope').setup {
    defaults = {
        vimgrep_arguments = {'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
        prompt_prefix = ">",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        file_sorter = require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
        winblend = 0,
        layout_config = {
          prompt_position = "bottom",
          preview_cutoff = 120,
          width = 0.75,
        },
        border = {},
        borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons = true,
        use_less = true,
        set_env = {
            ['COLORTERM'] = 'truecolor'
        },
   }
}
