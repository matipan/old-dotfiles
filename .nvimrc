"Map leader key to -
	let mapleader = "-"

"Allows to navigate between modified buffers
	set hidden

"Relative number es way better for motions performance
	set relativenumber

"Reduce timeout after <ESC> is pressed
	set ttimeout
	set ttimeoutlen=20
	set notimeout

"set <esc> for deselect highlighted text after doing a search
	nnoremap <esc>k :noh<return>

" Only do this part when compiled with support for autocommands.
	if has("autocmd")
		" Enable file type detection.
		" Also load indent files, to automatically do language-dependent indenting.
		filetype plugin indent on
		filetype plugin on
		filetype on
		autocmd FileType text setlocal textwidth=130
		autocmd FileType ruby set tabstop=4|set shiftwidth=2|set noexpandtab|set smarttab|set softtabstop=0
		autocmd FileType python set tabstop=4|set shiftwidth=2|set noexpandtab|set smarttab|set softtabstop=0
		autocmd FileType erb set tabsopt=4|set shiftwidth=2|set expandtab|set smarttab|set softtabstop=0
		" When editing a file, always jump to the last known cursor position.
		" don't do it when the mark is in the first line, that is the default
		" position when opening a file.
		autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif
	endif " has("autocmd")

"Pathogen plugin handles $RUNTIMEPATH
execute pathogen#infect()

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
	if &t_Co > 2 || has("gui_running")
	  syntax on
	  set hlsearch
	endif

	colorscheme symfony

"Enable spellchecking for markdown
	autocmd FileType markdown setlocal spell

"Use 256 color(only when terminal support it)
	set t_Co=256

" Setup some default ignores
	let g:ctrlp_custom_ignore = {
		\ 'dir':  '\v[\/]\.(git|hg|svn)$',
		\ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
		 \}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version control. It also supports works with .svn, .hg, .bzr.
	let g:ctrlp_working_path_mode = 'c'

" do incremental searching
	set incsearch

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

"Set tab indent, 4 spaces
	set tabstop=4
	set softtabstop=0
	set noexpandtab
	set shiftwidth=4

" do not keep a backup file, it's all in github anyway
	set nobackup
	set noswapfile

"Always show statusline
	set laststatus=2

"airline configurations
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_theme = 'mkolor'
  	let g:airline#extensions#whitespace#enabled = 0
	let g:airline#extensions#tabline#enabled=1		"Enables plugins to appear on statusline, such as syntastic
	let g:airline#extensions#syntastic#enabled = 1 	"Enable syntastic
  	let g:airline#extensions#whitespace#enabled = 0
	let g:airline_detect_paste=1
	let g:airline_detect_syntastic=1	"set the syntastic error message on statusline
	let g:syntastic_enable_signs=1	 		"Enable signs for syntastic
	let g:syntastic_always_populate_loc_list=1 "For using :lopen or :lwindow
	let g:syntastic_auto_jump=1
	let g:syntastic_error_symbol = "✗"
	let g:syntastic_warning_symbol = "⚠ "

"set syntastic mode active at startup with certain fyletype
    let g:syntastic_mode_map = { "mode": "active",
                               \ "active_filetypes": ["ruby", "php","c","javascript","css","cpp","java","go","python"],
                               \ "passive_filetypes": [] }
	
"Update vimrc on the fly, based on drew neil example at vimcasts.org
	"if has("autocmd")
	"	autocmd bufwritepost .nvimrc source $MYNVIMRC
	"endif
	
"Change the PWD of current window to the dir of currently opened file, only
"if the file is not in a /tmp folder
	if has("autocmd")
		autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
	endif

"Underlines current line with ="
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

"Visual mode pressing * or # searches for the current selection
	vnoremap <silent> *:call VisualSelection('f')<CR>
	vnoremap <silent> #:call VisualSelection('b')<CR>

"Set LEADER + q to :exit
	nnoremap <leader>q :q!<return>

"Set LEADER + s to save the current buffer and file
	nnoremap <leader>w :w<return>

"; instead of : for command mode
	nnoremap ; :

"Set LEADER + r + n to change to relative number of lines, just because
"sometimes is better to have number instead of relative number
	nnoremap <leader>rn :set relativenumber<return>
	nnoremap <leader>nrn :set norelativenumber<return>

"For terminal mode navigation and modal editing
	tnoremap <Esc> <C-\><C-n>
	tnoremap <C-h> <C-\><C-n><C-w>h
	tnoremap <C-j> <C-\><C-n><C-w>j
	tnoremap <C-k> <C-\><C-n><C-w>k
	tnoremap <C-l> <C-\><C-n><C-w>l

"better window navigation
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

"set tt for entering Terminal mode
	nnoremap tt :terminal<return>

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
	nnoremap <leader>e :enew<return>

"Set LEADER + l + b to show current buffers
	nnoremap <leader>bl :ls<return>

"Fugitive plugin keymaps for basic git operations:
	nnoremap <leader>gb :Gblame<return>
	nnoremap <leader>gd :Gdiff<return>
	nnoremap <leader>gs :Gstatus<return>
	nnoremap <leader>gc :Gcommit<return>
	nnoremap <leader>gl :Glog<return>
	nnoremap <leader>gw :Gwrite<return>
	nnoremap <leader>ge :Gedit<return>
	nnoremap <leader>gn :Gbrowse<return>
	nnoremap <leader>gp :Gpush<return>

	"Gist plugin configs
	let g:gist_detect_filetype = 1
	let g:gist_open_browser_after_post = 1
	nnoremap <leader>gg :Gist<return>

"Maps for vim-multiple cursor
	let g:multi_cursor_next_key='<C-n>'
	let g:multi_cursor_skip_key='<C-x>'
	let g:multi_cursor_quit_key='<Esc>'
