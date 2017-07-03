"(New-Object Net.WebClient).DownloadFile("https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim", $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("~\vimfiles\autoload\plug.vim"))
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin()
  Plug 'bling/vim-airline'
  Plug 'tommcdo/vim-lion'
  Plug 'vim-scripts/plsql.vim--Lysyonok'
  Plug 'rust-lang/rust.vim'
call plug#end()

filetype plugin indent on
syntax on
au CursorHoldI * stopinsert

let g:airline#extensions#tabline#enabled = 21
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#buffer_min_count = 2
autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

set autoindent
set breakindent
set backspace=start
set belloff=all
set expandtab
set hidden
set hlsearch
set ignorecase
set laststatus=2
set linebreak
set list
set listchars=tab:»\ ,nbsp:·,trail:·
set nocompatible
set nowrap
set number
set relativenumber
set scrolloff=2
set shiftwidth=2
set smartcase
set softtabstop=2
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

inoremap <F9>             <C-R>=expand("%:p")<CR>
nnoremap <C-F4>           :bd<Bar><CR>
nnoremap <C-PageDown>     :bn<Bar><CR>
nnoremap <C-PageUp>       :bp<Bar><CR>
nnoremap <F2>             :set shiftwidth=2<Bar>:set softtabstop=2<Bar><CR>
nnoremap <F3>             :set shiftwidth=3<Bar>:set softtabstop=3<Bar><CR>
nnoremap <F4>             :set shiftwidth=4<Bar>:set softtabstop=4<Bar><CR>
nnoremap <F5>             :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap <F7>             :set fileencoding=latin1<Bar>:set encoding=latin1<Bar><CR>
nnoremap <F8>             :set fileencoding=utf-8<Bar>:set encoding=utf-8<Bar><CR>
nnoremap <Leader>e        :e <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <Leader>s        :sav <C-R>=expand('%:p:h') . '/'<CR>
nnoremap K                i<CR><Esc>

cmap     <S-Insert>       <C-R>+
nnoremap <C-S-Insert>     "+gp
nnoremap <S-Insert>       "+gP
vnoremap <C-Insert>       "+y
vnoremap <S-Del>          "+x

inoremap <Down>           <NOP>
inoremap <End>            <NOP>
inoremap <Home>           <NOP>
inoremap <Left>           <NOP>
inoremap <PageDown>       <NOP>
inoremap <PageUp>         <NOP>
inoremap <Right>          <NOP>
inoremap <Up>             <NOP>

inoremap <A-Down>         <NOP>
inoremap <A-End>          <NOP>
inoremap <A-Home>         <NOP>
inoremap <A-Left>         <NOP>
inoremap <A-PageDown>     <NOP>
inoremap <A-PageUp>       <NOP>
inoremap <A-Right>        <NOP>
inoremap <A-Up>           <NOP>

inoremap <A-S-Down>       <NOP>
inoremap <A-S-End>        <NOP>
inoremap <A-S-Home>       <NOP>
inoremap <A-S-Left>       <NOP>
inoremap <A-S-PageDown>   <NOP>
inoremap <A-S-PageUp>     <NOP>
inoremap <A-S-Right>      <NOP>
inoremap <A-S-Up>         <NOP>

inoremap <C-Down>         <NOP>
inoremap <C-End>          <NOP>
inoremap <C-Home>         <NOP>
inoremap <C-Left>         <NOP>
inoremap <C-PageDown>     <NOP>
inoremap <C-PageUp>       <NOP>
inoremap <C-Right>        <NOP>
inoremap <C-Up>           <NOP>

inoremap <C-S-Down>       <NOP>
inoremap <C-S-End>        <NOP>
inoremap <C-S-Home>       <NOP>
inoremap <C-S-Left>       <NOP>
inoremap <C-S-PageDown>   <NOP>
inoremap <C-S-PageUp>     <NOP>
inoremap <C-S-Right>      <NOP>
inoremap <C-S-Up>         <NOP>

inoremap <C-A-Down>       <NOP>
inoremap <C-A-End>        <NOP>
inoremap <C-A-Home>       <NOP>
inoremap <C-A-Left>       <NOP>
inoremap <C-A-PageDown>   <NOP>
inoremap <C-A-PageUp>     <NOP>
inoremap <C-A-Right>      <NOP>
inoremap <C-A-Up>         <NOP>

inoremap <C-S-A-Down>     <NOP>
inoremap <C-S-A-End>      <NOP>
inoremap <C-S-A-Home>     <NOP>
inoremap <C-S-A-Left>     <NOP>
inoremap <C-S-A-PageDown> <NOP>
inoremap <C-S-A-PageUp>   <NOP>
inoremap <C-S-A-Right>    <NOP>
inoremap <C-S-A-Up>       <NOP>

inoremap <S-Down>         <NOP>
inoremap <S-End>          <NOP>
inoremap <S-Home>         <NOP>
inoremap <S-Left>         <NOP>
inoremap <S-PageDown>     <NOP>
inoremap <S-PageUp>       <NOP>
inoremap <S-Right>        <NOP>
inoremap <S-Up>           <NOP>

