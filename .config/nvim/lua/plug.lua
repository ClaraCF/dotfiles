-- -- Plug-ins --
-- return require('packer').startup(function()
--     -- Package Manager --
--     use 'wbthomason/packer.nvim'	-- Packer
--
--     -- Discord Rich Presence --
--     use 'andweeb/presence.nvim'
--
--     -- Git Signs --
--     use 'lewis6991/gitsigns.nvim'
--
--     -- Mason LSP server, debugger and linter Manager --
--     use 'williamboman/mason.nvim'
--     use 'williamboman/mason-lspconfig.nvim'
--
--     -- Neovim LSP --
--     use 'neovim/nvim-lspconfig'
--
--     -- Completion framework --
--     use 'hrsh7th/nvim-cmp' 
--
--     -- LSP completion source --
--     use 'hrsh7th/cmp-nvim-lsp'
--
--     -- Useful completion sources --
--     use 'hrsh7th/cmp-nvim-lua'
--     use 'hrsh7th/cmp-nvim-lsp-signature-help'
--     use 'hrsh7th/cmp-vsnip'                             
--     use 'hrsh7th/cmp-path'                              
--     use 'hrsh7th/cmp-buffer'                            
--     use 'hrsh7th/vim-vsnip'
--
--     -- Icons --
--     use 'nvim-tree/nvim-web-devicons'
--
--     -- Color Theme --
--     use { "catppuccin/nvim", as = "catppuccin" }
--     use 'navarasu/onedark.nvim'
--     use 'tanvirtin/monokai.nvim'
--
--     -- Vim airline --
--     use 'vim-airline/vim-airline'
--     use 'vim-airline/vim-airline-themes'
--
--     -- Tree Sitter --
--     --use 'nvim-treesitter/nvim-treesitter'
--
--     -- Other --
--     use 'voldikss/vim-floaterm'
--     use 'RRethy/vim-illuminate'
--     use 'folke/trouble.nvim'
--     use 'numToStr/Comment.nvim'
--     use 'windwp/nvim-autopairs'
--     use 'nvim-tree/nvim-tree.lua'
--
--     use {
--         'vimwiki/vimwiki',
--         config = function()
--             vim.g.vimwiki_list = {{
--                 path = '~/Documents/Vimwiki',
--                 template_path = '~/Documents/Vimwiki/Templates',
--                 template_default = 'default',
--                 syntax = 'markdown',
--                 ext = '.md',
--                 path_html = '~/Documents/Vimwiki/HTML',
--                 custom_wiki2html = 'vimwiki_markdown',
--                 html_filename_parameterization = 1,
--                 template_ext = '.tpl',
--             }}
--             vim.g.vimwiki_global_ext = 0
--         end
--     }
--     use 'aspeddro/pandoc.nvim'
--
--     -- Languages --
--     --> Rust
--     use 'simrat39/rust-tools.nvim'
--
-- end)
--
