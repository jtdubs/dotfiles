" vi:syntax=vim

" GUI color definitions
let s:theme00 = "#btheme00##"
let s:theme01 = "#btheme01##"
let s:theme02 = "#btheme02##"
let s:theme03 = "#btheme03##"
let s:theme04 = "#btheme04##"
let s:theme05 = "#btheme05##"
let s:theme06 = "#btheme06##"
let s:theme07 = "#btheme07##"
let s:theme08 = "#btheme08##"
let s:theme09 = "#btheme09##"
let s:theme0A = "#btheme0A##"
let s:theme0B = "#btheme0B##"
let s:theme0C = "#btheme0C##"
let s:theme0D = "#btheme0D##"
let s:theme0E = "#btheme0E##"
let s:theme0F = "#btheme0F##"

" Theme setup
hi clear
syntax reset
let g:colors_name = "custom-theme"

" Highlighting function
" Optional variables are attributes and guisp
function! g:Base16hi(group, guifg, guibg, ...)
  let l:attr = get(a:, 1, "")
  let l:guisp = get(a:, 2, "")

  if a:guifg != ""
    exec "hi " . a:group . " guifg=#" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=#" . a:guibg
  endif
  if l:attr != ""
    exec "hi " . a:group . " gui=" . l:attr
  endif
  if l:guisp != ""
    exec "hi " . a:group . " guisp=#" . l:guisp
  endif
endfunction


fun <sid>hi(group, guifg, guibg, attr, guisp)
  call g:Base16hi(a:group, a:guifg, a:guibg, a:attr, a:guisp)
endfun

" Vim editor colors
call <sid>hi("Normal",        s:theme04, s:theme00, "", "")
call <sid>hi("Bold",          "", "", "bold", "")
call <sid>hi("Debug",         s:theme06, "", "", "")
call <sid>hi("Directory",     s:theme0D, "", "", "")
call <sid>hi("Error",         s:theme00, s:theme06, "", "")
call <sid>hi("ErrorMsg",      s:theme06, s:theme00, "", "")
call <sid>hi("Exception",     s:theme06, "", "", "")
call <sid>hi("FoldColumn",    s:theme0A, s:theme00, "", "")
call <sid>hi("Folded",        s:theme03, s:theme00, "", "")
call <sid>hi("IncSearch",     s:theme00, s:theme0B, "none", "")
call <sid>hi("Italic",        "", "", "none", "")
call <sid>hi("Macro",         s:theme06, "", "", "")
call <sid>hi("MatchParen",    "", s:theme02,  "", "")
call <sid>hi("ModeMsg",       s:theme0B, "", "", "")
call <sid>hi("MoreMsg",       s:theme0B, "", "", "")
call <sid>hi("Question",      s:theme0D, "", "", "")
call <sid>hi("Search",        s:theme00, s:theme0A,  "", "")
call <sid>hi("Substitute",    s:theme00, s:theme08, "none", "")
call <sid>hi("SpecialKey",    s:theme02, "", "", "")
call <sid>hi("TooLong",       s:theme06, "", "", "")
call <sid>hi("Underlined",    s:theme06, "", "", "")
call <sid>hi("Visual",        "", s:theme0C, "", "")
call <sid>hi("VisualNOS",     s:theme06, "", "", "")
call <sid>hi("WarningMsg",    s:theme08, "", "", "")
call <sid>hi("WildMenu",      s:theme00, s:theme08, "", "")
call <sid>hi("Title",         s:theme0D, "", "none", "")
call <sid>hi("Conceal",       s:theme0D, s:theme00, "", "")
call <sid>hi("Cursor",        s:theme00, s:theme03, "", "")
call <sid>hi("NonText",       s:theme02, "", "", "")
call <sid>hi("LineNr",        s:theme02, s:theme00, "", "")
call <sid>hi("SignColumn",    s:theme02, s:theme00, "", "")
call <sid>hi("StatusLine",    s:theme00, s:theme0C, "none", "")
call <sid>hi("StatusLineNC",  s:theme04, s:theme02, "none", "")
call <sid>hi("VertSplit",     s:theme0C, s:theme0C, "none", "")
call <sid>hi("ColorColumn",   "", s:theme08, "none", "")
call <sid>hi("CursorColumn",  "", s:theme01, "none", "")
call <sid>hi("CursorLine",    "", s:theme01, "none", "")
call <sid>hi("CursorLineNr",  s:theme0D, s:theme01, "", "")
call <sid>hi("QuickFixLine",  "", s:theme09, "none", "")
call <sid>hi("PMenu",         s:theme00, s:theme09, "none", "")
call <sid>hi("PMenuSel",      s:theme09, s:theme00, "", "")
call <sid>hi("TabLine",       s:theme01, s:theme09, "none", "")
call <sid>hi("TabLineFill",   s:theme01, s:theme09, "none", "")
call <sid>hi("TabLineSel",    s:theme0B, s:theme09, "none", "")

" Standard syntax highlighting
call <sid>hi("Boolean",      s:theme07, "", "", "")
call <sid>hi("Character",    s:theme06, "", "", "")
call <sid>hi("Comment",      s:theme03, "", "", "")
call <sid>hi("Conditional",  s:theme09, "", "", "")
call <sid>hi("Constant",     s:theme07, "", "", "")
call <sid>hi("Define",       s:theme09, "", "none", "")
call <sid>hi("Delimiter",    s:theme05, "", "", "")
call <sid>hi("Float",        s:theme07, "", "", "")
call <sid>hi("Function",     s:theme0D, "", "", "")
call <sid>hi("Identifier",   s:theme0F, "", "none", "")
call <sid>hi("Include",      s:theme0D, "", "", "")
call <sid>hi("Keyword",      s:theme09, "", "", "")
call <sid>hi("Label",        s:theme08, "", "", "")
call <sid>hi("Number",       s:theme07, "", "", "")
call <sid>hi("Operator",     s:theme03, "", "none", "")
call <sid>hi("PreProc",      s:theme08, "", "", "")
call <sid>hi("Repeat",       s:theme08, "", "", "")
call <sid>hi("Special",      s:theme0A, "", "", "")
call <sid>hi("SpecialChar",  s:theme05, "", "", "")
call <sid>hi("Statement",    s:theme0A, "", "", "")
call <sid>hi("StorageClass", s:theme08, "", "", "")
call <sid>hi("String",       s:theme0B, "", "", "")
call <sid>hi("Structure",    s:theme09, "", "", "")
call <sid>hi("Tag",          s:theme08, "", "", "")
call <sid>hi("Todo",         s:theme00, s:theme0A, "", "")
call <sid>hi("Type",         s:theme08, "", "none", "")
call <sid>hi("Typedef",      s:theme08, "", "", "")

" VIMRC highlighting

" C highlighting
call <sid>hi("cOperator",   s:theme0A, "", "", "")
call <sid>hi("cPreCondit",  s:theme0A, "", "", "")

" C# highlighting
call <sid>hi("csClass",                 s:theme08, "", "", "")
call <sid>hi("csAttribute",             s:theme08, "", "", "")
call <sid>hi("csModifier",              s:theme0A, "", "", "")
call <sid>hi("csType",                  s:theme06, "", "", "")
call <sid>hi("csUnspecifiedStatement",  s:theme0D, "", "", "")
call <sid>hi("csContextualStatement",   s:theme0A, "", "", "")
call <sid>hi("csNewDecleration",        s:theme06, "", "", "")

" CSS highlighting
call <sid>hi("cssBraces",      s:theme03, "", "", "")
call <sid>hi("cssClassName",   s:theme0A, "", "", "")
call <sid>hi("cssColor",       s:theme0A, "", "", "")

" Diff highlighting
call <sid>hi("DiffAdd",      s:theme0E, s:theme00, "", "")
call <sid>hi("DiffChange",   s:theme0D, s:theme00, "", "")
call <sid>hi("DiffDelete",   s:theme0C, s:theme00, "", "")
call <sid>hi("DiffText",     s:theme0D, s:theme00, "", "")
call <sid>hi("DiffAdded",    s:theme0E, s:theme00, "", "")
call <sid>hi("DiffFile",     s:theme0D, s:theme00, "", "")
call <sid>hi("DiffNewFile",  s:theme0E, s:theme00, "", "")
call <sid>hi("DiffLine",     s:theme0D, s:theme00, "", "")
call <sid>hi("DiffRemoved",  s:theme0C, s:theme00, "", "")

" Git highlighting
call <sid>hi("gitcommitOverflow",       s:theme06, "", "", "")
call <sid>hi("gitcommitSummary",        s:theme0B, "", "", "")
call <sid>hi("gitcommitComment",        s:theme03, "", "", "")
call <sid>hi("gitcommitUntracked",      s:theme03, "", "", "")
call <sid>hi("gitcommitDiscarded",      s:theme03, "", "", "")
call <sid>hi("gitcommitSelected",       s:theme03, "", "", "")
call <sid>hi("gitcommitHeader",         s:theme0A, "", "", "")
call <sid>hi("gitcommitSelectedType",   s:theme0D, "", "", "")
call <sid>hi("gitcommitUnmergedType",   s:theme0D, "", "", "")
call <sid>hi("gitcommitDiscardedType",  s:theme0D, "", "", "")
call <sid>hi("gitcommitBranch",         s:theme07, "", "bold", "")
call <sid>hi("gitcommitUntrackedFile",  s:theme08, "", "", "")
call <sid>hi("gitcommitUnmergedFile",   s:theme06, "", "bold", "")
call <sid>hi("gitcommitDiscardedFile",  s:theme06, "", "bold", "")
call <sid>hi("gitcommitSelectedFile",   s:theme0B, "", "bold", "")

" GitGutter highlighting
call <sid>hi("GitGutterAdd",     s:theme0E, s:theme0C, "", "")
call <sid>hi("GitGutterChange",  s:theme0D, s:theme0C, "", "")
call <sid>hi("GitGutterDelete",  s:theme0D, s:theme0C, "", "")
call <sid>hi("GitGutterChangeDelete",  s:theme0E, s:theme0C, "", "")

" HTML highlighting
call <sid>hi("htmlBold",    s:theme08, "", "", "")
call <sid>hi("htmlItalic",  s:theme0A, "", "", "")
call <sid>hi("htmlEndTag",  s:theme03, "", "", "")
call <sid>hi("htmlTag",     s:theme03, "", "", "")

" JavaScript highlighting
call <sid>hi("javaScript",        s:theme03, "", "", "")
call <sid>hi("javaScriptBraces",  s:theme03, "", "", "")
call <sid>hi("javaScriptNumber",  s:theme07, "", "", "")
" pangloss/vim-javascript highlighting
call <sid>hi("jsOperator",          s:theme0D, "", "", "")
call <sid>hi("jsStatement",         s:theme0A, "", "", "")
call <sid>hi("jsReturn",            s:theme0A, "", "", "")
call <sid>hi("jsThis",              s:theme06, "", "", "")
call <sid>hi("jsClassDefinition",   s:theme08, "", "", "")
call <sid>hi("jsFunction",          s:theme0A, "", "", "")
call <sid>hi("jsFuncName",          s:theme0D, "", "", "")
call <sid>hi("jsFuncCall",          s:theme0D, "", "", "")
call <sid>hi("jsClassFuncName",     s:theme0D, "", "", "")
call <sid>hi("jsClassMethodType",   s:theme0A, "", "", "")
call <sid>hi("jsRegexpString",      s:theme0A, "", "", "")
call <sid>hi("jsGlobalObjects",     s:theme08, "", "", "")
call <sid>hi("jsGlobalNodeObjects", s:theme08, "", "", "")
call <sid>hi("jsExceptions",        s:theme08, "", "", "")
call <sid>hi("jsBuiltins",          s:theme08, "", "", "")

" Mail highlighting
call <sid>hi("mailQuoted1",  s:theme08, "", "", "")
call <sid>hi("mailQuoted2",  s:theme0B, "", "", "")
call <sid>hi("mailQuoted3",  s:theme0A, "", "", "")
call <sid>hi("mailQuoted4",  s:theme0A, "", "", "")
call <sid>hi("mailQuoted5",  s:theme0D, "", "", "")
call <sid>hi("mailQuoted6",  s:theme08, "", "", "")
call <sid>hi("mailURL",      s:theme0D, "", "", "")
call <sid>hi("mailEmail",    s:theme0D, "", "", "")

" Markdown highlighting
call <sid>hi("markdownCode",              s:theme0B, "", "", "")
call <sid>hi("markdownError",             s:theme06, s:theme00, "", "")
call <sid>hi("markdownCodeBlock",         s:theme0B, "", "", "")
call <sid>hi("markdownHeadingDelimiter",  s:theme0D, "", "", "")

" NERDTree highlighting
call <sid>hi("NERDTreeDirSlash",  s:theme0D, "", "", "")
call <sid>hi("NERDTreeExecFile",  s:theme03, "", "", "")

" PHP highlighting
call <sid>hi("phpMemberSelector",  s:theme03, "", "", "")
call <sid>hi("phpComparison",      s:theme03, "", "", "")
call <sid>hi("phpParent",          s:theme03, "", "", "")
call <sid>hi("phpMethodsVar",      s:theme0A, "", "", "")

" Python highlighting
call <sid>hi("pythonOperator",  s:theme0A, "", "", "")
call <sid>hi("pythonRepeat",    s:theme0A, "", "", "")
call <sid>hi("pythonInclude",   s:theme0A, "", "", "")
call <sid>hi("pythonStatement", s:theme0A, "", "", "")

" Ruby highlighting
call <sid>hi("rubyAttribute",               s:theme0D, "", "", "")
call <sid>hi("rubyConstant",                s:theme08, "", "", "")
call <sid>hi("rubyInterpolationDelimiter",  s:theme05, "", "", "")
call <sid>hi("rubyRegexp",                  s:theme0A, "", "", "")
call <sid>hi("rubySymbol",                  s:theme0B, "", "", "")
call <sid>hi("rubyStringDelimiter",         s:theme0B, "", "", "")

" SASS highlighting
call <sid>hi("sassidChar",     s:theme06, "", "", "")
call <sid>hi("sassClassChar",  s:theme07, "", "", "")
call <sid>hi("sassInclude",    s:theme0A, "", "", "")
call <sid>hi("sassMixing",     s:theme0A, "", "", "")
call <sid>hi("sassMixinName",  s:theme0D, "", "", "")

" Signify highlighting
call <sid>hi("SignifySignAdd",     s:theme0B, s:theme09, "", "")
call <sid>hi("SignifySignChange",  s:theme0D, s:theme09, "", "")
call <sid>hi("SignifySignDelete",  s:theme06, s:theme09, "", "")

" Spelling highlighting
call <sid>hi("SpellBad",     "", "", "undercurl", s:theme06)
call <sid>hi("SpellLocal",   "", "", "undercurl", s:theme0A)
call <sid>hi("SpellCap",     "", "", "undercurl", s:theme0D)
call <sid>hi("SpellRare",    "", "", "undercurl", s:theme0A)

" Startify highlighting
call <sid>hi("StartifyBracket",  s:theme02, "", "", "")
call <sid>hi("StartifyFile",     s:theme04, "", "", "")
call <sid>hi("StartifyFooter",   s:theme02, "", "", "")
call <sid>hi("StartifyHeader",   s:theme0B, "", "", "")
call <sid>hi("StartifyNumber",   s:theme07, "", "", "")
call <sid>hi("StartifyPath",     s:theme02, "", "", "")
call <sid>hi("StartifySection",  s:theme0A, "", "", "")
call <sid>hi("StartifySelect",   s:theme0A, "", "", "")
call <sid>hi("StartifySlash",    s:theme02, "", "", "")
call <sid>hi("StartifySpecial",  s:theme02, "", "", "")

" Java highlighting
call <sid>hi("javaOperator",     s:theme0D, "", "", "")

" Remove functions
delf <sid>hi

" Make normal background transparent 
hi Normal guibg=NONE

" Remove color variables
unlet s:theme00 s:theme01 s:theme02 s:theme03 s:theme04 s:theme05 s:theme06 s:theme07 s:theme08 s:theme09 s:theme0A s:theme0B s:theme0C s:theme0D s:theme0E s:theme0F
