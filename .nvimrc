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

" do incremental searching
	set incsearch

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
