let s:theme00 = '#181818'
let s:theme01 = '#303030'
let s:theme02 = '#505050'
let s:theme03 = '#707070'
let s:theme04 = '#C0C0C0'
let s:theme05 = '#E8E8E8'
let s:theme06 = '#D1421C'
let s:theme07 = '#FF896A'
let s:theme08 = '#FFD66A'
let s:theme09 = '#14954C'
let s:theme0A = '#4FBE7F'
let s:theme0B = '#ABEBC7'
let s:theme0C = '#176184'
let s:theme0D = '#4C8CAC'
let s:theme0E = '#AAD2E5'
let s:theme0F = '#D17D1C'

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
