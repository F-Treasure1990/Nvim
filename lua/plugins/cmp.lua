return {
	"hrsh7th/nvim-cmp",
	event = { "BufReadPre", "BufNewFile" },
	--event = "InsertEnter",
	dependencies = {
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim builtin LSP client
		"hrsh7th/cmp-path", -- nvim-cmp source for path
		"hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
		"hrsh7th/cmp-nvim-lua", -- nvim-cmp source for nvim lua
		--	"hrsh7th/cmp-nvim-lsp-signature-help", -- signature help
		{
			"L3MON4D3/LuaSnip",
			-- event = "VeryLazy",
			lazy = true,
			build = "make install_jsregexp",
			dependencies = {
				"rafamadriz/friendly-snippets",
			},
			keys = {
				{
					"<tab>",
					'<cmd>:lua require("luasnip").jump(1)<CR>',
					mode = { "s" },
					desc = "LuaSnip Next Jump",
				},
				{
					"<s-tab>",
					'<cmd>:lua require("luasnip").jump(-1)<CR>',
					mode = { "s" },
					desc = "LuaSnip Prev Jump",
				},
			},
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load({
					paths = "~/.config/nvim/lua/snippets",
				})
				require("luasnip.loaders.from_vscode").lazy_load() -- friendly snippets loader
				require("luasnip").filetype_extend("javascript", { "jsdoc", "html" })
				require("luasnip").filetype_extend("typescript", { "tsdoc", "html" })
				require("luasnip").filetype_extend("typescriptreact", { "tsdoc", "html" })
				require("luasnip").filetype_extend("jsx", { "html" })
			end,
		},
	},
	config = function()
		local cmp = require("cmp")
		local utils = require("core.utils")
		local luasnip = require("luasnip")

		cmp.setup({
			formatting = {
				format = utils.cmp_formt,
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			preselect = cmp.PreselectMode.None,
			window = {
				-- completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
				documentation = {
					--border = { "╭", "─", "╮", " ", "╯", "─", "╰", " " },
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					winhighlight = "Normal:CmpMenu,FloatBorder:CmpMenuBorder,CursorLine:CmpMenuSelect,Search:None",
				},
				completion = {
					--border = { " ", "─", " ", " ", " ", "─", " ", " " },
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					winhighlight = "Normal:CmpMenu,FloatBorder:CmpMenuBorder,CursorLine:CmpMenuSelect,Search:None",
				},
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.scroll_docs(-4),
				["<C-j>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif utils.has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i" }),
			}),
			sources = cmp.config.sources({
				{
					{ name = "path" },
					trigger_characters = { "/", "./", "../", "~" },
				},
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "saadparwaiz1/cmp_luasnip" },
				{ name = "nvim_lua" },
				{ name = "nvim_lsp_signature_help" },
				{
					name = "buffer",
					option = {
						get_bufnrs = function()
							return vim.api.nvim_list_bufs()
						end,
					},
				},
			}),
		})
	end,
}
