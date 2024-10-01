local M = {}

M.disabled = {
  n = {
    ["C-n"] = "",
    ["<leader>e"] = "",
    ["<A-i>"] = "",
    ["<leader>h"] = "",
    ["<leader>lf"] = "",
    ["<leader>ls"] = "",
    ["<A-h>"] ="",
    ["<A-v>"] ="",
  },
}

M.general = {
  n = {
    ["<leader>nh"] = { ":nohl<CR>", "clear search highlights" },
    ["x"] = { '"_x', "delete single characer without copying into register" },
  },
  i = {
    ["jk"] = { "<ESC>", "escap insert mode", opts = { nowait = true } },
  },
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { ":NvimTreeToggle<CR>", " toggle file explorer" },
  },
}

M.windowManage = {
  n = {
    ["<leader>sv"] = { "<C-w>v", "split window vertically" },
    ["<leader>sh"] = { "<C-w>s", "split window horizontally" },
    ["<leader>se"] = { "<C-w>=", "make split windows equal width & height" },
    ["<leader>sx"] = { ":close<CR>", "close Current split window" },
    ["<leader>sm"] = { ":MaximizerToggle<CR>", "toggle split window maximzation" },
    ["<left>"] = { "<C-w>h", "Go to left window" },
    ["<right>"] = { "<C-w>l", "Go to left window" },
    ["<Up>"] = { "<C-w>k", "Go to left window" },
    ["<Down>"] = { "<C-w>j", "Go to left window" },
  },
}

M.nvterm = {
  t = {
    ["<C-/>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
  },
  n = {
    ["<C-/>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
  },
}

M.tab = {
  n = {
    ["<leader>to"] = { ":tabnew<CR>", "Open a new tab" },
    ["<leader>tx"] = { ":tabclose<CR>", "Close a current tab" },
    ["<leader>h"] = { ":tabn<CR>", "move to next tab" },
    ["<leader>l"] = { ":tabp<CR>", "move to prev tab" },
  },
}

M.dap = {
  plugin = true,
  n ={
    ["<leader>dc"] = { ":lua require'dap'.continue()<CR>", "Continue" },
    ["<leader>ds"] = { ":lua require'dap'.step_over()<CR>", "Step over" },
    ["<leader>di"] = { ":lua require'dap'.step_into()<CR>", "Step into" },
    ["<leader>do"] = { ":lua require'dap'.step_out()<CR>", "Step out" },
    ["<leader>db"] = { ":lua require'dap'.toggle_breakpoint()<CR>", "Toggle breakpoint" },
    ["<leader>dB"] = { ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", "Set breakpoint with condition" },
    ["<leader>dr"] = { ":lua require'dap'.repl.open()<CR>", "Open REPL" },
    ["<leader>dl"] = { ":lua require'dap'.run_last()<CR>", "Run last" },
  }

}

return M
