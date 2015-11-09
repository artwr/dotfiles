execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on
set background=dark
"colorscheme solarized
set colorcolumn=80
set nobackup
set hlsearch
set nowritebackup
set noswapfile
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent
set smarttab
set smartindent
set ignorecase
set smartcase
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.yaml :%s/\s\+$//e
au BufRead,BufNewFile *.hql set filetype=sql
