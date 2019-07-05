syntax on

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
nnoremap <C-S-F9>           :let @+=expand("%:p")<CR>
inoremap <C-S-F9>           <C-R>=expand("%:p")<CR>
nnoremap <C-S-F11>          :%y+<CR>

nnoremap <C-_>              o<Esc>
nnoremap <C-CR>             O<Esc>
nnoremap <C-K>              i<CR><Esc>

nnoremap <silent> <Esc>     :nohlsearch<CR>
nnoremap <C-PageDown>       :bn<CR>
nnoremap <C-PageUp>         :bp<CR>
nnoremap <S-Tab>            <C-O>

nnoremap <Leader>sa         :wa<CR>
nnoremap <Leader>sv         :sav <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <Leader><Tab>      O<Esc>

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

silent! vunmap <C-X>
