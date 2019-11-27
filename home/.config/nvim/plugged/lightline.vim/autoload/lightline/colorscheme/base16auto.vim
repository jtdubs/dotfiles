" =============================================================================
" Filename: autoload/lightline/colorscheme/PaperColor_dark.vim
" Author: TKNGUE
" License: MIT License
" Last Change: 2015-07-27 06:01
" =============================================================================

let s:red = '#FF4F21'
let s:green = '#009641'
let s:blue = '##base0c##'

let s:pink = '#6BE5A0'
let s:olive = '#FF9821'
let s:navy = '#FF9478'

let s:orange = '#FF9478'
let s:purple = '#E81E76'
let s:aqua = '#2291C7'

" Basics:
let s:foreground = '#C1C1C1'
let s:background = '#4B4B4B'
let s:window = '#C1C1C1'
let s:status = '#6E6E6E'
let s:error = '#FF4F21'

" Tabline:
let s:tabline_bg = '#4B4B4B'
let s:tabline_active_fg = '#1F1F1F'
let s:tabline_active_bg = '#2291C7'
let s:tabline_inactive_fg = '#6E6E6E'
let s:tabline_inactive_bg = '#4B4B4B'

" Statusline:
let s:statusline_active_fg = '#1F1F1F'
let s:statusline_active_bg = '#055B85'
let s:statusline_inactive_fg = '#6E6E6E'
let s:statusline_inactive_bg = '#4B4B4B'

" Visual:
let s:visual_fg = '#1F1F1F'
let s:visual_bg = '#E81E76'

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
