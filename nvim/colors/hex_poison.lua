-- hex_poison.nvim - Neovim colorscheme ported from Helix editor
-- Author: portalsurfer (original Helix theme)

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.o.termguicolors = true

local palette = {
  t1 = "#121211",
  t2 = "#1e1f1b",
  t3 = "#4c513a",
  t4 = "#5a6052",
  t5 = "#6f6d6f",
  t6 = "#98acaa",
  t7 = "#b1b354",
  t8 = "#7e808a",
  t9 = "#3f4a4e",
  t10 = "#6fa197",
  t11 = "#6fd7a8",

  highlight = "#ff2e5f",
  highlight_two = "#0affa9",
  highlight_three = "#d7ff52",

  black = "#000000",

  selection = "#290019",
  selection_fg = "#c8e732",

  comment = "#396884",
  comment_doc = "#234048",

  error = "#c73500",
  warning = "#dcbb00",
  display = "#57ff89",
  info = "#dad7d5",

  hints = "#313d3c",
  ruler = "#21221e",

  diff_minus = "#ff4000",
  diff_delta = "#16a7c7",
  diff_plus = "#c9d400",
  diff_delta_moved = "#0048bd",
}

local p = palette

local highlights = {
  Normal = { fg = p.t4, bg = p.t2 },

  Comment = { fg = p.comment },
  CommentDoc = { fg = p.comment_doc, bg = p.t4, italic = true },

  Constant = { fg = p.t11 },
  String = { fg = p.t6, italic = true },
  StringRegexp = { fg = p.t6 },
  Character = { fg = p.t11 },
  Number = { fg = p.t11 },
  Boolean = { fg = p.t11 },
  Float = { fg = p.t11 },

  Identifier = { fg = p.t4 },
  Variable = { fg = p.t4 },
  VariableParameter = { fg = p.t6 },
  VariableMember = { fg = p.t3 },
  VariableBuiltin = { fg = p.t7 },
  Label = { fg = p.t4 },

  Statement = { fg = p.t8 },
  Keyword = { fg = p.t6 },
  KeywordFunction = { fg = p.t11 },
  KeywordModifier = { fg = p.t7 },
  KeywordOperator = { fg = p.t8 },
  KeywordImport = { fg = p.t8 },
  KeywordRepeat = { fg = p.t8 },
  KeywordConditional = { fg = p.t8 },
  KeywordException = { fg = p.t8 },
  Operator = { fg = p.t8 },

  Function = { fg = p.t10 },
  FunctionMethod = { fg = p.t7 },
  FunctionMacro = { fg = p.t7 },
  FunctionBuiltin = { fg = p.t10 },

  Type = { fg = p.t8, bold = true },
  TypeBuiltin = { fg = p.t8, bold = true },
  Structure = { fg = p.t8, bold = true },
  StorageClass = { fg = p.t7 },

  PreProc = { fg = p.t7 },
  PreCondit = { fg = p.t7 },
  Include = { fg = p.t8 },
  Define = { fg = p.t7 },

  Special = { fg = p.t7, bold = true },
  SpecialChar = { fg = p.t11 },
  Tag = { fg = p.t4 },
  Delimiter = { fg = p.t9 },

  Underlined = { underline = true },
  Ignore = {},
  Error = { fg = p.error, bold = true },
  Todo = { fg = p.highlight, bold = true },

  Punctuation = { fg = p.t9 },
  PunctuationDelimiter = { fg = p.t9 },
  PunctuationBracket = { fg = p.t9 },
  PunctuationSpecial = { fg = p.t7 },

  Namespace = { fg = p.t6, bold = true },

  DiffAdd = { fg = p.diff_plus },
  DiffChange = { fg = p.diff_delta },
  DiffDelete = { fg = p.diff_minus },
  DiffText = { fg = p.diff_delta_moved },
  diffAdded = { fg = p.diff_plus },
  diffRemoved = { fg = p.diff_minus },
  diffChanged = { fg = p.diff_delta },
  diffOldFile = { fg = p.t6 },
  diffNewFile = { fg = p.t6 },

  ColorColumn = { bg = p.ruler },
  Conceal = { fg = p.t3 },
  Cursor = { fg = p.t1, bg = p.highlight_three },
  CursorIM = { fg = p.t1, bg = p.highlight_three },
  CursorColumn = { bg = p.ruler },
  CursorLine = { bg = p.ruler },
  CursorLineNr = { fg = p.highlight_three, bg = p.t2 },
  Directory = { fg = p.t7 },
  EndOfBuffer = { fg = p.t1 },
  TermCursor = { fg = p.t2, bg = p.highlight },
  TermCursorNC = { fg = p.t2, bg = p.highlight_two },

  ErrorMsg = { fg = p.error, bold = true },
  WarningMsg = { fg = p.warning, bold = true },
  InfoMsg = { fg = p.info, bold = true },
  Question = { fg = p.display, bold = true },
  ModeMsg = { fg = p.t4, bg = p.t1 },

  Folded = { fg = p.t3, bg = p.t1 },
  FoldColumn = { fg = p.t3, bg = p.t2 },
  SignColumn = { bg = p.t2 },
  SignColumnSB = { bg = p.t2 },

  LineNr = { fg = p.t3, bg = p.t2 },
  MatchParen = { fg = p.highlight, bg = p.t1, bold = true },
  NonText = { fg = p.t3 },
  NormalFloat = { fg = p.t4, bg = p.t1 },
  FloatBorder = { fg = p.t4, bg = p.t1 },
  FloatTitle = { fg = p.highlight_three, bg = p.t1, bold = true },

  Pmenu = { fg = p.t4, bg = p.t1 },
  PmenuSel = { fg = p.highlight_three, bg = p.t1 },
  PmenuSbar = { bg = p.t3 },
  PmenuThumb = { bg = p.t4 },

  Search = { fg = p.t2, bg = p.highlight_three },
  IncSearch = { fg = p.t2, bg = p.highlight },
  CurSearch = { fg = p.t2, bg = p.highlight },
  Substitute = { fg = p.t2, bg = p.highlight_two },

  SpecialKey = { fg = p.t3 },
  SpellBad = { sp = p.error, underline = true },
  SpellCap = { sp = p.warning, underline = true },
  SpellLocal = { sp = p.info, underline = true },
  SpellRare = { sp = p.display, underline = true },

  StatusLine = { fg = p.t4, bg = p.t1 },
  StatusLineNC = { fg = p.t4, bg = p.t1 },
  StatusLineTerm = { fg = p.t3, bg = p.t1 },
  StatusLineTermNC = { fg = p.t3, bg = p.t1 },

  TabLine = { fg = p.t3, bg = p.t1 },
  TabLineFill = { bg = p.t1 },
  TabLineSel = { fg = p.t7, bg = p.t2 },

  Title = { fg = p.highlight_three, bold = true },
  Visual = { fg = p.selection_fg, bg = p.selection },
  VisualNOS = { fg = p.selection_fg, bg = p.selection },
  Whitespace = { fg = p.t3 },
  WildMenu = { fg = p.t2, bg = p.highlight_three },

  WinBar = { fg = p.t4, bg = p.t1 },
  WinBarNC = { fg = p.t4, bg = p.t1 },

  WinSeparator = { fg = p.t4 },
  VertSplit = { fg = p.t4 },
  WinBarSeparator = { fg = p.t3 },

  DiagnosticError = { fg = p.error },
  DiagnosticWarn = { fg = p.warning },
  DiagnosticInfo = { fg = p.info },
  DiagnosticHint = { fg = p.display },
  DiagnosticUnderlineError = { sp = p.error, undercurl = true },
  DiagnosticUnderlineWarn = { sp = p.warning, undercurl = true },
  DiagnosticUnderlineInfo = { sp = p.info, undercurl = true },
  DiagnosticUnderlineHint = { sp = p.display, undercurl = true },
  DiagnosticUnnecessary = { fg = p.t3, italic = true },
  DiagnosticDeprecated = { strikethrough = true },

  LspReferenceText = { bg = p.t3 },
  LspReferenceRead = { bg = p.t3 },
  LspReferenceWrite = { bg = p.t3 },
  LspSignatureActiveParameter = { fg = p.highlight_three, bg = p.t1 },
  LspCodeLens = { fg = p.hints },
  LspInlayHint = { fg = p.hints },

  IndentBlanklineChar = { fg = p.t3 },
  IndentBlanklineContextChar = { fg = p.t6 },
  IndentLine = { fg = p.t3 },

  TSStrong = { bold = true },
  TSEmphasis = { italic = true },
  TSUnderline = { underline = true },
  TSStrike = { strikethrough = true },
  TSNote = { fg = p.info },
  TSWarning = { fg = p.warning },
  TSDanger = { fg = p.error },

  BufferLine = { fg = p.t3, bg = p.t1 },
  BufferLineActive = { fg = p.t7, bg = p.t2 },

  GitSignsAdd = { fg = p.diff_plus },
  GitSignsChange = { fg = p.diff_delta },
  GitSignsDelete = { fg = p.diff_minus },

  TelescopeBorder = { fg = p.t4, bg = p.t1 },
  TelescopeNormal = { fg = p.t4, bg = p.t1 },
  TelescopeSelection = { fg = p.highlight_three, bg = p.t1 },

  NvimTreeRootFolder = { fg = p.t7 },
  NvimTreeFolderIcon = { fg = p.t8 },
  NvimTreeExecFile = { fg = p.diff_plus },
  NvimTreeOpenedFile = { fg = p.highlight },
  NvimTreeModifiedFile = { fg = p.highlight_two },

  WhichKey = { fg = p.t7 },
  WhichKeyDesc = { fg = p.t4 },
  WhichKeySeparator = { fg = p.t3 },
  WhichKeyFloat = { fg = p.t4, bg = p.t1 },
  WhichKeyGroup = { fg = p.t8 },
  WhichKeyValue = { fg = p.t6 },

  NotifyBackground = { bg = p.t1 },
  NotifyERRORBorder = { fg = p.error },
  NotifyWARNBorder = { fg = p.warning },
  NotifyINFOBorder = { fg = p.info },
  NotifyHINTBorder = { fg = p.display },
  NotifyERRORIcon = { fg = p.error },
  NotifyWARNIcon = { fg = p.warning },
  NotifyINFOIcon = { fg = p.info },
  NotifyHINTIcon = { fg = p.display },
  NotifyERRORTitle = { fg = p.error },
  NotifyWARNTitle = { fg = p.warning },
  NotifyINFOTitle = { fg = p.info },
  NotifyHINTTitle = { fg = p.display },

  CmpItemAbbr = { fg = p.t4 },
  CmpItemAbbrDeprecated = { fg = p.t3, strikethrough = true },
  CmpItemAbbrMatch = { fg = p.highlight_three },
  CmpItemAbbrMatchFuzzy = { fg = p.highlight_three },
  CmpItemKindDefault = { fg = p.t6 },
  CmpItemMenu = { fg = p.t3 },

  DashboardShortCut = { fg = p.highlight_three },
  DashboardHeader = { fg = p.t7 },
  DashboardCenter = { fg = p.highlight_two },
  DashboardFooter = { fg = p.t6 },

  markdownHeadingDelimiter = { fg = p.t7 },
  markdownListMarker = { fg = p.t7 },
  markdownLinkText = { fg = p.t11 },
  markdownUrl = { fg = p.t11, underline = true },
  markdownCode = { fg = p.t4 },
  markdownCodeBlock = { fg = p.t4 },
  markdownBlockquote = { fg = p.t5 },
  markdownBold = { bold = true },
  markdownItalic = { italic = true },
  markdownStrike = { strikethrough = true },

  ["@type"] = { fg = p.t8, bold = true },
  ["@type.builtin"] = { fg = p.t8, bold = true },
  ["@constructor"] = { fg = p.t8, bold = true },
  ["@constructor.rs"] = { fg = p.t8, bold = true },

  ["@lsp.type.type"] = { fg = p.t8, bold = true },
  ["@lsp.type.selfTypeKeyword"] = { fg = p.t8, bold = true },
  ["@lsp.type.selfKeyword"] = { fg = p.t8, bold = true },

  ["@keyword"] = { fg = p.t6 },
  ["@keyword.function"] = { fg = p.t11 },
  ["@keyword.operator"] = { fg = p.t8 },
  ["@keyword.import"] = { fg = p.t8 },
  ["@keyword.return"] = { fg = p.t8 },
  ["@keyword.conditional"] = { fg = p.t8 },
  ["@keyword.repeat"] = { fg = p.t8 },
  ["@keyword.exception"] = { fg = p.t8 },
  ["@keyword.debug"] = { fg = p.t7 },

  ["@storageclass"] = { fg = p.t7 },
  ["@storageclass.lifetime"] = { fg = p.t11 },

  ["@function"] = { fg = p.t10 },
  ["@function.builtin"] = { fg = p.t10 },
  ["@function.macro"] = { fg = p.t7 },
  ["@function.method"] = { fg = p.t7 },
  ["@function.call"] = { fg = p.t10 },
  ["@function.method.call"] = { fg = p.t7 },

  ["@variable"] = { fg = p.t4 },
  ["@variable.builtin"] = { fg = p.t7 },
  ["@variable.parameter"] = { fg = p.t6 },
  ["@variable.member"] = { fg = p.t6 },
  ["@field"] = { fg = p.t6 },

  ["@constant"] = { fg = p.t11 },
  ["@constant.builtin"] = { fg = p.t11 },
  ["@constant.macro"] = { fg = p.t11 },
  ["@number"] = { fg = p.t11 },
  ["@number.float"] = { fg = p.t11 },
  ["@boolean"] = { fg = p.t11 },

  ["@string"] = { fg = p.t6, italic = true },
  ["@string.special"] = { fg = p.t11 },
  ["@string.special.symbol"] = { fg = p.t11 },
  ["@string.special.url"] = { fg = p.t11, underline = true },
  ["@string.special.path"] = { fg = p.t11 },
  ["@string.regexp"] = { fg = p.t6 },
  ["@string.escape"] = { fg = p.t7 },

  ["@operator"] = { fg = p.t8 },
  ["@punctuation.delimiter"] = { fg = p.t9 },
  ["@punctuation.bracket"] = { fg = p.t9 },
  ["@punctuation.special"] = { fg = p.t7 },

  ["@namespace"] = { fg = p.t6, bold = true },
  ["@module"] = { fg = p.t6, bold = true },
  ["@label"] = { fg = p.t4 },
  ["@tag"] = { fg = p.t4 },
  ["@tag.attribute"] = { fg = p.t7 },
  ["@tag.delimiter"] = { fg = p.t9 },

  ["@comment"] = { fg = p.comment },
  ["@comment.documentation"] = { fg = p.comment_doc },
  ["@comment.error"] = { fg = p.error },
  ["@comment.warning"] = { fg = p.warning },
  ["@comment.todo"] = { fg = p.highlight },

  ["@markup.heading"] = { fg = p.t7 },
  ["@markup.strong"] = { bold = true },
  ["@markup.italic"] = { italic = true },
  ["@markup.strikethrough"] = { strikethrough = true },
  ["@markup.underline"] = { underline = true },
  ["@markup.quote"] = { fg = p.t5 },
  ["@markup.math"] = { fg = p.t7 },
  ["@markup.list"] = { fg = p.t7 },
  ["@markup.list.checked"] = { fg = p.diff_plus },
  ["@markup.list.unchecked"] = { fg = p.diff_delta },
  ["@markup.link"] = { fg = p.t11 },
  ["@markup.link.label"] = { fg = p.t11 },
  ["@markup.link.url"] = { fg = p.t11, underline = true },
  ["@markup.raw"] = { fg = p.t4 },
  ["@markup.raw.block"] = { fg = p.t4 },
  ["@diff.plus"] = { fg = p.diff_plus },
  ["@diff.minus"] = { fg = p.diff_minus },
  ["@diff.delta"] = { fg = p.diff_delta },
}

for name, hl in pairs(highlights) do
  vim.api.nvim_set_hl(0, name, hl)
end

vim.g.colors_name = "hex_poison"
