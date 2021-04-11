-- plugin specific config
---- (plugin keybinds in ./keybindings.lua)
--
-- set lightline
vim.g.lightline = {
    colorscheme = 'powerline',
    active = {
        left = {{'mode', 'paste'}, {'gitbranch', 'readonly', 'filename', 'modified'}}
    },
    component_function = {
        gitbranch = 'gitbranch#name'
    }
}
-- lsp config
local function setup_diagnostics()
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = true,
        signs = true,
        update_in_insert = true
    })
end
-- load lspconfig
local lspconfig = require 'lspconfig'
-- load completion
local completion = require 'completion'
local on_attach = function(client)
    require'completion'.on_attach(client)
end
-- completion config
vim.g.completion_matching_strategy_list = {'substring', 'exact', 'fuzzy', 'all'}
vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_insert_delay = 1
vim.g.completion_chain_complete_list = {{
    complete_items = {'lsp', 'snippet'}
}, {
    mode = '<c-p>'
}, {
    mode = '<c-n>'
}}
---- include ultisnips in completion
vim.g.completion_enable_snippet = 'UltiSnips'
---- use rust-analyzer as lsp source
lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
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
        vimgrep_arguments = {'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column',
                             '--smart-case'},
        prompt_position = "bottom",
        prompt_prefix = ">",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_defaults = {},
        file_sorter = require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
        shorten_path = true,
        winblend = 0,
        width = 0.75,
        preview_cutoff = 120,
        results_height = 1,
        results_width = 0.8,
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