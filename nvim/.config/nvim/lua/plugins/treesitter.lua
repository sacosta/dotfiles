return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({
      ensure_installed = { "rust", "lua", "luadoc", "markdown", "vim", "vimdoc", "typescript", "javascript", "html",
        "go" },
      with_sync = true,
      sync_install = false,
      auto_install = true,
      highlight = { enable = false },
      indent = { enable = false },
      additional_vim_regex_highlighting = false,
    })()
  end
}
