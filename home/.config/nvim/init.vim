set nocompatible
filetype off


"
" Load Plugins
"
call plug#begin()
Plug 'ciaranm/securemodelines'          " Prevent code execution through modelines
" Plug 'jlanzarotta/bufexplorer'          " Sidebar buffer explorer
Plug 'airblade/vim-rooter'              " Auto-switch CWD to root of project
Plug 'jceb/vim-orgmode'                 " EMACS org-mode clone
Plug 'thaerkh/vim-workspace'            " Auto sessions

" UI
Plug 'itchyny/lightline.vim'            " Prettier, more useful modeline
Plug 'machakann/vim-highlightedyank'    " Show yanks briefly after a highlight
Plug 'andymass/vim-matchup'             " Show text of matches when highlighting start/end tag

" Syntax support
Plug 'cespare/vim-toml'                 " TOML support
Plug 'stephpy/vim-yaml'                 " YAML support
Plug 'rust-lang/rust.vim'               " Rust support
Plug 'godlygeek/tabular'                " Markdown support
Plug 'plasticboy/vim-markdown'          " Markdown support
Plug 'kovetskiy/sxhkd-vim'              " For BSPWM's sxhkd

" FZF
" Plug '~/.fzf'                           " FZF
Plug 'junegunn/fzf.vim'                 " FZF
Plug 'junegunn/fzf'                    " FZF
call plug#end()


"
" Set Colorscheme
"
colorscheme custom-theme


"
" Enable filetype plugins and syntax highlighting 
"
filetype plugin indent on

syntax enable
syntax on


"
" Switch leader to backslash
"
let mapleader='\'


"
" Set basic options
"
set backspace=indent,eol,start  " Backspace across line breaks, start-of-insert, etc.
set encoding=utf-8              " Default for new files is UTF-8
set expandtab                   " Tabs are evil
set conceallevel=2
set concealcursor=nc
set cursorline                  " Highlight current line
set cursorcolumn                " Highlight current column
set hidden                      " Allow background buffers to stay loaded
set hlsearch                    " Highlight matches
set ignorecase                  " Case insensitive-searech
set smartcase                   " ... unless UPPER_CASE chars are searched for
set incsearch                   " Search while typing
set laststatus=2                " Permanent statusline
set lazyredraw                  " Faster redraws
set lcs=tab:»·,trail:·          " Set chars to draw when visualizing special chars
set list                        " Show tabs and trailing whitespace
set modelines=0                 " ??
set nobackup                    " No backup files
set nowritebackup               " No backup files
set nowrap                      " No line wrapping
set number                      " Show line numbers
set relativenumber              " Use relative numbering
set shiftround                  " Always shift to a multiple of shiftwidth
set shiftwidth=4                " Default tabstop is 4
set softtabstop=4               " Seriously
set tabstop=4                   " Seriously
set shortmess=atIc              " Disable lots of annoying prompts
set sidescroll=1                " Allow horizontal scrolling one-char-at-a-time
set termguicolors               " Use terminal colors
set virtualedit=block           " Allow block editing to affect where there is no data
set visualbell                  " No audio bell
" set noshowmode
set ttyfast                     " We are on a fast tty, so redraw agressively
set showcmd                     " We are on a fast tty, so show partial commands
set mouse=a                     " Allow all mouse-based interactions
set signcolumn=yes              " Enable sign-column for hint/lint/etc. integration
set undodir=~/.vimdid           " Centralized undo repository
set undofile                    " Keep undo files there
set updatetime=300              " Faster disk writes


"
" Helper bindings
"
nnoremap <silent> <leader>cd :cd %:p:h<cr>
nnoremap <silent> <leader>tl :set invlist<cr>:set list?<cr>
nnoremap <silent> <leader>tn :set invnumber<cr>:set invrelativenumber<cr>
nnoremap <silent> <leader>tc :set invcursorline<cr>:set invcursorcolumn<cr>
nnoremap <silent> <leader>tw :set invwrap<cr>:set wrap?<cr>
nnoremap <silent> <leader>ve :e ~/.config/nvim/init.vim<cr>
nnoremap <silent> <leader>vs :source ~/.local/nvim/init.vim<cr>
nnoremap <silent> <Esc><Esc> :let @/=""<cr>
nnoremap Y y$


"
" When searching, keep matches centered in screen
"
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz


"
" Fix how vertical movement interacts with wrapping
"
nnoremap j gj
nnoremap k gk


"
" Workspace config
"
let g:workspace_session_disable_on_args = 1

"
" Lightline config
"
let g:lightline = {
  \   'colorscheme': 'base16auto',
  \   'active': {
  \     'left':  [
  \                [ 'mode', 'paste' ],
  \                [ 'readonly', 'filename', 'modified' ],
  \                [ 'charvalue', 'charvaluehex' ]
  \              ],
  \     'right': [
  \                [ 'lineinfo' ],
  \                [ 'percent' ],
  \                [ 'fileformat', 'fileencoding', 'filetype' ]
  \              ]
  \   },
  \   'inactive': {
  \     'left':  [
  \                [ 'filename' ]
  \              ],
  \     'right': [
  \                [ 'lineinfo' ],
  \                [ 'percent' ]
  \              ]
  \   },
  \   'tabline': {
  \     'left':  [
  \                [ 'tabs' ]
  \              ],
  \     'right': [
  \                [ 'close' ]
  \              ]
  \   }
  \ }


" augroup asm
"   au!
"   autocmd BufNewFile,BufRead *.s set syntax=asmM6502
" augroup END


"
" BufExporer config
"
" let g:bufExplorerSortBy='name' " Sort by the buffer's name.
" nnoremap <silent> <tab> :ToggleBufExplorer<CR>


"
" FZF
"
let g:fzf_layout = { 'down': '~40%' }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Other mode completion
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler nonumber norelativenumber
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler number relativenumber

nnoremap <silent> <leader>fo :Files<CR>
nnoremap <silent> <tab> :Buffers<CR>
