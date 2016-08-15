call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Group dependencies, vim-snippets depends on ultisnips
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Add plugins to &runtimepath

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'vim-airline/vim-airline'
Plug 'altercation/vim-colors-solarized'

Plug 'airblade/vim-gitgutter'


call plug#end()



" execute pathogen#infect()
" execute pathogen#helptags()
syntax on
filetype plugin indent on

" Remapping
inoremap jj <ESC>

let mapleader = "\<Space>"


" Colors
set background=dark
"colorscheme solarized
colorscheme molokai " https://github.com/tomasr/molokai

" Ruler and Numbers
set nu
set colorcolumn=80

" Spaces and indent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent
set smarttab
set smartindent

" Backups and Swapfile options
set nobackup
set nowritebackup
set noswapfile

" Search
set ignorecase
set smartcase
set hlsearch
set showmatch           " highlight matching [{()}]

"
set wildmenu

" ---------------------------------------------------------------------------
"  Strip all trailing whitespace in file
" ---------------------------------------------------------------------------

function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction
map ,s :call StripWhitespace ()<CR>

" ---------------------------------------------------------------------------
" File Types
" ---------------------------------------------------------------------------

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Remove trailing whitespace for python and yaml
au BufWritePre *.py :%s/\s\+$//e
au BufWritePre *.yaml :%s/\s\+$//e

au BufRead,BufNewFile *.hql        set filetype=sql
au BufRead,BufNewFile *.haml       set ft=haml
au BufRead,BufNewFile *.md         set ft=markdown tw=80 ts=2 sw=2 expandtab
au BufRead,BufNewFile *.markdown   set ft=markdown tw=80 ts=2 sw=2 expandtab
au BufRead,BufNewFile *.go         set ts=4 sw=4 sts=0 noexpandtab

au Filetype gitcommit set tw=68  spell
au Filetype ruby      set tw=80  ts=2 sw=2 sts=0

if exists('+colorcolumn')
    set colorcolumn=+1 " vertical line at `textwidth` characters
endif




" air-line
let g:airline_powerline_fonts = 1

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

"  NERDTree symbols
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

