" =============================================================================
" Filename: autoload/lightline/colorscheme/PaperColor_dark.vim
" Author: TKNGUE
" License: MIT License
" Last Change: 2015-07-27 06:01
" =============================================================================

let s:red = '##base08##'
let s:green = '##base01##'
let s:blue = '##base0c##'

let s:pink = '##base0B##'
let s:olive = '##base0A##'
let s:navy = '##base09##'

let s:orange = '##base09##'
let s:purple = '##base0E##'
let s:aqua = '##base04##'

" Basics:
let s:foreground = '##base07##'
let s:background = '##base03##'
let s:window = '##base07##'
let s:status = '##base05##'
let s:error = '##base08##'

" Tabline:
let s:tabline_bg = '##base03##'
let s:tabline_active_fg = '##base00##'
let s:tabline_active_bg = '##base04##'
let s:tabline_inactive_fg = '##base05##'
let s:tabline_inactive_bg = '##base03##'

" Statusline:
let s:statusline_active_fg = '##base00##'
let s:statusline_active_bg = '##base02##'
let s:statusline_inactive_fg = '##base05##'
let s:statusline_inactive_bg = '##base03##'

" Visual:
let s:visual_fg = '##base00##'
let s:visual_bg = '##base0E##'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:foreground, s:background ], [ s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.normal.right = [ [ s:foreground, s:background ], [ s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.normal.middle = [ [ s:statusline_active_fg, s:statusline_active_bg ]]
let s:p.inactive.right = [ [ s:foreground, s:background ], [ s:foreground, s:background ] ]
let s:p.inactive.left = [ [ s:foreground, s:background ], [ s:foreground, s:background ] ]
let s:p.inactive.middle = [ [ s:foreground, s:background ], ]
let s:p.insert.left = [ [ s:foreground, s:background], [ s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.replace.left = [ [ s:background, s:pink ], [s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.visual.left = [ [ s:visual_fg, s:visual_bg ], [s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.tabline.left = [ [s:tabline_inactive_fg, s:tabline_inactive_bg ]]
let s:p.tabline.tabsel = [ [s:tabline_active_fg, s:tabline_active_bg ] ]
let s:p.tabline.middle = [ [s:tabline_bg, s:tabline_bg]]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:background, s:error ] ]

let g:lightline#colorscheme#base16auto#palette = lightline#colorscheme#fill(s:p)
