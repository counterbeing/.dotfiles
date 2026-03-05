return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()

      -- Install parsers
      local parsers = {
        "bash", "css", "go", "html", "javascript", "json",
        "lua", "markdown", "python", "ruby", "rust",
        "tsx", "typescript", "vim", "vimdoc", "yaml",
      }
      vim.api.nvim_create_autocmd("VimEnter", {
        once = true,
        callback = function()
          local installed = require("nvim-treesitter.install").installed()
          for _, lang in ipairs(parsers) do
            if not vim.tbl_contains(installed, lang) then
              vim.cmd("TSInstall " .. lang)
            end
          end
        end,
      })

      -- Enable treesitter-based highlighting and indentation
      vim.treesitter.start = vim.treesitter.start or function() end
    end,
  },
}
