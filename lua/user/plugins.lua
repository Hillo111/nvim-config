local fn = vim.fn

-- Automcatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerInstall
--   augroup end
-- ]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})



return packer.startup(function(use)
	use 'wbthomason/packer.nvim' -- Have packer manage itself
	use 'jiangmiao/auto-pairs'
	use 'scrooloose/nerdcommenter'
	use 'stevearc/conform.nvim'
	use 'scrooloose/nerdtree'
	use 'neomake/neomake'
	use 'machakann/vim-highlightedyank'

	use 'morhetz/gruvbox'
    use 'folke/tokyonight.nvim'
	use 'rebelot/kanagawa.nvim'
	use 'Mofiqul/vscode.nvim'

	use 'dunstontc/vim-vscode-theme'

	use 'myusuf3/numbers.vim'
	use 'prabirshrestha/vim-lsp'
	use {
	    'numToStr/Comment.nvim',
	    config = function()
		require('Comment').setup()
	    end
	}
    use 'neovim/nvim-lspconfig'
    use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep'} }}
	use 'nvim-lua/plenary.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'sharkdp/fd'
    use 'folke/trouble.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'sheerun/vim-polyglot'
	use 'nvim-tree/nvim-web-devicons'
	use 'tpope/vim-surround'

	use 'edluffy/hologram.nvim'

	-- use {'tpope/vim-eunuch', config = function ()
	-- 	vim.cmd('cnoreabbrev rename Rename')
	-- end}

	use {
	  'rmagatti/auto-session',
	  config = function()
		require("auto-session").setup {
		  log_level = "error",
		  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
	}
	  end
	}
	use({
		"Pocco81/auto-save.nvim",
	})

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'


	use {
		"ThePrimeagen/refactoring.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter"
		}
	}
	use "sindrets/diffview.nvim" 
	use "folke/todo-comments.nvim"
	use "stevearc/oil.nvim"
	use { "David-Kunz/gen.nvim" }
	use { "folke/noice.nvim", requires = {"MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",}}
	use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
	use({
		'mvllow/modes.nvim',
		tag = 'v0.2.0',
		config = function()
			require('modes').setup()
		end
	})
	use {'j-hui/fidget.nvim',
	config = function()
		require('fidget').setup()
	end}
	use "folke/lazydev.nvim"
	use {
		"m4xshen/hardtime.nvim",
	   requires = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	}
	use {
		'willothy/flatten.nvim'
	}
	use 'f-person/git-blame.nvim'

	use {
    "SmiteshP/nvim-navbuddy",
		requires = {
			"neovim/nvim-lspconfig",
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
			"numToStr/Comment.nvim",        -- Optional
			"nvim-telescope/telescope.nvim" -- Optional
		}
	}

	use 'yamatsum/nvim-cursorline'
	use {
		'rafcamlet/tabline-framework.nvim'
	}
	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use "gennaro-tedesco/nvim-jqx"
	use 'tamton-aquib/keys.nvim'

	-- use {
	-- 	'romgrk/barbar.nvim',
	-- 	requires = {
	-- 		'nvim-tree/nvim-web-devicons',
	-- 		'lewis6991/gitsigns.nvim'
	-- 	}
	-- }
	use 'nvim-tree/nvim-tree.lua'
	use 'emmanueltouzery/decisive.nvim'
	use 'mfussenegger/nvim-dap'
	use 'ziontee113/color-picker.nvim'
	use 'NvChad/nvim-colorizer.lua'

	use 'mikavilpas/yazi.nvim'
	-- use {
	--   "zbirenbaum/copilot.lua",
	--   cmd = "Copilot",
	--   event = "InsertEnter",
	--   config = function()
	-- 	require("copilot").setup({})
	--   end,
	-- }

	-- Automcatically set up your config after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end

end)
