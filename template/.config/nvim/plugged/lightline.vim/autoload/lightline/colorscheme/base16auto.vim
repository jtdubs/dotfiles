let s:theme00 = '##theme00##'
let s:theme01 = '##theme01##'
let s:theme02 = '##theme02##'
let s:theme03 = '##theme03##'
let s:theme04 = '##theme04##'
let s:theme05 = '##theme05##'
let s:theme06 = '##theme06##'
let s:theme07 = '##theme07##'
let s:theme08 = '##theme08##'
let s:theme09 = '##theme09##'
let s:theme0A = '##theme0A##'
let s:theme0B = '##theme0B##'
let s:theme0C = '##theme0C##'
let s:theme0D = '##theme0D##'
let s:theme0E = '##theme0E##'
let s:theme0F = '##theme0F##'

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
