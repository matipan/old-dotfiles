" Vim configuration by - Matias Pan <matias.pan26@gmail.com> -
" https://github.com/kriox26
"
" 1 -- General settings
" 2 -- GUI (Graphical user interface)
" 3 -- Searching settings(use ag - the silver searcher -)
" 4 -- Text, tabs and indentation related
" 5 -- Status line
" 6 -- Helper functions and misc
" 7 -- Mappings
" 8 -- Moving around buffers, tabs and windows

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Map leader key to -
	let mapleader = "-"

"Open vimrc while on normal mode
	nnoremap <leader>v :edit $MYVIMRC<CR>

"Vim sessions default to capturing all global options, which includes the 'runtimepath' that pathogen.vim manipulates, so turn that behavior off
	set sessionoptions-=options

"Use Vim configurations instead of Vi
	set nocompatible

"Set to autoread when a file is change from the ouside
	set autoread

"Displays lines number on the left of the screen
	set number

" keep 500 lines of command line history
	set history=500

" show the cursor position all the time
	set ruler

" display incomplete commands
	set showcmd

"Enable per-directory .vimrc files and disable unasfe commands in them
	set exrc
	"set secure

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
  " Put these in an autocmd group, so that we can delete them easily.
	  augroup vimrcEx
	  au!
  " For all text files set 'textwidth' to 120 characters.
	  autocmd FileType text setlocal textwidth=400
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
	  augroup END
	else
	+?  set autoindent		" always set autoindenting on
	endif " has("autocmd")

"Use pathogen as a plugin manager
	execute pathogen#infect()

" CTn/RL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
	inoremap <C-U> <C-G>u<C-U>

"Set mouse of terminal
	set mouse=a

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
	if &t_Co > 2 || has("gui_running")
	  syntax on
	  set hlsearch
	endif

"Enable spellchecking for markdown
	autocmd FileType markdown setlocal spell

"Use 256 color(only when terminal support it)
	set t_Co=256

"Set colorscheme, i modified the symfony colorscheme, it's not the one by
"default
	colorscheme symfony

"original molokai background
	"let g:molokai_original=1

"""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching settings
"""""""""""""""""""""""""""""""""""""""""""""""""
" Setup some default ignores
	let g:ctrlp_custom_ignore = {
		\ 'dir':  '\v[\/]\.(git|hg|svn)$',
		\ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
		 \}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version control. It also supports works with .svn, .hg, .bzr.
	let g:ctrlp_working_path_mode = 'c'

"Use The silver searcher from https://github.com/ggreer/the_silver_searcher
"for ctrlp and other searches
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
	nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" do incremental searching
	set incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text tab and indentation related
""""""""""""""""""""""""""""""""""""""""""""""""""

" allow backspacing over everything in insert mode
	set backspace=indent,eol,start

"Allows to navigate between modified buffers
	set hidden

"Set tab indent, 4 spaces
	set tabstop=4
    set	softtabstop=0
	set smarttab
	set noexpandtab
    set	shiftwidth=4

"allow to :write after each command
	set autowrite

" do not keep a backup file, it's all in github anyway
	set nobackup
	set noswapfile

"Set encoding to regular utf-8
	set encoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Always show statusline
	set laststatus=2

  let g:airline_powerline_fonts=1
"Set symbols and theme for airline status bar
	"if !exists('g:airline_symbols')
	 "let g:airline_symbols = {}
	"endif
	"let g:airline_left_sep = ''
	"let g:airline_left_alt_sep = ''
	"let g:airline_right_sep = ''
	"let g:airline_right_alt_sep = ''
	"let g:airline_symbols.branch = ''
	"let g:airline_symbols.readonly = ''
	"let g:airline_symbols.linenr = ''
	"let g:airline_symbols.paste = 'ρ'
	"let g:airline_symbols.whitespace = 'Ξ'
	"let g:airline_section_c = '%t' "type of file on section C of status line
	"let g:airline#extensions#tabline#left_sep=''
	"let g:airline#extensions#tabline#left_alt_sep=''
	let g:airline_theme= 'mkolor'

"Extensions configs for airline status bar
	let g:airline#extensions#disable_rtp_load = 1
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

""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""

	" Convenient command to see the difference between the current buffer and the
	" file it was loaded from, thus the changes you made.
	" Only define it when not defined already.
	if !exists(":DiffOrig")
	  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
			  \ | wincmd p | diffthis
	endif

	"Show highlighting groups for current word with CTRL-SHIFT-H, usefull when
	"having miss syntax highlight
	nmap <C-S-H> :call <SID>SynStack()<CR>
	function! <SID>SynStack()
		if !exists("*synstack")
			return
		endif
		echo map(synstack(line('.'),col('.')),'synIDattr(v:val, "name")')
	endfunc

	"Update vimrc on the fly, based on drew neil example at vimcasts.org
	if has("autocmd")
		autocmd bufwritepost .vimrc source $MYVIMRC
	endif

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

	" Command for openning a buffer with the output of a shell command, such as
	" ls or ruby myprogram.rb"
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
		setlocal bufhidden=wipe nobuflisted noswapfile nowrap "remove the buftype=file so that you can save the buffer into a file"
		call setline(1, 'You entered:    ' . a:cmdline)
		call setline(2, 'Expanded Form:  ' .expanded_cmdline)
		call setline(3,substitute(getline(2),'.','=','g'))
		execute '$read !'. expanded_cmdline
		"setlocal nomodifiable
		1
	endfunction

	"Set leader + rc to run the ruby program in current buffer
	nnoremap <leader>rc :Shell ruby %:t<return>

	""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" => Mappings and misc
	""""""""""""""""""""""""""""""""""""""""""""""""""""""

	"Visual mode pressing * or # searches for the current selection
	vnoremap <silent> *:call VisualSelection('f')<CR>
	vnoremap <silent> #:call VisualSelection('b')<CR>

	" Don't use Ex mode, use Q for formatting
	map Q gq

	"Toggle tagbar with LEADER + f
	nnoremap <leader>tf :TagbarToggle<return>

	"Toggle NERDTree with LEADER + n
	nnoremap <leader>nt :NERDTree<return>
	nnoremap <leader>cnt :NERDTreeClose<return>

	"Use Underline function to underline current line with =
	nnoremap <leader>un :Underline =<return>

	" toggle buffergator list of opened buffers
	nnoremap <leader>bt :BuffergatorToggle<return>

	" toggle buffergator list of opened tabs
	nnoremap <leader>tt :BuffergatorTabsToggle<return>

	"Set LEADER + q to :exit
	nnoremap <leader>q :q!<return>

	"Set LEADER + s to save the current buffer and file
	nnoremap <leader>w :w<return>

	"Set LEADER + r + n to change to relative number of lines
	nnoremap <leader>rn :set relativenumber<return>

	"Mappings for sourcing and making sessions, ss for save session and so
	" session-source
	nnoremap <leader>ss :mksession! ~/.vim/session/
	nnoremap <leader>so :source ~/.vim/session/

	"Call :StripWhitespace with <leader>sw
	nnoremap <leader>sw :StripWhitespace<return>

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

	"Override colors
	let g:gitgutter_override_sign_column_highlight = 1

	"Substitute easyclip options, map to 's' by default
	let g:EasyClipUseSubstituteDefaults=1

	" Indent when defining private, protected or public methods
	let g:ruby_indent_access_modifier_style = 'indent'

	"Set control + e to sparkup completion
	let g:sparkupExecuteMapping='<C-e>'

	" Suppress buffergator keymaps
	let g:buffergator_suppress_keymaps=1

	"Ultisnips triggers
	let g:UltiSnipsSnippetsDir = $HOME.'/.vim/bundle/vim-snippets/UltiSnips/'
	let g:UltiSnipsExpandTrigger="<c-j>"
	let g:UltiSnipsJumpForwardTrigger="<c-h>"
	let g:UltiSnipsJumpBackwardTrigger = "<c-b>"
	"let g:UltiSnipsListSnippets = "<c-h>"

	"You complete me, set global path for .ycm_extra_conf.py
	let g:ycm_global_ycm_extra_conf = $HOME.'/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
	let g:ycm_complete_in_comments = 1
	let g:ycm_seed_identifiers_with_syntax = 1
	let g:ycm_collect_identifiers_from_comments_and_strings = 1
	let g:ycm_min_num_of_chars_for_completion = 2
	let g:ycm_use_ultisnips_completer = 2
	let g:ycm_warning_symbol="⚠"
	let g:ycm_error_symbol="✗"

	"Startify header, appears only if you launch vim with no arguments
	let g:startify_custom_header = [
				\'				***************************',
				\'		   *****					       *****',
				\'		 **	  The programmers of tomorrow are   **',
				\'	   **   the wizards of the future, you are    **',
				\'	   *   gonna look like you have magic powers   *',
				\'	   **        compare to everybody else        **',
				\'		 **            -Gabe Newell-            **',
				\'		   *****					       *****',
				\'				***************************',
				\'',
				\'',
				\]

	let g:startify_session_dir = '~/.vim/session'
	let g:startify_list_order =[
				\ ['	Sessions available:'],
				\ 'sessions',
				\ ['	Recently used in current dir:'],
				\ 'dir',
				\ ['	Recently used files:'],
				\ 'files',
				\ ['	Bookmarks:'],
				\ 'bookmarks',
				\ ]
	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" => Moving around buffers, tabs and windows
	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

	"Smart move betwen windows
	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-l> <C-W>l
	map <C-h> <C-W>h

	"Use CONTROL + w instead of CONTROL + y when scrolling down
	map <C-w> <c-y><C-R>

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
