-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- tfiala override localleader (defaults to "\", I want ",")
vim.g.maplocalleader = ","

-- Follow the macOS system appearance (term-theme day/night). Nvim's own
-- OSC 11 background probe is async and can lose the race against the
-- colorscheme load, so resolve the mode explicitly before plugins set up;
-- tokyonight then picks its day style when 'background' is light.
if vim.fn.has("mac") == 1 then
  vim.fn.system({ "defaults", "read", "-g", "AppleInterfaceStyle" })
  vim.o.background = vim.v.shell_error == 0 and "dark" or "light"
end
