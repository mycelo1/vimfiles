syntax on
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
set fileencoding=
set fileencodings=ucs-bom,latin1,utf-8,default
set foldcolumn=1
set foldmethod=marker
set hidden
set hlsearch
set ignorecase
set laststatus=2
set linebreak
set list
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
autocmd FileType * setlocal indentexpr=

nnoremap <Leader>1          :nohlsearch<CR>
nnoremap <Leader>2          :w<CR>
nnoremap <Leader>3          :enew<CR>
nnoremap <Leader>4          :b<Space>
nnoremap <Leader>5          :let _s=@/<Bar>:%s/\m\s\+$//e<Bar>:let @/=_s<Bar>:nohlsearch<CR>
nnoremap <Leader>6          mzyyp`zj<C-A>
nnoremap <Leader>7          ggVG
nnoremap <Leader>8          :set wrap!<CR>
inoremap <Leader>9          <C-R>=expand("%:p")<CR>

nnoremap <Leader>d          :bd<CR>
nnoremap <Leader>D          :bd!<CR>
nnoremap <Leader><Leader>D  :%bw!<CR>
nnoremap <Leader>n          :n<CR>
nnoremap <Leader>w          :w<CR>
nnoremap <Leader>l          viwu<Esc>
nnoremap <Leader>u          viwU<Esc>

nnoremap <Leader>sa         :wa<CR>
nnoremap <Leader>sv         :sav <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <Leader><Leader>t  :new<Bar>setlocal buftype=nofile<Bar>setlocal bufhidden=hide<Bar>setlocal noswapfile<CR>

nnoremap <Leader>el         :edit ++encoding=latin1<CR>
nnoremap <Leader>eu         :edit ++encoding=utf-8<CR>
nnoremap <Leader>sl         :write ++encoding=latin1<CR>:edit ++encoding=latin1<CR>
nnoremap <Leader>su         :write ++encoding=utf-8<CR>:edit ++encoding=utf-8<CR>
nnoremap <Leader>sb         :set bomb!<CR>

nnoremap <Leader>k          i<CR><Esc>
nnoremap <Leader><CR>       O<Esc>
nnoremap <Leader>-          o<Esc>

nnoremap <Leader><PageUp>   :bp<CR>
nnoremap <Leader><PageDown> :bn<CR>

nnoremap <Leader>tn         :tabnew<CR>
nnoremap <Leader>tc         :tabclose<CR>
nnoremap <Leader>to         :tabonly<CR>
nnoremap <Leader>t]         :tabnext<CR>
nnoremap <Leader>t[         :tabprevious<CR>

nnoremap <Leader>f          :e <C-R>='./**/' . expand('<cword>') . '*'<CR>
nnoremap <Leader>1f         :e <C-R>='../**/' . expand('<cword>') . '*'<CR>
nnoremap <Leader>2f         :e <C-R>='../../**/' . expand('<cword>') . '*'<CR>
nnoremap <Leader>3f         :e <C-R>='../../../**/' . expand('<cword>') . '*'<CR>

nnoremap <Leader>g          :vimgrep <C-R>='/\<' . expand('<cword>') . '\>\c/ ./**/*' . '.' . expand('%:e')<CR>
nnoremap <Leader>1g         :vimgrep <C-R>='/\<' . expand('<cword>') . '\>\c/ ../**/*' . '.' . expand('%:e')<CR>
nnoremap <Leader>2g         :vimgrep <C-R>='/\<' . expand('<cword>') . '\>\c/ ../../**/*' . '.' . expand('%:e')<CR>
nnoremap <Leader>3g         :vimgrep <C-R>='/\<' . expand('<cword>') . '\>\c/ ../../../**/*' . '.' . expand('%:e')<CR>

cnoremap %%                 <C-R>=expand('%:h') . '/'<CR>
cnoremap $$                 <C-R>=expand('%:t')<CR>
vnoremap $                  g_

nnoremap [l                 :call EndUp(0)<CR>
vnoremap [l                 :call EndUp(1)<CR>
nnoremap ]l                 :call EndDown(0)<CR>
vnoremap ]l                 :call EndDown(1)<CR>

nnoremap [q                 :cprev<CR>
nnoremap ]q                 :cnext<CR>
nnoremap [Q                 :cfirst<CR>
nnoremap ]Q                 :clast<CR>

nnoremap <silent> <Up>      gk
nnoremap <silent> <Down>    gj

nnoremap <C-W><PageUp>      :bp<CR>
nnoremap <C-W><PageDown>    :bn<CR>

tnoremap <PageUp>           :bp<CR>
tnoremap <PageDown>         :bn<CR>

nmap          <C-W>+        <C-W>+<SID>ws
nmap          <C-W>-        <C-W>-<SID>ws
nn    <script><SID>ws+      <C-W>+<SID>ws
nn    <script><SID>ws-      <C-W>-<SID>ws
nmap          <SID>ws       <Nop>

imap <Up>                   <NOP>
imap <Down>                 <NOP>
imap <PageUp>               <NOP>
imap <PageDown>             <NOP>

imap <C-Up>                 <NOP>
imap <C-Down>               <NOP>
imap <C-PageUp>             <NOP>
imap <C-PageDown>           <NOP>

imap <M-Up>                 <NOP>
imap <M-Down>               <NOP>
imap <M-PageUp>             <NOP>
imap <M-PageDown>           <NOP>

imap <S-Up>                 <NOP>
imap <S-Down>               <NOP>
imap <S-PageUp>             <NOP>
imap <S-PageDown>           <NOP>

silent! vunmap <C-X>

if has('win32')
  set runtimepath^=~/vimfiles/bundle/vim-lion
  set runtimepath^=~/vimfiles/bundle/vim-abolish
  set runtimepath^=~/vimfiles/bundle/ReplaceWithRegister
  set runtimepath^=~/vimfiles/bundle/vim-indent-object
  set runtimepath^=~/vimfiles/bundle/bufexplorer
elseif has('unix')
  set runtimepath^=~/.vim/bundle/vim-lion
  set runtimepath^=~/.vim/bundle/vim-abolish
  set runtimepath^=~/.vim/bundle/ReplaceWithRegister
  set runtimepath^=~/.vim/bundle/vim-indent-object
  set runtimepath^=~/.vim/bundle/bufexplorer
endif
"
" vim-lion
silent! call repeat#set("\<Plug>LionRight", v:count)
silent! call repeat#set("\<Plug>VLionRight", v:count)
silent! call repeat#set("\<Plug>LionLeft", v:count)
silent! call repeat#set("\<Plug>VLionLeft", v:count)

" bufexplorer
nnoremap <Leader><Leader>b  :ToggleBufExplorer<CR>
