" =============================================================================
" Filename: autoload/lightline/colorscheme/PaperColor_dark.vim
" Author: TKNGUE
" License: MIT License
" Last Change: 2015-07-27 06:01
" =============================================================================

let s:red = '#CD3F45'
let s:green = '#8EC43D'
let s:blue = '##base0c##'

let s:pink = '#9FCA56'
let s:olive = '#E6CD69'
let s:navy = '#DB7B55'

let s:orange = '#DB7B55'
let s:purple = '#A074C4'
let s:aqua = '#43A5D5'

" Basics:
let s:foreground = '#D6D6D6'
let s:background = '#41535B'
let s:window = '#EEEEEE'
let s:status = '#D6D6D6'
let s:error = '#CD3F45'

" Tabline:
let s:tabline_bg = '#41535B'
let s:tabline_active_fg = '#151718'
let s:tabline_active_bg = '#43A5D5'
let s:tabline_inactive_fg = '#D6D6D6'
let s:tabline_inactive_bg = '#41535B'

" Statusline:
let s:statusline_active_fg = '#151718'
let s:statusline_active_bg = '#3B758C'
let s:statusline_inactive_fg = '#D6D6D6'
let s:statusline_inactive_bg = '#41535B'

" Visual:
let s:visual_fg = '#151718'
let s:visual_bg = '#A074C4'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:foreground, s:background ], [ s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.normal.right = [ [ s:foreground, s:background ], [ s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.normal.middle = [ [ s:statusline_active_fg, s:statusline_active_bg ]]
let s:p.inactive.right = [ [ s:foreground, s:background ], [ s:foreground, s:background ] ]
let s:p.inactive.left = [ [ s:foreground, s:background ], [ s:foreground, s:background ] ]
let s:p.inactive.middle = [ [ s:foreground, s:background ], ]
let s:p.insert.left = [ [ s:blue, s:background], [ s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.replace.left = [ [ s:background, s:pink ], [s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.visual.left = [ [ s:visual_fg, s:visual_bg ], [s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.tabline.left = [ [s:tabline_inactive_fg, s:tabline_inactive_bg ]]
let s:p.tabline.tabsel = [ [s:tabline_active_fg, s:tabline_active_bg ] ]
let s:p.tabline.middle = [ [s:tabline_bg, s:tabline_bg]]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:background, s:error ] ]

let g:lightline#colorscheme#base16auto#palette = lightline#colorscheme#fill(s:p)
