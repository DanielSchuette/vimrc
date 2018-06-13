set number
set relativenumber
set textwidth=250
nnoremap <Space> i<Space><Right><ESC>
nmap <S-Enter> O<ESC>
nmap <CR> o<ESC>k

set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

" I remapped :q to <leader>qq in the basic .vimrc file
" some additional changes are in that file as well (e.g. color scheme)

" remap <ESC> to <leader>nn
inoremap <leader>nn <ESC>

