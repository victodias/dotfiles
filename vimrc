" =============================================================================
" William Espindola .vimrc
" -----------------------------------------------------------------------------
" heavily inspired by: @factorylabs, @scrooloose, @nvie, @gf3, @bit-theory,
" @millermedeiros
" =============================================================================

" -----------------------------------------------------------------------------
" BEHAVIOR
" -----------------------------------------------------------------------------

set nocompatible            " Disable vi compatibility

filetype on

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/Vundle.vim'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'easymotion/vim-easymotion'
Bundle 'bling/vim-airline'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'sheerun/vim-polyglot'
Bundle 'vim-syntastic/syntastic'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'tomtom/tlib_vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'wakatime/vim-wakatime'
Bundle 'craigemery/vim-autotag'

execute pathogen#infect()
synta on
filetype plugin indent on

" -----------------------------------------------------------------------------
" PLUGINS
" -----------------------------------------------------------------------------

" --- NERDTree ----
let NERDTreeIgnore=['.DS_Store']
let NERDTreeShowBookmarks=0         "show bookmarks on startup
let NERDTreeHighlightCursorline=1   "Highlight the selected entry in the tree
let NERDTreeShowLineNumbers=0
let NERDTreeMinimalUI=1
noremap <leader>nt :NERDTreeToggle<CR>

" --- NERDCommenter ---

let NERDSpaceDelims=1               " space around delimiters
let NERDRemoveExtraSpaces=1
let g:NERDCustomDelimiters = {
    \ 'scss': { 'left': '//' }
\ }

" --- autocomplete / supertab / jscomplete ---
set infercase
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d

" --- snipmate ---
let g:snips_author = 'William Espindola <oi@williamespindola.com.br>'

" --- EasyMotion ---
let g:EasyMotion_leader_key = '<Leader>m'
" lets make <leader>F and <leader>f use easymotion by default
let g:EasyMotion_mapping_f = '<leader>f'
let g:EasyMotion_mapping_F = '<leader>F'

" --- Strip trailing whitespace ---
function! StripWhitespace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

" Trailing white space (strip spaces)
noremap <leader>ss :call StripWhitespace()<CR>

" --- toggle indentation mode ---
function! ToggleExpandTab()
    if &et
        set noet softtabstop=0
    else
        execute "set et softtabstop=". &tabstop
    endif
endfunction

" --- vim-airline ---
"  activate porwerline fonts for vim-airline
let g:airline_powerline_fonts = 1
set laststatus=2
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" --- ctrlp ---
set runtimepath^=~/.vim/bundle/ctrlp.vim

" -----------------------------------------------------------------------------
" UI
" -----------------------------------------------------------------------------

set t_Co=256                " 256 colors terminal
colorscheme onedark
" make 'var' keyword easier to spot
hi link javascriptType Keyword
" default ColorColumn is too distractive
hi clear ColorColumn
hi link ColorColumn FoldColumn
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
" defaul line number is too distractive
hi clear LineNr
hi link LineNr Comment
set binary
set noeol
set timeoutlen=1000 ttimeoutlen=0
set cursorline cursorcolumn " Highlight current line and column
set laststatus=2            " Always show status line
set number                  " Enable line numbers.
set numberwidth=5           " width of numbers line (default on gvim is 4)
set report=0                " Show all changes.
set showmode                " Show the current mode.
set showcmd                 " show partial command on last line of screen.
set showmatch               " show matching parenthesis
set splitbelow splitright   " how to split new windows.
set title                   " Show the filename in the window title bar.

let g:Powerline_symbols = 'unicode'
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\

if has("gui_running")
   set lines=60 columns=200
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Monaco:h12
   endif
endif

" --- command completion ---
set wildmenu                " Hitting TAB in command mode will
set wildchar=<TAB>          "   show possible completions.
set wildmode=list:longest
set wildignore+=*.DS_STORE,*.db,node_modules/**,*.jpg,*.png,*.gif

" --- Tabular.vim ---
vmap <silent> <leader>t: :Tabularize /:<CR>
nmap <silent> <leader>t: :Tabularize /:<CR>
vmap <silent> <leader>t= :Tabularize /=<CR>
nmap <silent> <leader>t= :Tabularize /=<CR>
vmap <silent> <leader>t, :Tabularize /,<CR>
nmap <silent> <leader>t, :Tabularize /,<CR>
vmap <silent> <leader>t{ :Tabularize /{<CR>
nmap <silent> <leader>t{ :Tabularize /{<CR>
vmap <silent> <leader>t" :Tabularize /"<CR>
nmap <silent> <leader>t" :Tabularize /"<CR>
vmap <silent> <leader>t' :Tabularize /'<CR>
nmap <silent> <leader>t' :Tabularize /'<CR>
vmap <silent> <leader>t[ :Tabularize /[<CR>
nmap <silent> <leader>t[ :Tabularize /[<CR>
vmap <silent> <leader>t/ :Tabularize /\/\/<CR>
nmap <silent> <leader>t/ :Tabularize /\/\/<CR>
vmap <silent> <leader>t\| :Tabularize /\|<CR>
nmap <silent> <leader>t\| :Tabularize /\|<CR>

" -----------------------------------------------------------------------------
" KEY MAPPINGS
" -----------------------------------------------------------------------------

" no replace past
xnoremap p pgvy

" avoid mistyping commands
command! W w
command! Wq wq
command! Bd bd

" hotkey to close window
nnoremap q :q<enter>

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing
nnoremap S i<cr><esc><right>

" movement by screen line instead of file line (for text wrap)
nnoremap j gj
nnoremap <down> gj
nnoremap k gk
nnoremap <up> gk

" next and previus tab
nnoremap <C-Tab> :tabn<CR>
nnoremap <C-S-Tab> :tabp<CR>

" automatic esc, really uncommon to type jj,jk
inoremap jj <ESC>
inoremap jk <Esc>

" Faster scrolling
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" Bubble single lines, similar to Eclipse (requires unimpaired.vim)
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines, similar to Eclipse (requires unimpaired.vim)
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Duplicate lines, similar to Eclipse
noremap <C-S-Up> YP
noremap <C-S-Down> YP

" Move between splits (windows)
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Make tab in v mode work like I think it should (keep highlighting):
vmap <tab> >gv
vmap <s-tab> <gv

" -----------------------------------------------------------------------------
"  INDENTATION AND TEXT-WRAP
" -----------------------------------------------------------------------------

set expandtab                   " Expand tabs to spaces
set autoindent smartindent      " auto/smart indent
set copyindent                  " copy previous indentation on auto indent
set softtabstop=4               " Tab key results in # spaces
set tabstop=4                   " Tab is # spaces
set shiftwidth=4                " The # of spaces for indenting.
set smarttab                    " At start of line, <Tab> inserts shift width spaces, <Bs> deletes shift width spaces.
set wrap                        " wrap lines
set textwidth=79
set colorcolumn=+1              " Show large lines
set formatoptions=qrn1          " automatic formating.
set formatoptions-=o            " don't start new lines w/ comment leader on pressing 'o'
set nomodeline                  " don't use modeline (security)

set pastetoggle=<leader>p       " paste mode: avoid auto indent, treat chars as literal.
