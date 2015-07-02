" .vimrc configuration by Matias Pan - <matias.pan26@gmail.com>
" Github account: https://github.com/kriox26
"=======================================================================
"			Index
" 1 -- General settings
" 2 -- Statusbar
" 3 -- Mappings and stuff
" 4 -- Helpers and functions
" 5 -- Plugins configs
"
"=========================================================
"					General settings					 "
"=========================================================
"
"Pathogen plugin handles $RUNTIMEPATH
execute pathogen#infect()

" Set mapleader to -
let mapleader="-"

" General settings --- {{{
" do incremental searching
set incsearch
set number
set relativenumber
set hidden
set ruler
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif
colorscheme symfony
"Set tab indent, 4 spaces
set tabstop=4
set softtabstop=0
set noexpandtab
set shiftwidth=4
set smarttab
" do not keep a backup file, it's all in github anyway
set nobackup
set noswapfile
" Autocmd settings ------ {{{
if has("autocmd")
	" Enable file type detection.
	filetype on
	" Also load indent files, to automatically do language-dependent indenting.
	filetype indent on
	filetype plugin on
	filetype plugin indent on
	" Vimscript file settings ---------------------- {{{
	augroup filetype_vim
		autocmd!
		autocmd FileType vim setlocal foldmethod=marker
	augroup END
	" }}}
	augroup filetypes
		autocmd!
		autocmd FileType text setlocal textwidth=130
		autocmd FileType ruby set tabstop=4|set shiftwidth=2|set noexpandtab|set softtabstop=0
		autocmd FileType python set tabstop=4|set shiftwidth=2|set noexpandtab|set softtabstop=0
		autocmd FileType erb set tabstop=4|set shiftwidth=2|set noexpandtab|set softtabstop=0
		"Enable spellchecking for markdown
		autocmd FileType markdown setlocal spell
	augroup END
	augroup markdownb
		autocmd!
		"for changing headings when editing markdown files
		autocmd FileType markdown onoremap <buffer> ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
		autocmd FileType markdown onoremap <buffer> ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
	augroup END
	augroup sourcing_and_buffers
		autocmd!
		"Source .vimrc after writing it, reloads nvim
		autocmd bufwritepost .vimrc nested source $MYVIMRC
		"Indent .rb files before writing them
		autocmd BufWritePre *.rb :normal gg=G
		" autocmd BufRead *.rb :normal gg=G
		"Change the PWD of current window to the dir of currently opened file, only if the file is not in a /tmp folder
		autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
		" When editing a file, always jump to the last known cursor position.
		" don't do it when the mark is in the first line, that is the default
		" position when opening a file.
		autocmd BufReadPost *
					\ if line("'\"") > 1 && line("'\"") <= line("$") |
					\   exe "normal! g`\"" |
					\ endif
	augroup END
endif " has("autocmd")
" }}}
" }}}
"
"=========================================================
"					Statusbar							 "
"=========================================================
"
" Statusline configs --- {{{
set laststatus=2
" set statusline=[%n]\ %<%F\ %h%m%r%{fugitive#statusline()}\ [%M%R%H%W%Y][%{&ff}]\ \ %=\ line:%l/%L\ col:%c\ \ \ %p%%\ \ \ %P
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
			\ },
			\ 'component_function': {
			\   'fugitive': 'MyFugitive',
			\   'readonly': 'MyReadonly',
			\   'modified': 'MyModified'
			\ },
			\ }
function! MyModified()
	if &filetype == "help"
		return ""
	elseif &modified
		return "+"
	elseif &modifiable
		return ""
	else
		return ""
	endif
endfunction

function! MyReadonly()
	if &filetype == "help"
		return ""
	elseif &readonly
		return ""
	else
		return ""
	endif
endfunction

function! MyFugitive()
	return fugitive#statusline()
endfunction
" }}}
"
"=========================================================
"					Mappings and stuff 					 "
"=========================================================
"
"General use mappings --- {{{
nnoremap <leader>w :w!<return>
nnoremap <leader>q :q!<return>
"Set LEADER + t to open new tab
nnoremap <leader>tn :tabnew<return>
"Set LEADER + w to close current tab
nnoremap <leader>tc :close!<return>
"Set LEADER + d to go to next tab
nnoremap ]t :tabn<return>
"Set LEADER + a to go to previous tab
nnoremap [t :tabp<return>
"Set [b to go next buffer
nnoremap ]b :bn<return>
"Set ]b to go to previous buffer
nnoremap [b :bp<return>
"Set LEADER + b + c to close current buffer
nnoremap <leader>bc :bd!<return>
"set leader + e to open a new empty buffer
nnoremap <leader>eb :enew<return>
"Open your .nvimrc with this key map
nnoremap <leader>ev :vsplit $MYVIMRC<return>
nnoremap ; :
noremap <Down> <NOP>
noremap <Up> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
nnoremap <leader>" viw<esc>`<i"<esc>`>la"<esc>
" }}}
" Onoremaps, for creating motions --- {{{
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap il[ :<c-u>normal! F]vi[<cr>
" }}}
" Other mappings --- {{{
"set <esc> for deselect highlighted text after doing a search
nnoremap <silent> <esc>k :noh<return>
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
"Set jk to go back to normal mode when on insert mode
inoremap jk <esc>
"Disable esc to force jk, disable arroy keys also
inoremap <esc> <nop>
"control + d(down) to move current down one line, control + a(above) to move up one line
noremap <c-d> ddp
noremap <c-a> ddkP
"Upcase inner word in normal or insert mode with control + u
inoremap <c-u> <Esc>gUiw
nnoremap <c-u> gUiw
"myemail = matias.pan26@gmail.com
iabbrev myemail matias.pan26@gmail.com
"tagbar toggle for functions
nnoremap <leader>tf :TagbarToggle<return>
nnoremap <leader>ps mqA;<esc>`q
" }}}
"
"=========================================================
"					Helpers and functions				 "
"=========================================================
"
"functions to show highligting groups for current word, underline current line, and bring a shell command output to a buffer - {{{
"Show highlighting groups for current word with CTRL-SHIFT-H, usefull when having miss syntax highlight
nmap <C-S-H> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'),col('.')),'synIDattr(v:val, "name")')
endfunc

"Underlines current line with =, ", or *
function! s:Underline(chars)
	let chars = empty(a:chars) ? '=' : a:chars
	let nr_columns = virtcol('$') - 1
	let uline = repeat(chars, (nr_columns / len(chars)) + 1)
	put =strpart(uline, 0, nr_columns)
endfunction
command! -nargs=? Underline call s:Underline(<q-args>)
nnoremap <leader>u= :Underline =<return>
nnoremap <leader>u" :Underline "<return>
nnoremap <leader>u* :Underline *<return>

" Command for openning a buffer with the output of a shell command, such as ls or ruby myprogram.rb" --
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
	echo a:cmdline
	let expanded_cmdline = a:cmdline
	for part in split(a:cmdline, ' ')
		if part[0] =~ '\v[%#<]'
			let expanded_part = fnameescape(expand(part))
			let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
		endif
	endfor
	botright new
	setlocal bufhidden=wipe nobuflisted noswapfile nowrap "remove the buftype=file so that you can save the buffer into a file
	call setline(1, 'You entered:    ' . a:cmdline)
	call setline(2, 'Expanded Form:  ' .expanded_cmdline)
	call setline(3,substitute(getline(2),'.','=','g'))
	execute '$read !'. expanded_cmdline
	"setlocal nomodifiable
	1
endfunction
"Set leader + rc to run the ruby program in current buffer
nnoremap <leader>rc :Shell ruby %:t<return>
"run rake routes and show the output on a buffer
nnoremap <leader>rr :Shell rake routes<return>
"run bundle exec ruby buffer_name.rb
nnoremap <leader>rbe :Shell bundle exec ruby %:t<return>
" }}}
"
"=========================================================
"					Plugins configs 					 "
"=========================================================
"
" Plugins configs -- {{{
"Fugitive plugin keymaps for basic git operations:
nnoremap <leader>gb :Gblame<return>
nnoremap <leader>gd :Gdiff<return>
nnoremap <leader>gs :Gstatus<return>
nnoremap <leader>gc :Gcommit<return>
nnoremap <leader>gl :Glog<return>
nnoremap <leader>gw :Gwrite<return>
nnoremap <leader>ge :Gedit<return>
nnoremap <leader>gn :Gbrowse<return>
nnoremap <leader>gp :Git push<return>

"Gist plugin configs
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
nnoremap <leader>gg :Gist<return>

"Set control + e to sparkup completion
let g:sparkupExecuteMapping='<C-e>'

"set to 0 so that vim-instant-markdown doesn't open a new tab in the browser
let g:instant_markdown_autostart = 0

" Enable autopop up at startup
let g:acp_enableAtStartup = 1
"" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplete#close_popup() . "\<CR>"
	"     " For no inserting <CR> key.
	"return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Close popup by <Space>.
inoremap <expr><return> pumvisible() ? neocomplete#close_popup() : "\<return>"
" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1
" Enable omni completion.
augroup autocompletion
	autocmd!
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
	autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
augroup END
" Neosnippet configs
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

"Ag global configs, ctrlp also --- {{{
"Ag for searching files
if executable('ag')
	"Use ag over grep
	set grepprg=ag\ --nogroup
	let g:grep_cmd_opts = '--line-numbers --noheading'
	"Use ag in CtrlP for listing files. Faster than grep and respects
	".gitignore
	let g:ctrlp_user_command = 'ag %s -l -g ""'
	"ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching=0
endif

"bind K to search word under cursor
nnoremap <leader>K :Ag! <C-R><C-W><CR>
" }}}
"
" Setup some default ignores
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\v[\/]\.(git|hg|svn)$',
			\ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
			\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'c'
nnoremap <leader>. :CtrlPTag<cr>

"Set control + e to sparkup completion
let g:sparkupExecuteMapping='<C-e>'
" }}}
