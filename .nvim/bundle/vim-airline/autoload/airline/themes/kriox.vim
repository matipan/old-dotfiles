" a mix between leaderon and kolor theme, by Matias Pan - matias.pan26@gmail.com
" (https://github.com/kriox26/dotfiles)

let g:airline#themes#kriox#palette = {}

" Normal mode
	let s:N1 = [ '#1a1a18' , '#ffffff' , 236 , 115 ] "Mode
	let s:N2 = [ '#ffffff' , '#44403a' , 115, 238 ] "branch or directory
	let s:N3 = [ '#90a680' , '#2e2d2a' , 255, 235 ] "information
	let s:N4 = [ '#777470' , 240 ] " modified
	let g:airline#themes#kriox#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
	let g:airline#themes#kriox#palette.normal_modified = {
		  \ 'airline_c': [ '#e2e2e2' , '#4f3598' , 236     , 115      , ''     ] ,
		  \ }

" Terminal mode(for neovim only)
	let s:T1 = [ '#1a1a18' , '#ffffff' , 255 , 32 ] "Mode
	let s:T2 = [ '#ffffff' , '#44403a' , 32, 238 ] "branch or directory
	let s:T3 = [ '#90a680' , '#2e2d2a' , 255, 235 ] "information
	let s:T4 = [ '#777470' , 240 ] " modified
	let g:airline#themes#kriox#palette.terminal = airline#themes#generate_color_map(s:T1, s:T2, s:T3)
	let g:airline#themes#kriox#palette.terminal_modified = {
		  \ 'airline_c': [ '#e2e2e2' , '#4f3598' , 254     , 124      , ''     ] ,
		  \ }

" Insert mode
	let s:I1 = [ '#1a1a18' , '#1693a5' , 235 , 50 ]
	let s:I2 = [ '#515744' , '#44403a' , 50 , 238 ]
	let s:I3 = [ '#1693a5' , '#2e2d2a' , 255 , 235 ]
	let g:airline#themes#kriox#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
	let g:airline#themes#kriox#palette.insert_modified = {
		  \ 'airline_c': [ '#242322' , '#7eaefd' , 234     , 50     , ''     ] ,
		  \ }


" Visual mode
	let s:V1 = [ '#1a1a18' , '#ab3e5d' , 232 , 210 ]
	let s:V2 = [ '#000000' , '#908571' , 210 , 238 ]
	let s:V3 = [ '#ab3e5d' , '#8c7f77' , 255 , 235 ]
	let s:V4 = [ '#515744' , 210 ] " lichen
	let g:airline#themes#kriox#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
	let g:airline#themes#kriox#palette.visual_modified = {
		  \ 'airline_c': [ '#242322' , '#e6987a' , 234     , 210      , ''     ] ,
		  \ }

" Replace mode
	let s:R1 = [ '#1a1a18' , '#1693a5' , 235 , 21 ]
	let s:R2 = [ '#515744' , '#44403a' , 21 , 238 ]
	let s:R3 = [ '#1693a5' , '#2e2d2a' , 255 , 235 ]
	let g:airline#themes#kriox#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
	let g:airline#themes#kriox#palette.replace_modified = {
		  \ 'airline_c': [ '#242322' , '#7eaefd' , 234     , 21     , ''     ] ,
		  \ }

" Paste mode
	let s:PA = [ '#ab3e5d' , 161 ] " raspberry
	" let s:IA = [ s:N2[1] , s:N3[1] , s:N2[3], s:N3[3] , '' ]
	let g:airline#themes#kriox#palette.insert_paste = {
		  \ 'airline_a' : [ s:I1[0] , s:PA[0] , s:I1[2] , s:PA[1] , '' ] }

"Accents
	let g:airline#themes#kriox#palette.accents = {
		  \ 'red': [ '#ef393d' , '' , 196 , '' , '' ]
		  \ }

"Inactive mode
	let s:IA = [ '#767676' , s:N3[1] , 243 , 236 , '' ]
	let g:airline#themes#kriox#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
	let g:airline#themes#kriox#palette.inactive_modified = {
		  \ 'airline_c' : [ s:V1[1] , ''      , s:V1[3] , ''      , '' ] }
