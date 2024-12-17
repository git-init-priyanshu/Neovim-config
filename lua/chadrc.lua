-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "monekai",

	-- hl_override = {
	--	Comment = { italic = true },
	--	["@comment"] = { italic = true },
	-- },
  
  changed_themes = {
    monekai = {
      base_16 = { 
        base08 = "#ffffff", -- ( white )
        base0A = "#a6e22d", -- ( green )
        base0B = "#d6bc63", -- ( yellow )
        base0C = "#f92672", -- ( red )
      } 
    }
  }
}

return M

