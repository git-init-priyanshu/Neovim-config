require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!

vim.g.lazyvim_prettier_needs_config = false
vim.opt.clipboard = ""

local function apply_comment_italic()
  local groups = vim.fn.getcompletion("", "highlight")

  for _, group in ipairs(groups) do
    if group:lower():find("comment") then
      local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
      if ok then
        hl.italic = true
        if type(hl.cterm) == "table" then
          hl.cterm.italic = true
        else
          hl.cterm = { italic = true }
        end
        vim.api.nvim_set_hl(0, group, hl)
      end
    end
  end
end

local comment_italic_group = vim.api.nvim_create_augroup("comment_italic", { clear = true })

vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
  group = comment_italic_group,
  callback = function()
    vim.schedule(apply_comment_italic)
  end,
})

vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "LspAttach" }, {
  group = comment_italic_group,
  callback = function()
    vim.schedule(apply_comment_italic)
  end,
})

vim.api.nvim_create_autocmd("User", {
  group = comment_italic_group,
  pattern = "VeryLazy",
  callback = function()
    vim.schedule(apply_comment_italic)
  end,
})

vim.schedule(apply_comment_italic)
