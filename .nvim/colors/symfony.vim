" Vim color file
" Maintainer: Matias Pan <matias.pan26 at gmail dot com>
" Last Change: 2015 May 15
" Version: 1.0.0

highlight clear
if exists("syntax_on")
 syntax reset
endif

let g:colors_name = "symfony"
set background=dark
"15
highlight Normal ctermfg=253 ctermbg=235 guifg=#ffffff guibg=#222222

" Search
highlight IncSearch ctermfg=0 ctermbg=80 guifg=#000000 guibg=#ffff00
highlight Search ctermfg=80 ctermbg=240 guifg=#000000 guibg=#c0c000

" Messages
highlight ErrorMsg ctermfg=80 ctermbg=240 guifg=White guibg=Red
highlight WarningMsg ctermfg=196 guifg=Red
highlight ModeMsg cterm=bold gui=bold
highlight MoreMsg cterm=bold ctermfg=72 gui=bold guifg=SeaGreen
highlight Question cterm=bold ctermfg=46 gui=bold guifg=Green

" Split area area
highlight StatusLine cterm=bold,reverse gui=bold,reverse
highlight StatusLineNC ctermfg=238 ctermbg=238 cterm=reverse gui=reverse
highlight VertSplit ctermfg=23 ctermbg=238 cterm=none
"highlight WildMenu ctermfg=0 ctermbg=226 guifg=Black guibg=Yellow
highlight WildMenu  ctermfg=0 ctermbg=80 cterm=none

" Diff
highlight DiffAdd ctermfg=254 ctermbg=71 guifg=#E6E1DC guibg=#519F50
highlight DiffDelete ctermfg=240 ctermbg=234 guifg=#303030 guibg=#1c1c1c
highlight DiffChange ctermbg=52 guibg=#600000
highlight DiffText ctermfg=254 ctermbg=124 guifg=#E6E1DC guibg=#b00000

" Cursor
highlight CursorColumn ctermbg=241 guibg=Grey40
highlight CursorLine ctermbg=0 cterm=none guibg=#000000
highlight CursorLineNR ctermfg=115 cterm=bold guibg=#000000
highlight Cursor ctermfg=0 ctermbg=15 guifg=#000000 guibg=#FFFFFF
highlight lCursor ctermfg=15 ctermbg=235 guifg=bg guibg=fg

" Fold
highlight Folded ctermfg=115 ctermbg=237 guifg=#333333 guibg=DarkGrey
highlight FoldColumn ctermfg=236 ctermbg=250 guifg=#333333 guibg=Grey

" Popup Menu Menu
highlight Pmenu           ctermfg=251     ctermbg=234     cterm=none
highlight PmenuSel        ctermfg=0       ctermbg=111     cterm=none
highlight PmenuSbar       ctermfg=206     ctermbg=235     cterm=none
highlight PmenuThumb      ctermfg=235     ctermbg=206     cterm=none

" Syntax group
" Statement use to have 208 without bold
highlight Comment ctermfg=243 guifg=#bd48b3
highlight Constant ctermfg=74 guifg=#6D9CBE
highlight Error ctermfg=124 ctermbg=235 guifg=#FFC66D guibg=#990000
highlight Identifier ctermfg=75 guifg=#6D9CBE
highlight Ignore ctermbg=235 guifg=bg
highlight PreProc ctermfg=254 guifg=#E6E1DC
highlight Special ctermfg=115 guifg=#ffcc66
highlight Statement ctermfg=198 cterm=bold ctermbg=235 guifg=#ff8400 guibg=bg
highlight Todo ctermfg=80 ctermbg=none cterm=bold guifg=Blue guibg=Yellow
highlight Type ctermfg=167 cterm=bold guifg=#da4939
highlight Underlined cterm=underline ctermfg=111 gui=underline guifg=#80a0ff
highlight String ctermfg=205 guifg=#99ff00
highlight Number ctermfg=105 guifg=#A5C261
highlight Define ctermfg=221 guifg=#ffcc66
highlight Function ctermfg=42 guifg=#ffcc66
highlight Include ctermfg=173 cterm= bold guifg=#CC7833
highlight Keyword ctermfg=221 guifg=#ffcc66
highlight Operator ctermfg=105 guifg=#f0f0f0
highlight PreCondit ctermfg=173 guifg=#CC7833
highlight StorageClass ctermfg=221 guifg=#ffcc66

"Spelling
"highlight SpellBad cterm=undercurl ctermfg=88 gui=undercurl guifg=#D70000
"highlight SpellCap cterm=underline ctermfg=240 gui=underline guifg=#D0D0FF
"highlight SpellLocal cterm=undercurl gui=undercurl
"highlight SpellRare cterm=underline ctermfg=168 gui=underline guifg=#D75F87
highlight Conceal         ctermfg=251     ctermbg=none    cterm=none
highlight SpellBad        ctermfg=168     ctermbg=240    cterm=underline
highlight SpellCap        ctermfg=115      ctermbg=none    cterm=underline
highlight SpellRare       ctermfg=121     ctermbg=none    cterm=underline
highlight SpellLocal      ctermfg=186     ctermbg=none    cterm=underline

" Other
highlight Directory ctermfg=51 guifg=Cyan
highlight LineNr ctermfg=244 ctermbg=234 guifg=#2B2B2B guibg=#C0C0FF
highlight NonText ctermfg=239 ctermbg=235 guifg=#505050 guibg=#222222
highlight SpecialKey ctermfg=51 guifg=Cyan
highlight Title cterm=bold ctermfg=15 gui=bold guifg=#FFFFFF
highlight Visual ctermbg=238 guibg=#5A647E
highlight MatchParen ctermfg=80 ctermbg=240 guifg=#FFFFFF guibg=#005f5f
highlight SignColumn      ctermfg=244     ctermbg=234     cterm=none
"highlight SignColumn ctermfg=51 ctermbg=234 guifg=Cyan guibg=Grey
highlight Structure ctermfg=221 guifg=#ffcc66
highlight TabLineFill cterm=reverse gui=reverse
highlight TabLine cterm=underline ctermbg=248 gui=underline guibg=DarkGrey
highlight TabLineSel cterm=bold gui=bold
highlight VisualNOS cterm=bold,underline gui=bold,underline
highlight htmlEndTag ctermfg=114 ctermbg=none cterm=none
highlight xmlEndTag ctermfg=114 ctermbg=none cterm=none
highlight ExtraWhitespace ctermbg=60
highlight Colorcolumn ctermbg=240
highlight GitGutterAdd ctermfg=35 ctermbg=234
highlight GitGutterChange ctermfg=190 ctermbg=234
highlight GitGutterRemove ctermfg=196 ctermbg=234
highlight GitGutterChangeDelete ctermfg=80 ctermbg=234

" Links
highlight link Macro PreProc
highlight link Exception Statement
highlight link Conditional Statement
highlight link Repeat Statement
highlight link Label Statement
highlight link Boolean Constant
highlight link Float Number
highlight link Character Constant
highlight link Typedef Type
highlight link Tag Special
highlight link SpecialChar Special
highlight link Delimiter Special
highlight link SpecialComment Special
highlight link Debug Special

" vim:ff=unix:
