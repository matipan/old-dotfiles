let mapleader="-"
set number
" Statusline configs --- {{{
set laststatus=2
"set statusline=%f        " Path to the file
"set statusline+=%m
"set statusline+=%=        " Switch to the right side
"set statusline+=%l        " Current line
"set statusline+=/         " Separator
"set statusline+=%L        " Total lines
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
set statusline=[%n]\ %<%F\ \ \ [%M%R%H%W%Y][%{&ff}]\ \ %=\ line:%l/%L\ col:%c\ \ \ %p%%\ \ \ @%{strftime(\"%H:%M:%S\")}
" }}}
" do incremental searching
set incsearch
set relativenumber
set hidden
set ruler
syntax on
colorscheme last256
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
		autocmd bufwritepost .vimrc source $MYVIMRC
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
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
inoremap jk <esc>
inoremap <esc> <nop>
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
" }}}
