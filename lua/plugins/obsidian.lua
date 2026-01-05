return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        { name = "personal", path = "~/obsidian/obsidian-home" },
        { name = "work", path = "~/obsidian/obsidian-meta" },
      },
    },
  },
}
