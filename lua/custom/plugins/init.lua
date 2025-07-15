-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    {
        "ray-x/go.nvim",
        dependencies = {             -- optional packages
            'mfussenegger/nvim-dap', -- Debug Adapter Protocol
            'rcarriga/nvim-dap-ui',
            'nvim-neotest/nvim-nio',
            'theHamsta/nvim-dap-virtual-text',
            'ray-x/guihua.lua',
        },
        opts = {
            -- lsp_keymaps = false,
            -- other options
        },
        config = function(lp, opts)
            require("go").setup(opts)
            local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.go",
                callback = function()
                    require('go.format').goimports()
                end,
                group = format_sync_grp,
            })
        end,
        event = { "CmdlineEnter" },
        ft = { 'go', 'gomod', 'gosum', 'gotmpl', 'gohtmltmpl', 'gotexttmpl' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "buffers", -- Change this from "tabs" to "buffers"
                    separator_style = "slant",
                    always_show_bufferline = true,
                }
            })
        end,
    }
}
