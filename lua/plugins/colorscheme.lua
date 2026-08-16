return {
  {
    "folke/tokyonight.nvim",
    opts = function(_, opts)
      -- Follow day/night: config.options resolves 'background' from the
      -- macOS appearance before plugins load. The style must be picked
      -- here too — on first load tokyonight forces 'background' to the
      -- configured style's own bg, so a dark style would override light.
      opts.style = vim.o.background == "light" and "day" or "moon"
      opts.transparent = true
      opts.styles = {
        sidebars = "transparent",
        floats = "transparent",
      }
    end,
  },
}
