set guifont=Sauce\ Code\ Pro:h13
colorscheme hybrid
set shiftwidth=2
let mapleader = "-"
let g:airline_theme="jellybeans"
nnoremap <leader>ct :checktime<CR>
nnoremap <c-t> :NERDTreeToggle<CR>
"better window navigation
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
  map <C-h> <C-w>h

"Ag for searching files
  if executable('ag')
    "Use ag over grep
    set grepprg=ag\ --nogroup
    let g:grep_cmd_opts = '--line-numbers --noheading'
    " let g:ctrlp_user_command = 'ag %s -l -g \""'
    "Use ag in CtrlP for listing files. Faster than grep and respects
    ".gitignore
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --ignore ''log'' --hidden -g ""'
  endif

"bind K to search word under cursor
  nnoremap <leader>K :Ag! <C-R><C-W><CR>

" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
  let g:ctrlp_clear_cache_on_exit = 0

" Set no file limit, we are building a big project
  let g:ctrlp_max_files = 0

" Set the height of ctrlp window of results
  let g:ctrlp_max_height =  25

"This makes CtrlP faster
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Setup some default ignores
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|log)$',
    \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
     \}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version control. It also supports works with .svn, .hg, .bzr.
  let g:ctrlp_working_path_mode = 'rc'
  nnoremap <leader>. :CtrlPTag<cr>

"Go stuff
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
