let s:theme00 = '#1F1F1F'
let s:theme01 = '#363636'
let s:theme02 = '#4B4B4B'
let s:theme03 = '#6E6E6E'
let s:theme04 = '#C1C1C1'
let s:theme05 = '#D22C00'
let s:theme06 = '#FF4F21'
let s:theme07 = '#FF9478'
let s:theme08 = '#FF9821'
let s:theme09 = '#009641'
let s:theme0A = '#1BD36B'
let s:theme0B = '#6BE5A0'
let s:theme0C = '#055B85'
let s:theme0D = '#2291C7'
let s:theme0E = '#6EB9DE'
let s:theme0F = '#E81E76'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

" Default:
let s:outer = [ s:theme04, s:theme02 ]
let s:inner = [ s:theme00, s:theme03 ]
let s:mid   = [ s:theme00, s:theme0C ]

" Inactive:
let s:p.inactive.right  = [ s:outer, s:outer ]
let s:p.inactive.left   = [ s:outer, s:outer ]
let s:p.inactive.middle = [ s:outer, ]

" Standard::
let s:p.normal.right  = [ s:outer, s:inner, s:mid ]
let s:p.normal.middle = [ s:mid, ]
let s:p.normal.error  = [ [ s:theme02, s:theme06 ] ]

" Modes:
let s:p.normal.left  = [ s:outer, s:inner, s:mid ]
let s:p.insert.left  = [ s:outer, s:inner, s:mid ]
let s:p.replace.left = [ [ s:theme02, s:theme0B ], s:inner, s:mid ]
let s:p.visual.left  = [ [ s:theme00, s:theme0F ], s:inner, s:mid ]

let g:lightline#colorscheme#base16auto#palette = lightline#colorscheme#fill(s:p)
