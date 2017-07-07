"(New-Object Net.WebClient).DownloadFile("https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim", $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("~\vimfiles\autoload\plug.vim"))
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin()
  Plug 'tommcdo/vim-lion'
  Plug 'rust-lang/rust.vim'
call plug#end()

set nocompatible
filetype plugin indent on
syntax on
au CursorHoldI * stopinsert

set autoindent
set breakindent
set backspace=
set belloff=all
set completeopt=
set expandtab
set hidden
set hlsearch
set ignorecase
set laststatus=2
set linebreak
set list
set listchars=tab:»\ ,nbsp:·,trail:·
set nowrap
set nrformats=alpha,hex
set number
set relativenumber
set scrolloff=2
set shiftwidth=2
set smartcase
set smartindent
set smarttab
set softtabstop=2
set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
set textwidth=0
set virtualedit=all
set wrapmargin=0

if has("gui_running")
  if has('win32')
    set guifont=DejaVu\ Sans\ Mono:h10
  elseif has('unix')
    set guifont=DejaVu\ Sans\ Mono\ 10
  endif
  behave xterm
  colors desert
  set lines=40 columns=120
  set cursorline
else
  colors ron
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

nnoremap <A-F2>           :set shiftwidth-=1<Bar>:set softtabstop-=1<Bar>:set softtabstop?<CR>
nnoremap <A-F3>           :set shiftwidth+=1<Bar>:set softtabstop+=1<Bar>:set softtabstop?<CR>
nnoremap <A-F5>           :if exists("g:syntax_on")<Bar>syntax off<Bar>else<Bar>syntax enable<Bar>endif<CR>
nnoremap <A-F7>           :set fileencoding=latin1<Bar>:set encoding=latin1<CR>
nnoremap <A-F8>           :set fileencoding=utf-8<Bar>:set encoding=utf-8<CR>
nnoremap <A-F9>           :let @i=@h<Bar>let @h=@g<Bar>let @g=@f<Bar>let @f=@e<Bar>let @e=@d<Bar>let @d=@c<Bar>let @c=@b<Bar>let @b=@a<Bar>let @a=@"<CR>
nnoremap <A-F10>          :let @z=@"<Bar>let @"=@+<Bar>let @+=@z<CR>

nnoremap <C-F4>           :bd<Bar><CR>
nnoremap <C-F5>           :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap <C-F6>           mzyyp`zj<C-A>
nnoremap <C-F7>           :call SelectIndent()<CR>
inoremap <C-F9>           <C-R>=expand("%:p")<CR>

nnoremap <C-PageDown>     :bn<Bar><CR>
nnoremap <C-PageUp>       :bp<Bar><CR>

nnoremap <Leader><CR>     :noh<CR>
nnoremap <Leader>e        :e <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <Leader>w        :e <C-R>=expand('<cword>')<CR>
nnoremap <Leader>n        :enew<CR>
nnoremap <Leader>s        :sav <C-R>=expand('%:p:h') . '/'<CR>

nnoremap K                i<CR><Esc>

cmap     <S-Insert>       <C-R>+
nnoremap <C-S-Insert>     "+gp
nnoremap <S-Insert>       "+gP
vnoremap <C-Insert>       "+y
vnoremap <S-Del>          "+x

nnoremap <A-1>            :let @a=@"<CR>
nnoremap <A-2>            :let @b=@"<CR>
nnoremap <A-3>            :let @c=@"<CR>
nnoremap <A-4>            :let @d=@"<CR>
nnoremap <A-5>            :let @e=@"<CR>
nnoremap <A-6>            :let @f=@"<CR>
nnoremap <A-7>            :let @g=@"<CR>
nnoremap <A-8>            :let @h=@"<CR>
nnoremap <A-9>            :let @i=@"<CR>

nnoremap <Leader>1        :let @"=@a<CR>
nnoremap <Leader>2        :let @"=@b<CR>
nnoremap <Leader>3        :let @"=@c<CR>
nnoremap <Leader>4        :let @"=@d<CR>
nnoremap <Leader>5        :let @"=@e<CR>
nnoremap <Leader>6        :let @"=@f<CR>
nnoremap <Leader>7        :let @"=@g<CR>
nnoremap <Leader>8        :let @"=@h<CR>
nnoremap <Leader>9        :let @"=@i<CR>

inoremap <Down>           <NOP>
inoremap <End>            <NOP>
inoremap <Home>           <NOP>
inoremap <PageDown>       <NOP>
inoremap <PageUp>         <NOP>
inoremap <Up>             <NOP>

