local function aplicar_transparencia()
  local grupos = {
    "Normal",
    "NormalNC",    -- Ventanas que no están enfocadas
    "LineNr",      -- Números de línea
    "Folded",      -- Código colapsado
    "NonText",     -- Caracteres invisibles (como el final del archivo)
    "SpecialKey",
    "VertSplit",   -- Separadores verticales de ventanas
    "SignColumn",  -- El margen izquierdo (donde gitsigns dibuja las líneas)
  }
  for _, grupo in ipairs(grupos) do
    vim.api.nvim_set_hl(0, grupo, { bg = "none", ctermbg = "none" })
  end
end

-- El evento por si cambias de tema en caliente
--vim.api.nvim_create_autocmd("ColorScheme", {
--  pattern = "*",
--  callback = aplicar_transparencia,
--})
--
-- Ejecutar al cargar el archivo
aplicar_transparencia()

-- the theme is applied in the lazy configuration lua/plugins/theme.lua
--vim.cmd[[colorscheme tokyonight-storm]]
--vim.cmd[[colorscheme zellner]]
vim.cmd[[colorscheme hex_steel]]
