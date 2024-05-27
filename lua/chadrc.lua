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
        base0B = "#d6bc63"
      },
    }
  }
}

M.plugins = "plugins.custom"

return M
