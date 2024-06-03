return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "rust", "lua", "typescript", "javascript", "html", "go" },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    additional_vim_regex_highlighting = false,
  }
}
