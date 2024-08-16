return {
    
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
        end,
    },
    -- Auto rename tags
  {
    "windwp/nvim-ts-autotag",
    config = function()
        require('nvim-treesitter.configs').setup {
            autotag = {
                enable = true,
                filetypes = { "html", "xml", "javascriptreact", "typescriptreact" },
            },
        }
    end,
  },

    -- React snippets
    {
        "rafamadriz/friendly-snippets",
        event = "InsertEnter",
    },

{
    "hrsh7th/nvim-cmp",
    config = function()
        local cmp = require "cmp"
        local luasnip = require "luasnip"
        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = {
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<CR>"] = cmp.mapping.confirm { select = true },
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            },
        }
    end,
},
    { "saadparwaiz1/cmp_luasnip" },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },



   {
   	"nvim-treesitter/nvim-treesitter",
   	opts = {
   		ensure_installed = {
   			"vim", "lua", "vimdoc",
        "html", "css", "tsx", "javascript", "typescript", "json", "bash"
   		},
   	},
   },
}
