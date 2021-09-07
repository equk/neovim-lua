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
cmp.setup {
  enabled = true,
  min_length = 2,
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'luasnip' },
    { name = 'nvim_lua' },
    { name = 'path' },
  },
}
---- completion config
---- use rust-analyzer as lsp source
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
---- use typescript as lsp source
lspconfig.tsserver.setup({
  capabilities = capabilities,
  flags = {debounce_text_changes = 400}
})
---- use gopls as lsp source
lspconfig.gopls.setup({
  capabilities = capabilities,
})
---- use sumneko lua lsp
lspconfig.sumneko_lua.setup({
  cmd = {
    "/usr/bin/lua-language-server",
    "-E",
    "/main.lua",
  },
  -- capabilities = capabilities,
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
---- ***disabled for now***
-- local ts = require 'nvim-treesitter.configs'
-- ts.setup {
--     ensure_installed = 'maintained',
--     highlight = {
--         enable = true
--     }
-- }
-- telescope config
---- use vim buffers for previews
file_previewer = require'telescope.previewers'.vim_buffer_cat.new
grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new
qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new
---- setup telescope
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
        }, -- def = nil,

        file_previewer = file_previewer,
        grep_previewer = grep_previewer,
        qflist_previewer = qflist_previewer,

        -- dev config
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
    }
}
