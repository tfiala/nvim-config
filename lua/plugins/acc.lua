local ACC_ROOT = vim.fn.expand("~/src/acc/acc-3")
local ACC_PLUGIN_DIR = ACC_ROOT .. "/editors/nvim"

return {
  {
    dir = ACC_PLUGIN_DIR,
    main = "acc",
    ft = "acc",
    -- Only load when the local ACC checkout is present on this machine.
    enabled = vim.fn.isdirectory(ACC_PLUGIN_DIR) == 1,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "neovim/nvim-lspconfig",
    },
    opts = {
      treesitter_dir = ACC_ROOT .. "/editors/tree-sitter-acc",
      lsp_cmd = { ACC_ROOT .. "/acc-lsp" },
    },
  },
}
