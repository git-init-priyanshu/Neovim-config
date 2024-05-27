-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "monekai",
  changed_themes = {
    monekai = {
      base_16 = {
        base08 = "#ffffff",
        base0A = "#a6e22d",
        base0B = "#d6bc63",
        base0C = "#f92672"
      },
    }
  }
}

M.plugins = "plugins.custom"

return M
