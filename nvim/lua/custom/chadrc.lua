local M = {}

M.ui = { theme = "nightowl" }
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

-- set fold
local opt = vim.opt
local api = vim.api

-- use nvim.ufo
-- opt.foldmethod = "syntax"
opt.relativenumber = true -- show relative line numbers
-- -- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldlevel = 99
function M.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command("augroup " .. group_name)
    api.nvim_command "autocmd!"
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten { "autocmd", def }, " ")
      api.nvim_command(command)
    end
    api.nvim_command "augroup END"
  end
end

local autoCommands = {
  -- other autocommands
  open_folds = {
    { "BufReadPost,FileReadPost", "*", "normal zR" },
  },
}

M.nvim_create_augroups(autoCommands)

M.nvterm = {
  terminals = {
    shell = vim.o.shell,
    list = {},
    type_opts = {
      float = {
        relative = "editor",
        row = 0.2,
        col = 0.15,
        width = 0.7,
        height = 0.5,
        border = "single",
      },
      horizontal = { location = "rightbelow", split_ratio = 0.3 },
      vertical = { location = "rightbelow", split_ratio = 0.5 },
    },
  },
  behavior = {
    autoclose_on_quit = {
      enabled = false,
      confirm = true,
    },
    close_on_exit = true,
    auto_insert = true,
  },
}

return M
