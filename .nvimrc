" .nvimrc configuration by Matias Pan - <matias.pan26@gmail.com>
" Github account: https://github.com/kriox26
"=======================================================================
"			Index
" 1 -- General settings
" 2 -- Graphical configs
" 3 -- Search configs
" 4 -- Statusbar
" 5 -- Helpers and functions
" 6 -- Navigation keymaps
" 7 -- Other keymaps and abbrev
" 8 -- Plugins configs
"
"=========================================================
"					General settings					 "
"=========================================================
"
"Pathogen plugin handles $RUNTIMEPATH
	execute pathogen#infect()

"Map leader key to -
	let mapleader = "-"

"Open your .nvimrc with this key map
	nnoremap <leader>en :edit $MYVIMRC<return>

"Allows to navigate between modified buffers
	set hidden

"Relative number is way better for motions triggering, set number to show the
"'real' number of current line.
	set number
	set relativenumber

"Reduce timeout after <ESC> is pressed
	set ttimeout
	set ttimeoutlen=20
	set notimeout

" allow backspacing over everything in insert mode
	set backspace=indent,eol,start

"Preview => more info of completion,menuone=>when one or more results
	set completeopt=preview,menuone

"Set tab indent, 4 spaces
	set tabstop=4
	set softtabstop=0
	set noexpandtab
	set shiftwidth=4
	set smarttab

" do not keep a backup file, it's all in github anyway
	set nobackup
	set noswapfile

" Autocmd sections for specific filetypes and buffer events -------- {{{
" Only do this part when compiled with support for autocommands.
	if has("autocmd")
		" Enable file type detection.
		filetype on
		" Also load indent files, to automatically do language-dependent indenting.
		filetype indent on
		filetype plugin on
		filetype plugin indent on
		augroup filetypes
			autocmd!
			autocmd FileType text setlocal textwidth=130
			autocmd FileType ruby set shiftwidth=2
			autocmd FileType python set shiftwidth=2
			autocmd FileType erb set shiftwidth=2
			"Enable spellchecking for markdown
			autocmd FileType markdown setlocal spell
			autocmd FileType vim setlocal foldmethod=marker
		augroup END
		augroup markdownb
			autocmd!
			"for changing headings when editing markdown files
			autocmd FileType markdown onoremap <buffer> ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
			autocmd FileType markdown onoremap <buffer> ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
		augroup END
		augroup sourcing_and_buffers
			autocmd!
			"Source .nvimrc after writing it, reloads nvim
			autocmd bufwritepost .nvimrc nested source $MYVIMRC
			"syntax support for applescript files
			au! BufNewFile,BufRead *.applescript   setf applescript
			autocmd BufNewFile,BufRead *.json set ft=javascript
			"Indent .rb files before writing them
			" autocmd BufWritePre *.rb :normal gg=G
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

"=========================================================
"					Graphical configs					 "
"=========================================================
"
" colorscheme hlsearch ---- {{{
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
	if &t_Co > 2 || has("gui_running")
	  syntax on
	  set hlsearch
	endif

	colorscheme symfony

"Use 256 color(only when terminal support it)
	set t_Co=256
" }}}

"=========================================================
"					Search configs						 "
"=========================================================
"
" do incremental searching
	set incsearch

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

"=========================================================
"					Statusbar config					 "
"=========================================================
"
"Always show statusline
	set laststatus=2

"Airline and syntastic global variables setup ------------------ {{{
"airline configurations
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_theme = 'kriox'
	let g:airline#extensions#tabline#enabled=1		"Enables plugins to appear on statusline, such as syntastic
	let g:airline#extensions#syntastic#enabled = 1 	"Enable syntastic
  	let g:airline#extensions#whitespace#enabled = 0
	let g:airline_detect_syntastic=1	"set the syntastic error message on statusline
	let g:syntastic_enable_signs=1	 		"Enable signs for syntastic
	let g:syntastic_always_populate_loc_list=1 "For using :lopen or :lwindow
	let g:syntastic_auto_jump=1
	let g:syntastic_error_symbol = "✗"
	let g:syntastic_warning_symbol = "⚠ "
	nnoremap <leader>slc :lclose<return>
	nnoremap <leader>sll :lopen<return>

"set syntastic mode active at startup with certain fyletype
    let g:syntastic_mode_map = { "mode": "active",
                               \ "active_filetypes": ["ruby", "php","c","javascript","css","cpp","go","python"],
                               \ "passive_filetypes": ["java"] }
" }}}

"=========================================================
"					Functions and helpers				 "
"=========================================================
"
"functions to show highligting groups for current word, underline current line, and bring a shell command output to a buffer - {{{
"Show highlighting groups for current word with leader + f + s, usefull when having miss syntax highlight
	nmap <leader>fs :call <SID>SynStack()<CR>
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
	nnoremap <leader>rc :terminal ruby %:t<return>
	"run rake routes and show the output on a :terminal buffer
	nnoremap <leader>rr :terminal rake routes<return>
	"run bundle exec ruby buffer_name.rb
	nnoremap <leader>rbe :terminal bundle exec ruby %:t<return>
" }}}

"=========================================================
"					Navigation keymaps 					 "
"=========================================================
"
" Windows resizing, tab-buffer navigation and some other stuffs --- {{{
"Visual mode pressing * or # searches for the current selection
	vnoremap <silent> *:call VisualSelection('f')<CR>
	vnoremap <silent> #:call VisualSelection('b')<CR>

"Set LEADER + q to quit by closing all windows, if there are unsaved changes,
"it'll warn you about it
	nnoremap <leader>q :qall<return>

"Set leader + w to save the current buffer and file
	noremap <leader>w <esc>:w!<return>

"; instead of : for command mode
	nnoremap ; :

"Leader + ct is :checktime for updateing current buffer
	nnoremap <leader>ct :checktime<return>

"Maps for windows resize
	nnoremap <silent> <leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
	nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
	nnoremap <silent> <leader>] :vertical resize +5<CR>
	nnoremap <silent> <leader>[ :vertical resize -5<CR>

"For terminal mode navigation and modal editing
	tnoremap <Esc> <C-\><C-n>
	tnoremap <C-h> <C-\><C-n><C-w>h
	tnoremap <C-j> <C-\><C-n><C-w>j
	tnoremap <C-k> <C-\><C-n><C-w>k
	tnoremap <C-l> <C-\><C-n><C-w>l

"better window navigation
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
	map <C-h> <C-w>h

"set tt for entering Terminal mode, tv for vertical split, and th for
"horizontal split
	nnoremap tt :terminal<return>
	nnoremap tv :vsplit +terminal<return>
	nnoremap th :split +terminal<return>

"Netrw is an awesome replacemente of nerdtree(and faster)
	let g:netrw_liststyle=3
	let g:netrw_winsize=20
	nnoremap <leader>k :Lexplore<return>

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

"Set LEADER + l + b to show current buffers
	nnoremap <leader>bl :ls<return>
" }}}

"=========================================================
"					Other keymaps and abbrev			 "
"=========================================================
"
" Keymaps for simple things ---- {{{
"set rlt to generate c-tags on current project, excluding .git/ - pkg - only
"for rails directory
	noremap <leader>rlt :!ctags --tag-relative --extra=+f -Rf.git/tags --exclude=.git,pkg --languages=ruby,javascript,sql<CR><CR>
	nnoremap <leader>rt :!ctags --tag-relative -R --languages=ruby --exclude=.git,log<CR><CR>
	set tags+=.git/tags

"Sometimes is useful to see where the cursor is
	nnoremap <leader>cl :set cursorline!<return>

"Mappings for sourcing and making sessions, ss for save session and so
" session-source, now works with neovim
	nnoremap <leader>ss :mksession! ~/.nvim/session/
	nnoremap <leader>so :source ~/.nvim/session/

"set <esc> for deselect highlighted text after doing a search
	nnoremap <silent> <esc>k :noh<return>

"Set jk to go back to normal mode when on insert mode
	inoremap jk <esc>
	"Disable esc to force jk, disable arroy keys also
	inoremap <esc> <nop>
	noremap <Down> <NOP>
	noremap <Up> <NOP>
	noremap <Left> <NOP>
	noremap <Right> <NOP>
	inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"instead of ci) use <space>, in, il: {,(,[
	nnoremap <space> ci)
	onoremap in( :<c-u>normal! f(vi(<cr>
	onoremap il( :<c-u>normal! F)vi(<cr>
	onoremap in{ :<c-u>normal! f{vi{<cr>
	onoremap il{ :<c-u>normal! F}vi{<cr>
	onoremap in[ :<c-u>normal! f[vi[<cr>
	onoremap il[ :<c-u>normal! F]vi[<cr>

"control + d(down) to move current down one line, control + a(above) to move up one line
	noremap <c-d> ddp
	noremap <c-a> ddkP

"Upcase inner word in normal or insert mode with control + u
	inoremap <c-u> <Esc>gUiw
	nnoremap <c-u> gUiw

"myemail = matias.pan26@gmail.com
	iabbrev myemail matias.pan26@gmail.com
" }}}

"=========================================================
"					Plugins config						 "
"=========================================================
"
"keymaps, global variables definition for plugins(Fugitive, ultisnips, CtrlP, gist, multicursor, startify, etc) -- {{{
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

"Call :StripWhitespace with <leader>sw
	nnoremap <leader>sw :StripWhitespace<return>

"Ultisnips triggers
	let g:UltiSnipsSnippetsDir = $HOME.'/.nvim/bundle/vim-snippets/UltiSnips/'
	let g:UltiSnipsExpandTrigger="<c-j>"
	let g:UltiSnipsJumpForwardTrigger="<c-l>"
	let g:UltiSnipsJumpBackwardTrigger = "<c-b>"

"Gist plugin configs
	let g:gist_clip_command = 'pbcopy'
	let g:gist_detect_filetype = 1
	let g:gist_open_browser_after_post = 1
	nnoremap <leader>gg :Gist<return>

"Maps for vim-multiple cursor
	let g:multi_cursor_next_key='<C-n>'
	let g:multi_cursor_skip_key='<C-x>'
	let g:multi_cursor_quit_key='<Esc>'

" Setup some default ignores
	let g:ctrlp_custom_ignore = {
		\ 'dir':  '\v[\/]\.(git|hg|svn)$',
		\ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
		 \}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version control. It also supports works with .svn, .hg, .bzr.
	let g:ctrlp_working_path_mode = 'c'
	nnoremap <leader>. :CtrlPTag<cr>

" Indent when defining private, protected or public methods
	let g:ruby_indent_access_modifier_style = 'indent'

"For drew neils vim-textobj-rubyblock definition
	runtime macros/matchit.vim

"Set control + e to sparkup completion
	let g:sparkupExecuteMapping='<C-e>'

"Supertab configuration
    let g:SuperTabDefaultCompletionType = "context"
    let g:SuperTabMappingForward = '<tab>'

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

	let g:startify_session_dir = '~/.nvim/session'
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

"set to 0 so that vim-instant-markdown doesn't open a new tab in the browser
"automatically
	let g:instant_markdown_autostart = 0
" }}}
