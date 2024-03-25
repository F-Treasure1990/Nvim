-- ==========================================================================
-- Colourscheme
-- ==========================================================================
vim.cmd.colorscheme("habamax")

local hl = vim.api.nvim_set_hl
--@param link string
local function ghl(link)
	local link_opts = vim.api.nvim_get_hl(0, { name = link, link = false })
	return link_opts
end

local tw_neutral = {
	-- neutral
	"#fafafa", -- [1] 50
	"#f5f5f5", -- [2] 100
	"#e5e5e5", -- [3] 200
	"#d4d4d4", -- [4] 300
	"#a3a3a3", -- [5] 400
	"#737373", -- [6] 500
	"#525252", -- [7] 600
	"#404040", -- [8] 700
	"#262626", -- [9] 800
	"#171717", -- [10] 900
	"#0a0a0a", -- [11] 950
	"#e09f3e", -- [12] accent
}

local tw_zinc = {
	"#fafafa", -- [1] 50
	"#f4f4f5", -- [2] 100
	"#e4e4e7", -- [3] 200
	"#d4d4d4", -- [4] 300
	"#a1a1aa", -- [5] 400
	"#71717a", -- [6] 500
	"#52525b", -- [7] 600
	"#3f3f46", -- [8] 700
	"#27272a", -- [9] 800
	"#18181b", -- [10] 900
	"#09090b", -- [11] 950
	"#FFA057", -- [12] accent
	"NONE",
	"#6d8a96",
}
local c = tw_zinc

hl(0, "FloatBorder", { bg = c[9], fg = c[9] }) -- border of floating windows, like oil

hl(0, "Constant", { bg = c[13], fg = c[12] }) -- highlights cmp menu and text
hl(0, "Normal", { bg = c[10], fg = c[3] }) -- highlights cmp menu and text
hl(0, "Comment", { bg = c[13], fg = c[7], italic = true }) -- highlights cmp menu and text

-- CMP
hl(0, "CmpMenu", { bg = c[10], fg = c[6] }) -- highlights cmp menu and text
hl(0, "CmpMenuBorder", { bg = c[10], fg = c[8] }) -- highlights cmp menu border
hl(0, "CmpMenuSelect", { fg = ghl("Constant").fg, bg = c[9] }) -- hls the tab select colors
hl(0, "CmpItemAbbrMatch", { fg = ghl("Constant").fg, bg = c[13] }) -- hls the type matches
hl(0, "CmpItemKind", { fg = c[7], bg = c[13] }) -- hls the type matches

-- Telescope
hl(0, "TelescopeNormal", { fg = c[5], bg = c[10] }) -- hls for the inner backgrounds
hl(0, "TelescopeBorder", { fg = c[8], bg = c[10] }) -- global borders
hl(0, "TelescopeTitle", { fg = ghl("Constant").fg, bg = c[13] }) -- all title colours

hl(0, "TelescopeMatching", { fg = c[12] }) -- matching characters
hl(0, "TelescopeMultiSelection", { fg = c[6] }) -- hl for selected item
hl(0, "TelescopeMultiIcon", { fg = ghl("Comment").fg }) -- hl for selectied icon
hl(0, "TelescopeSelection", { fg = c[3], bg = c[9] }) -- hls the tab select colors

hl(0, "TelescopePromptNormal", { bg = c[10], fg = c[4] }) -- prompt text and background inner
hl(0, "TelescopePromptPrefix", { fg = ghl("Constant").fg })
hl(0, "TelescopePromptBorder", { fg = c[8], bg = c[10] }) -- global borders
hl(0, "TelescopePreviewLine", { fg = c[4], bg = c[9] })

-- Diagnsotics
hl(0, "DiagnosticError", { fg = "#f87171" })
hl(0, "DiagnosticSignError", { bg = c[13], fg = "#f87171" })
hl(0, "DiagnosticSignWarn", { bg = c[13], fg = "#fdba74" })
hl(0, "DiagnosticWarn", { bg = c[13], fg = "#fdba74" })
hl(0, "DiagnosticSignInfo", { bg = c[13], fg = "#7dd3fc" })
hl(0, "DiagnosticInfo", { bg = c[13], fg = "#7dd3fc" })
hl(0, "DiagnosticSignHint", { bg = c[13], fg = "#34d399" })
hl(0, "DiagnosticHint", { bg = c[13], fg = "#34d399" })

hl(0, "DiagnosticUnderlineHint", { undercurl = true })
hl(0, "DiagnosticUnderlineWarn", { undercurl = true })
hl(0, "DiagnosticUnderlineError", { undercurl = true })
hl(0, "DiagnosticUnnecessary", { italic = true, fg = c[6] })

--Oil
hl(0, "OilDir", { bg = c[13], fg = c[14], bold = true })
hl(0, "OilFile", { bg = c[13], fg = c[4] })

-- Which key

hl(0, "WhichKeyBorder", { bg = c[10], fg = c[8] })
hl(0, "WhichKeyFloat", { bg = c[10] })

-- Tabline
hl(0, "TablineFill", { link = "Comment" })
hl(0, "StatusLine", { link = "Comment" })
hl(0, "StatusLineNC", { link = "Comment" })
hl(0, "@lsp.type.function.lua", { link = "Special" })
