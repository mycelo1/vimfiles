set nocompatible
filetype plugin indent on

set autochdir
set autoindent
set backspace=
set belloff=all
set breakindent
set completeopt=
set cpoptions+=n
set expandtab
set foldcolumn=1
set guioptions+=b
set guioptions-=T
set guioptions-=m
set hidden
set hlsearch
set ignorecase
set laststatus=2
set linebreak
set list
set listchars=tab:»\ ,nbsp:·,trail:·
set mouse=c
set nostartofline
set nrformats=hex,bin
set number
set relativenumber
set scrolloff=2
set shiftwidth=2
set shortmess+=A
set showbreak=>>
set smartcase
set smartindent
set smarttab
set softtabstop=2
set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
set tabstop=4
set textwidth=0
set virtualedit=all
set wrap

if has('win32')
  set directory=%TEMP%//
elseif has('unix')
  set directory=/tmp//
endif

behave xterm

function! EndUp(isVisual)
    if a:isVisual
      normal! gv
    endif
    while line(".") > 1 && strlen(getline(line(".")-1)) >= col(".")
      call cursor(line(".")-1, col("."))
    endwhile
endfunction

function! EndDown(isVisual)
    if a:isVisual
      normal! gv
    endif
    while line(".") < line("$") && strlen(getline(line(".")+1)) >= col(".")
      call cursor(line(".")+1, col("."))
    endwhile
endfunction

autocmd CursorHoldI * stopinsert

" vim-lion
set runtimepath^=~/vimfiles/bundle/vim-lion
silent! call repeat#set("\<Plug>LionRight", v:count)
silent! call repeat#set("\<Plug>VLionRight", v:count)
silent! call repeat#set("\<Plug>LionLeft", v:count)
silent! call repeat#set("\<Plug>VLionLeft", v:count)

" vim-abolish
set runtimepath^=~/vimfiles/bundle/vim-abolish

" ReplaceWithRegister
set runtimepath^=~/vimfiles/bundle/ReplaceWithRegister

" vim-indent-object
set runtimepath^=~/vimfiles/bundle/vim-indent-object

" bufexplorer
set runtimepath^=~/vimfiles/bundle/bufexplorer
nnoremap <silent> <C-S-F4> :ToggleBufExplorer<CR>
