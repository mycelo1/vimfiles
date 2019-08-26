set guioptions+=b
set guioptions-=T
set guioptions-=m
set guioptions-=e
set listchars=tab:»\ ,nbsp:·,trail:·

if has('win32')
	set guifont=DejaVu\ Sans\ Mono:h10
elseif has('unix')
	set guifont=DejaVu\ Sans\ Mono\ 10
endif

set lines=40 columns=120
color desert
set cursorline
highlight CursorLine guibg=gray30
autocmd InsertEnter * highlight CursorLine gui=underline guibg=gray20
autocmd InsertLeave * highlight CursorLine gui=NONE guibg=gray30

nnoremap <F2>               :w<CR>
nnoremap <F3>               :enew<CR>
nnoremap <F4>               :b<Space>
nnoremap <F7>               ggVG<Space>

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
nnoremap <A-F7>             :set fileencoding=latin1<CR>
nnoremap <A-F8>             :set fileencoding=utf-8<CR>

nnoremap <A-S-F7>           :set encoding=latin1<CR>
nnoremap <A-S-F8>           :set encoding=utf-8<CR>

nnoremap <C-S-F3>           :new<Bar>setlocal buftype=nofile<Bar>setlocal bufhidden=hide<Bar>setlocal noswapfile<CR>
nnoremap <C-S-F5>           :%g/^\s*$/d<CR>
nnoremap <C-S-F9>           :let @+=expand("%:p")<CR>
inoremap <C-S-F9>           <C-R>=expand("%:p")<CR>
nnoremap <C-S-F11>          :%y+<CR>

nnoremap <silent> <Esc>     :nohlsearch<CR>
nnoremap <C-_>              o<Esc>
nnoremap <C-CR>             O<Esc>
nnoremap <C-K>              i<CR><Esc>

nnoremap <C-PageUp>         :bp<CR>
nnoremap <C-PageDown>       :bn<CR>
nnoremap <C-S-PageUp>       :tabprevious<CR>
nnoremap <C-S-PageDown>     :tabnext<CR>

nnoremap <S-Tab>            <C-O>
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
