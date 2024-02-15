return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        { "lukas-reineke/lsp-format.nvim", config = true },
    },
    config = function()
        local lsp = require("lsp-zero")
        lsp.preset("recommended")

        lsp.on_attach(function(client, bufnr)
            require("lsp-format").on_attach(client, bufnr)
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
                { buffer = bufnr, remap = false, desc = "[g]oto [d]efinition" })
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
                { buffer = bufnr, remap = false, desc = "hover word" })
            vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end,
                { buffer = bufnr, remap = false, desc = "[w]orkspace [s]ymbol" })
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
                { buffer = bufnr, remap = false, desc = "[v]iew [d]iagnostics" })
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end,
                { buffer = bufnr, remap = false, desc = "goto next diagnostic" })
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end,
                { buffer = bufnr, remap = false, desc = "goto previous diagnostic" })
            vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end,
                { buffer = bufnr, remap = false, desc = "[c]ode [a]ction" })
            vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.references() end,
                { buffer = bufnr, remap = false, desc = "[v]iew [r]eferences" })
            vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end,
                { buffer = bufnr, remap = false, desc = "[r]e[n]ame" })
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
                { buffer = bufnr, remap = false, desc = "signature help" })
        end)

        lsp.nvim_workspace()
        lsp.set_preferences({
            sign_icons = {}
        })

        lsp.configure('gdscript', {
            force_setup = true,
            single_file_support = false,
            cmd = vim.lsp.rpc.connect('127.0.0.1', 6005),
            root_dir = require('lspconfig.util').root_pattern('project.godot', '.git'),
            filetypes = {'gd', 'gdscript', 'gdscript3'}
        })

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {'clangd'},
            handlers = {
                lsp.default_setup,
            },
        })
        lsp.setup()
        vim.diagnostic.config { virtual_text = true }

        local cmp = require("cmp")
        local luasnip = require("luasnip")
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expandable() then
                        luasnip.expand()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, {
                    "i",
                    "s",
                }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, {
                    "i",
                    "s",
                }),
            }),
            completion = {
                --completeopt = 'menu,menuone,noselect',
            },
            preselect = cmp.PreselectMode.None,
        })

        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
        })
    end
}
