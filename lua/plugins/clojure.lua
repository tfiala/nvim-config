-- ------------------------------------------
-- Clojure Development support - LazyVim compatible
--
-- Extends the LazyVim clojure extra with:
-- - ts-comments.nvim with `;;` and `;` support
-- - structured editing with parinfer and treesitter-sexp plugins
-- - REPL connected editor with Conjure plugin (log HUD hidden by default)
-- ------------------------------------------

-- Local variables
local lisp_dialects = { "clojure", "fennel" }

---@type LazySpec
return {
  -- Structural Editing with Parinfer
  {
    "gpanders/nvim-parinfer",
    ft = lisp_dialects,
    init = function()
      vim.g.parinfer_force_balance = true
      vim.g.parinfer_comment_chars = { ";", ";;" }
      vim.g.parinfer_mode = "smart"
    end,
    keys = {
      { "<Leader>TP", "<cmd>ParinferOn!<cr>", desc = "Toggle Parinfer" },
    },
  },

  -- Treesitter s-expression support
  {
    "PaterJason/nvim-treesitter-sexp",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "clojure", "fennel", "janet", "query" },
    cmd = "TSSexp",
    opts = {},
  },

  -- Add .bb files as clojure filetype
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.filetype.add({
        extension = { bb = "clojure" },
      })
      return opts
    end,
  },

  -- REPL workflow with Conjure
  {
    "Olical/conjure",
    ft = lisp_dialects,
    init = function()
      -- Width of HUD as percentage of the editor width between 0.0 and 1.0
      vim.g["conjure#log#hud#width"] = 1
      -- Display HUD (REPL log)
      vim.g["conjure#log#hud#enabled"] = false
      -- HUD corner position
      vim.g["conjure#log#hud#anchor"] = "SE"
      -- Open log at bottom or far right of editor
      vim.g["conjure#log#botright"] = true
      -- Lines from top of file to check for `ns` form
      vim.g["conjure#extract#context_header_lines"] = 100
      -- Comment pattern for eval to comment command
      vim.g["conjure#eval#comment_prefix"] = ";; "
      -- Highlight evaluated forms
      vim.g["conjure#highlight#enabled"] = true
      -- Disable auto-repl
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#hidden"] = true
      -- Disable auto require after REPL connection
      vim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
      -- Suppress `; (out)` prefix in log evaluation results
      vim.g["conjure#client#clojure#nrepl#eval#raw_out"] = true
      -- Test runner: "clojure" (clojure.test), "clojurescript" (cljs.test), or "kaocha"
      vim.g["conjure#client#clojure#nrepl#test#runner"] = "clojure"
    end,
  },
}
