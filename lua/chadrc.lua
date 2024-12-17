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
        base02 = "#5b5c55", -- ( grey ) highlight
        base08 = "#ffffff", -- ( white ) text
        base0A = "#a6e22d", -- ( green ) text
        base0B = "#d6bc63", -- ( yellow ) text
        base0C = "#f92672", -- ( red ) text
        base0F = "#ffffff" -- ( white ) commas
      },
      base_30 = {
      	grey = "#808080", -- ( grey ) line number
      	grey_fg = "#a1a1a1" -- ( grey ) comments
      }
    }
  }

}

return M

