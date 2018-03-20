set nocompatible
filetype plugin indent on
syntax on

set autoindent
set backspace=
set belloff=all
set breakindent
set completeopt=
set cpoptions+=n
set expandtab
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
set nrformats=alpha,hex
set number
set relativenumber
set scrolloff=2
set shiftwidth=2
set shortmess+=A
set showbreak=»»
set smartcase
set smartindent
set smarttab
set softtabstop=2
set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
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

function! SelectIndent ()
  let v_indent=indent(line("."))
  while (indent(line(".")-1) >= v_indent) || (prevnonblank(line(".")-1) < (line(".")-1))
    exe "normal k"
  endwhile
  exe "normal V"
  while (indent(line(".")+1) >= v_indent) || (nextnonblank(line(".")+1) > (line(".")+1))
    exe "normal j"
  endwhile
endfun

autocmd CursorHoldI * stopinsert

nnoremap <A-F2>           :set shiftwidth-=1<Bar>:set softtabstop-=1<Bar>:set softtabstop?<CR>
nnoremap <A-F3>           :set shiftwidth+=1<Bar>:set softtabstop+=1<Bar>:set softtabstop?<CR>
nnoremap <A-F5>           :if exists("g:syntax_on")<Bar>syntax off<Bar>else<Bar>syntax enable<Bar>endif<CR>
nnoremap <A-F7>           :set fileencoding=latin1<Bar>:set encoding=latin1<CR>
nnoremap <A-F8>           :set fileencoding=utf-8<Bar>:set encoding=utf-8<CR>

nnoremap <C-F4>           :bd<CR>
nnoremap <C-F5>           :let _s=@/<Bar>:%s/\m\s\+$//e<Bar>:let @/=_s<Bar>:nohlsearch<CR>
nnoremap <C-F6>           mzyyp`zj<C-A>
nnoremap <C-F7>           :call SelectIndent()<CR>
nnoremap <C-F8>           :set wrap!<CR>
inoremap <C-F9>           <C-R>=expand("%:p")<CR>
nnoremap <C-F9>           "=expand('%:p')<C-M>p
nnoremap <C-S-F9>         :let @+=expand("%:p")<CR>
nnoremap <C-F10>          :let @z=@"<Bar>let @"=@+<Bar>let @+=@z<CR>
nnoremap <C-S-F10>        :let @"=@0<CR>

nnoremap <C-PageDown>     :bn<CR>
nnoremap <C-PageUp>       :bp<CR>
nnoremap <TAB>            W
nnoremap <S-TAB>          B

nnoremap <Leader><CR>     :nohlsearch<CR>
nnoremap <Leader>e        :e <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <Leader>w        :e <C-R>=expand('%:p:h') . '/' . expand('<cword>')<CR>
nnoremap <Leader>n        :enew<CR>
nnoremap <Leader>s        :sav <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <Leader>r        :%s/\<<C-R>=expand('<cword>')<CR>\>//g<Left><Left>

cnoremap %%               <C-R>=expand('%:h') . '/'<CR>
cnoremap $$               <C-R>=expand('%:t')<CR>
nnoremap K                i<CR><Esc>
nnoremap <M-k>            :help <C-R>=expand('<cword>')<CR><CR>
nnoremap <M-i>            i<Space><Esc>
vnoremap $                g_

cmap     <S-Insert>       <C-R>+
inoremap <S-Insert>       <C-R>+
nnoremap <C-S-Insert>     "+gp
nnoremap <S-Insert>       "+gP
vnoremap <C-Insert>       "+y
vnoremap <S-Del>          "+x

imap <Up>                 <NOP>
imap <Down>               <NOP>
imap <PageUp>             <NOP>
imap <PageDown>           <NOP>

imap <C-Up>               <NOP>
imap <C-Down>             <NOP>
imap <C-PageUp>           <NOP>
imap <C-PageDown>         <NOP>

imap <M-Up>               <NOP>
imap <M-Down>             <NOP>
imap <M-PageUp>           <NOP>
imap <M-PageDown>         <NOP>

imap <S-Up>               <NOP>
imap <S-Down>             <NOP>
imap <S-PageUp>           <NOP>
imap <S-PageDown>         <NOP>

noremap <silent> <Up>     gk
noremap <silent> <Down>   gj

silent! call repeat#set("\<Plug>LionRight", v:count)
silent! call repeat#set("\<Plug>VLionRight", v:count)
silent! call repeat#set("\<Plug>LionLeft", v:count)
silent! call repeat#set("\<Plug>VLionLeft", v:count)
