set nocompatible
filetype off


"
" Load Plugins
"
call plug#begin()
Plug 'ciaranm/securemodelines'          " Prevent code execution through modelines
Plug 'jlanzarotta/bufexplorer'          " Sidebar buffer explorer
Plug 'airblade/vim-rooter'              " Auto-switch CWD to root of project

" UI
Plug 'itchyny/lightline.vim'            " Prettier, more useful modeline
Plug 'machakann/vim-highlightedyank'    " Show yanks briefly after a highlight
Plug 'andymass/vim-matchup'             " Show text of matches when highlighting start/end tag
Plug 'chriskempson/base16-vim'          " Color schemes

" Magic
Plug 'neoclide/coc.nvim',
  \ { 'branch': 'release' }
" Plug 'autozimu/LanguageClient-neovim',  " Client for 'language servers'
"   \ { 'branch': 'next',
"   \   'do':     'bash install.sh' }

" Syntax support
Plug 'cespare/vim-toml'                 " TOML support
Plug 'stephpy/vim-yaml'                 " YAML support
Plug 'rust-lang/rust.vim'               " Rust support
Plug 'plasticboy/vim-markdown'          " Markdown support
Plug 'kovetskiy/sxhkd-vim'              " For BSPWM's sxhkd
call plug#end()


"
" Set Colorscheme
"
colorscheme base16-seti


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
nnoremap <silent> <leader>tw :set invwrap<cr>:set wrap?<cr>
nnoremap <silent> <leader>ve :e ~/.vimrc<cr>
nnoremap <silent> <leader>vs :source ~/.local/nvim/init.vim<cr>
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
let g:bufExplorerSortBy='name' " Sort by the buffer's name.
nnoremap <silent> <tab> :ToggleBufExplorer<CR>


"
" LanguageClient config
"
" let g:LanguageClient_serverCommands = {
"   \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"   \ 'python': ['~/.local/bin/pyls']
"   \ }
" 
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


"
" COC Config
"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
