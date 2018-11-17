set nocompatible
filetype plugin indent on
syntax on

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

if has("gui_running")
  if has('win32')
    set guifont=DejaVu\ Sans\ Mono:h10
  elseif has('unix')
    set guifont=DejaVu\ Sans\ Mono\ 10
  endif
  behave xterm
  set lines=40 columns=120
  color desert
  set cursorline
  highlight CursorLine guibg=gray30
  autocmd InsertEnter * highlight CursorLine gui=underline guibg=gray20
  autocmd InsertLeave * highlight CursorLine gui=NONE guibg=gray30
else
  colors blue
  set nocursorline
  autocmd InsertEnter * set cursorline
  autocmd InsertLeave * set nocursorline
endif

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

nnoremap <F2>               :w<CR>
nnoremap <F3>               :enew<CR>
nnoremap <F4>               :b<Space>

nnoremap <C-F2>             :wa<CR>
nnoremap <C-F4>             :bd<CR>
nnoremap <C-F5>             :let _s=@/<Bar>:%s/\m\s\+$//e<Bar>:let @/=_s<Bar>:nohlsearch<CR>
nnoremap <C-F6>             mzyyp`zj<C-A>
nnoremap <C-F8>             :set wrap!<CR>
nnoremap <C-F9>             "=expand('%:p')<C-M>p
nnoremap <C-F10>            :let @z=@"<Bar>let @"=@+<Bar>let @+=@z<CR>

nnoremap <S-F2>             :sav <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <S-F4>             <C-^>

nnoremap <A-F2>             :set shiftwidth-=1<Bar>:set softtabstop-=1<Bar>:set softtabstop?<CR>
nnoremap <A-F3>             :set shiftwidth+=1<Bar>:set softtabstop+=1<Bar>:set softtabstop?<CR>
nnoremap <A-F4>             :retab<CR>
nnoremap <A-F5>             :if exists("g:syntax_on")<Bar>syntax off<Bar>else<Bar>syntax enable<Bar>endif<CR>
nnoremap <A-F7>             :set fileencoding=latin1<Bar>:set encoding=latin1<CR>
nnoremap <A-F8>             :set fileencoding=utf-8<Bar>:set encoding=utf-8<CR>

nnoremap <C-S-F3>           :new<Bar>setlocal buftype=nofile<Bar>setlocal bufhidden=hide<Bar>setlocal noswapfile<CR>
nnoremap <C-S-F9>           :let @+=expand("%:p")<CR>
inoremap <C-S-F9>           <C-R>=expand("%:p")<CR>
nnoremap <C-S-F11>          :%y+<CR>

nnoremap <C-_>              o<Esc>
nnoremap <C-K>              i<CR><Esc>

nnoremap <silent> <Esc>     :nohlsearch<CR>
nnoremap <C-PageDown>       :bn<CR>
nnoremap <C-PageUp>         :bp<CR>
nnoremap <S-TAB>            <C-O>

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

cmap     <S-Insert>         <C-R>+
inoremap <S-Insert>         <C-R>+
nnoremap <C-S-Insert>       "+gp
nnoremap <S-Insert>         "+gP
vnoremap <C-Insert>         "+y
vnoremap <S-Del>            "+x

nnoremap <M-Up>             <C-Y>
nnoremap <M-Down>           <C-E>
nnoremap <M-Left>           zh
nnoremap <M-Right>          zl

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

nnoremap <silent> <Up>      gk
nnoremap <silent> <Down>    gj

" vim-lion
set runtimepath^=~/vimfiles/bundle/vim-lion
silent! call repeat#set("\<Plug>LionRight", v:count)
silent! call repeat#set("\<Plug>VLionRight", v:count)
silent! call repeat#set("\<Plug>LionLeft", v:count)
silent! call repeat#set("\<Plug>VLionLeft", v:count)

" vim-buftabline
set runtimepath^=~/vimfiles/bundle/vim-buftabline

" vim-abolish
set runtimepath^=~/vimfiles/bundle/vim-abolish

" ReplaceWithRegister
set runtimepath^=~/vimfiles/bundle/ReplaceWithRegister

" vim-indent-object
set runtimepath^=~/vimfiles/bundle/vim-indent-object
