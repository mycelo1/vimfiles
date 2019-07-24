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

nnoremap <Leader>2          :w<CR>
nnoremap <Leader>3          :enew<CR>
nnoremap <Leader>4          :b<Space>
nnoremap <Leader>5          :let _s=@/<Bar>:%s/\m\s\+$//e<Bar>:let @/=_s<Bar>:nohlsearch<CR>
nnoremap <Leader>6          mzyyp`zj<C-A>
nnoremap <Leader>7          ggVG<Space>
nnoremap <Leader>8          :set wrap!<CR>
nnoremap <Leader>9          "=expand('%:p')<C-M>p

nnoremap <Leader>c          :bd<CR>
nnoremap <Leader>n          :n<CR>
nnoremap <Leader>w          :w<CR>

nnoremap <Leader>sa         :wa<CR>
nnoremap <Leader>sv         :sav <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <Leader>st         :new<Bar>setlocal buftype=nofile<Bar>setlocal bufhidden=hide<Bar>setlocal noswapfile<CR>

nnoremap <Leader>k          i<CR><Esc>
nnoremap <Leader><CR>       O<Esc>
nnoremap <Leader>-          o<Esc>

nnoremap <Leader><PageUp>   :bp<CR>
nnoremap <Leader><PageDown> :bn<CR>

nnoremap <Leader>f          :e <C-R>='./**/' . expand('<cword>') . '*'<CR>
nnoremap <Leader>1f         :e <C-R>='../**/' . expand('<cword>') . '*'<CR>
nnoremap <Leader>2f         :e <C-R>='../../**/' . expand('<cword>') . '*'<CR>
nnoremap <Leader>3f         :e <C-R>='../../../**/' . expand('<cword>') . '*'<CR>

nnoremap <Leader>g          :vimgrep <C-R>='/\<' . expand('<cword>') . '\>\c/ ./**/*' . '.' . expand('%:e')<CR>
nnoremap <Leader>1g         :vimgrep <C-R>='/\<' . expand('<cword>') . '\>\c/ ../**/*' . '.' . expand('%:e')<CR>
nnoremap <Leader>2g         :vimgrep <C-R>='/\<' . expand('<cword>') . '\>\c/ ../../**/*' . '.' . expand('%:e')<CR>
nnoremap <Leader>3g         :vimgrep <C-R>='/\<' . expand('<cword>') . '\>\c/ ../../../**/*' . '.' . expand('%:e')<CR>

vnoremap <Leader>pe         :!python -c "import sys, urllib.parse; print(urllib.parse.quote_plus(sys.stdin.read().strip()));"<CR>
vnoremap <Leader>pd         :!python -c "import sys, urllib.parse; print(urllib.parse.unquote_plus(sys.stdin.read().strip()));"<CR>
vnoremap <Leader>px         :!python -c "import sys, xml.dom.minidom; print(xml.dom.minidom.parse(sys.stdin).toprettyxml().strip());"<CR>
vnoremap <Leader>pj         :!python -c "import sys, json; print(json.dumps(json.loads(sys.stdin.read()), indent='\t').strip());"<CR>

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

nnoremap <silent> <Esc>     :nohlsearch<CR>
nnoremap <silent> <Up>      gk
nnoremap <silent> <Down>    gj

tnoremap <PageUp>           :bp<CR>
tnoremap <PageDown>         :bn<CR>

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
