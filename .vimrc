execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on


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

" airline symbols

