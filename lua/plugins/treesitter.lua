return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		auto_install = true,
		highlight = {
			enable = true,
			-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
			--  If you are experiencing weird indenting issues, add the language to
			--  the list of additional_vim_regex_highlighting and disabled languages for indent.
			additional_vim_regex_highlighting = { "ruby" },
		},
		ensure_installed = {
			"astro",
			"html",
			"bash",
			"css",
			"lua",
			"json",
			"dockerfile",
			"javascript",
			"typescript",
			"markdown",
			"markdown_inline",
			"gitignore",
			"jsdoc",
			"tsx",
			"vim",
			"vimdoc",
		},
		indent = { enable = true, disable = { "ruby" } },
		autopairs = { enable = true },
		autotag = {
			enable = true,
			enable_rename = true,
			enable_close = true,
			enable_close_on_slash = true,
		},
	},
	config = function(_, opts)
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup(opts)

		-- There are additional nvim-treesitter modules that you can use to interact
		-- with nvim-treesitter. You should go explore a few and see what interests you:
		--
		--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
		--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
		--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	end,
}
