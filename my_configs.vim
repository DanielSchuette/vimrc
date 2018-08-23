" some general configs
" some additional modifications are made to the basic.vim file as well (e.g. color scheme)
set number
set relativenumber
set textwidth=0 wrapmargin=0 "disable physical line wrapping


" display indentation guides
"set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:× 

nnoremap <Space> i<Space><Right><ESC>
nmap <S-Enter> O<ESC>
nmap <CR> o<ESC>k

set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim


" remap <ESC> to <leader>nn
inoremap <leader>nn <ESC>

" Fast quitting
nmap <leader>qq :q<cr>

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

" Ale linter configs
" Set `ale_fix_on_save' to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" Enable completion where available.
let g:ale_completion_enabled = 1

" Enable auto-completion using github.com/maralla/completor.vim
let g:completor_gocode_binary = '/Users/daniel/Documents/GitHub/go/src/github.com/nsf/gocode/'
let g:completor_python_binary = '/Library/Frameworks/Python.framework/Versions/3.7/bin/python3'
