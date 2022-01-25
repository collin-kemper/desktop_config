call plug#begin()
  Plug 'racer-rust/vim-racer'
  Plug 'neomake/neomake'
  Plug 'ziglang/zig.vim'
call plug#end()

" neomake configuration
" call neomake#configure#automake('w')
" let g:neomake_open_list = 2

" racer configuration
set hidden
let g:racer_cmd="/home/ck/.cargo/bin/racer"
augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
    autocmd FileType rust nmap <buffer> <leader>gD <Plug>(rust-doc-tab)
augroup END

" other configuration
set backspace=indent,eol,start

syntax on

set encoding=utf-8
set termencoding=utf-8

set autoindent
set copyindent
set shiftround
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2
set tabstop=2

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set number
set textwidth=80

set hlsearch
set incsearch

"disable backup
set nobackup
set noswapfile

"set full color support
set termguicolors

"line wrapping
set wrap
set linebreak
set nolist
set display=lastline

"writing and coding modes
noremap <silent> <Leader>w :call ToggleMode()<CR>
function ToggleMode()
  if &textwidth == 0
    echo "Code ON"
    syntax on
    set spell!
    set textwidth=80
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! nunmap <buffer> k 
    silent! nunmap <buffer> j 
    silent! nunmap <buffer> 0 
    silent! nunmap <buffer> $ 
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Write ON"
    syntax off
    set spell spelllang=en_us
    set textwidth=0
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    noremap  <buffer> <silent> k gk
    noremap  <buffer> <silent> j gj
    noremap  <buffer> <silent> 0 g0
    noremap  <buffer> <silent> $ g$
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction
