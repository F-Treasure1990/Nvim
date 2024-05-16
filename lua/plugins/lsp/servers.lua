local lsp_servers = {
	jsonls = {
		settings = {
			json = {
				--https://github.com/SchemaStore/schemastore/blob/master/src/api/json/catalog.json
				schemas = require("schemastore").json.schemas({
					select = {
						".eslintrc",
						"package.json",
						"prettierrc.json",
						"GitHub Workflow Template Properties",
					},
				}),
				validate = { enable = true },
			},
		},
	},
	yamlls = {
		settings = {
			yaml = {
				schemaStore = {
					enable = false,
					url = "",
				},
			},
			schemas = require("schemastore").json.schemas({
				select = {
					"docker-compose.yml",
					"GitHub Workflow",
				},
			}),
			cmd = { "yaml-language-server", "--stdio" },
		},
		filetypes = { "yaml" },
	},
	lua_ls = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = { "vim" },
					disable = {
						"missing-fields",
						"incomplete-signature-doc",
					},
				},
			},
			workspace = {
				-- make language server aware of runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			format = {
				enable = false,
			},
		},
	},
	eslint = {
		settings = {
			run = "onType", -- or "onSave"
			workingDirectory = { mode = "auto" },
		},
		handlers = {},
	},
	tsserver = {
		settings = {
			typescript = {
				inlayHints = {
					includeInlayParameterNameHints = "literal",
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = false,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			},
			javascript = {
				inlayHints = {
					includeInlayEnumMemberValueHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayVariableTypeHints = true,
				},
			},
		},
	},
	tailwindcss = {},
	vimls = {},
	html = {},
	astro = {},
	marksman = {},
	-- csharp_ls = {},
	emmet_ls = {
		filetypes = { "astro", "html", "pug", "svelte", "vue", "typescriptreact" },
		ignore_filetypes = {
			"scss",
			"css",
			"sass",
		},
	},
	cssls = {},
	dockerls = {},
	docker_compose_language_service = {},
}

local linter_formatters = {
	"stylua",
	"prettierd",
	"markdownlint",
	"yamlfmt",
}

return {
	lsp_servers = lsp_servers,
	ensure_installed = vim.list_extend(vim.tbl_keys(lsp_servers), linter_formatters),
}
