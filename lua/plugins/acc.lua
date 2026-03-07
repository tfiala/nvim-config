local ACC_ROOT = vim.fn.expand("~/src/acc/acc-3")
return {
  {
    dir = ACC_ROOT .. "/editors/nvim",
    main = "acc",
    ft = "acc",
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
