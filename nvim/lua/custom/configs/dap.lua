local dap = require "dap"

dap.adapters.node2 = {
  type = "server",
  host = "127.0.0.1",
  port = 9527,
  executable = {
    command = "js-debug-adapter",
  },
}
for _, lang in ipairs { "javascript", "javascriptreact", "typescript", "typescriptreact" } do
  dap.configurations[lang] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      runtimeExecutable = "node",
    },
  }
end
