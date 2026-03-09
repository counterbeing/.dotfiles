return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()

      local parsers = {
        "bash", "css", "go", "html", "javascript", "json",
        "lua", "markdown", "python", "ruby", "rust",
        "tsx", "typescript", "vim", "vimdoc", "yaml",
      }

      -- Install missing parsers on first launch
      vim.api.nvim_create_autocmd("VimEnter", {
        once = true,
        callback = function()
          local dominated = vim.api.nvim_get_runtime_file("parser/*.so", true)
          local installed = {}
          for _, path in ipairs(dominated) do
            local name = vim.fn.fnamemodify(path, ":t:r")
            installed[name] = true
          end
          local missing = {}
          for _, lang in ipairs(parsers) do
            if not installed[lang] then
              table.insert(missing, lang)
            end
          end
          if #missing > 0 then
            vim.cmd("TSInstall! " .. table.concat(missing, " "))
          end
        end,
      })
    end,
  },
}
