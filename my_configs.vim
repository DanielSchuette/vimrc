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


" Go-Vim remaps and settings
" disable location lists for go-vim
" let g:go_list_type = "quickfix"

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" toggle test coverage profile with <leader>c
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

" some optional go syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" call go info with <leader>i
autocmd FileType go nmap <Leader>i <Plug>(go-info)

" automatically display go info with an update time of 200ms
let g:go_auto_type_info = 1
set updatetime=100

" automatically highlight matching identifiers
let g:go_auto_sameids = 1


