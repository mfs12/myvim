syntax on
set tabstop=8
set autoindent
set smartindent
set cindent
set incsearch
set hlsearch
" change buffer without saving
"set hid

" disable automatic linewrapping when typing
set textwidth=0
" show airline from the beginning
set laststatus=2

set wildmenu
set wildmode=list:longest,full
"set wildmode=list:longest,list

" fix colours
set t_Co=256

" install modules
execute pathogen#infect()
execute pathogen#helptags()

" colour themes
"colo dejavu
"colo morning
"colo delek
colo wombat256mod

"set background=light
set background=dark

set ignorecase
set smartcase

set nocompatible
filetype plugin on
filetype indent on

let mapleader = ","

" Taglist variables
" Display function name in status bar:
let g:ctags_statusline=1
" Automatically start script
let generate_tags=1
" Displays taglist results in a vertical window:
let Tlist_Use_Horiz_Window=0
" Shorter commands to toggle Taglist display
nnoremap TT :TlistToggle<CR>
map <F4> :TlistToggle<CR>
" Various Taglist diplay config:
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1

set nocompatible
filetype plugin on

"let g:pydiction_location = '~/.vim/after/ftplugin/pydiction/complete-dict'

" OmniCompletion configuration
if v:version >= 700
"	set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
	let OmniCpp_GlobalScopeSearch   = 1
	let OmniCpp_DisplayMode         = 0
	let OmniCpp_NamespaceSearch     = 2
	let OmniCpp_ShowScopeInAbbr     = 1 "do not show namespace in pop-up
	let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
	let OmniCpp_ShowAccess          = 1 "show access in pop-up
	let OmniCpp_SelectFirstItem     = 0 "select first item in pop-up
	let OmniCpp_MayCompleteDot      = 1
	let OmniCpp_MayCompleteArrow    = 1
	let OmniCpp_MayCompleteScope    = 0
	let OmniCpp_LocalSearchDecl     = 0
	set completeopt=menuone,menu,longest,preview

	inoremap <expr> <C-N> omni#cpp#maycomplete#Complete()
endif

set tags=tags,tags-base

" Python mode configuration
let g:pymode_python = 'python'
let g:pymode_folding = 0

" custom functions
function! UpdateTags()
"	execute ":!rm -f tags"
"	execute ":!ctags -R --languages=C,C++ --c++-kinds=+gpx --c-kinds=+gpx --fields=+iaS --extra=+q ./"
	execute ":!ctags -R --languages=C,C++ --c++-kinds=+defgmpstuv --c-kinds=+defgmpstuv --fields=+iaS --extra=+q ./"
endfunction

function! UpdateGoTags()
	execute ":!find . -name '*.go' -exec gotags {} \+ > tags"
endfunction

function! UpdateWebTags()
	execute ":!ctags -R --languages=JavaScript,HTML ./"
endfunction

function! FormatMy()
	set tabstop=8 shiftwidth=8 noexpandtab
endfunction

function! FormatPython()
	set tabstop=4 shiftwidth=4 expandtab
endfunction

function! FormatMobisol()
	set tabstop=4 shiftwidth=4 expandtab
endfunction

function! FormatSb()
	set tabstop=2 shiftwidth=2 expandtab
endfunction

function! SpellOnEn()
	set spell
	set spelllang=en
endfunction

function! SpellOnDe()
	set spell
	set spelllang=de
endfunction

function! SpellOff()
	set nospell
	set spelllang=
endfunction

function! CleanEol()
	%s/\( \|\t\)\+$//
endfunction

function! TagsAvr()
	set tags=tags,tags-avr
endfunction

function! TagsArm()
	set tags=tags,tags-arm
endfunction

function! TagsHost()
	set tags=tags,tags-host
endfunction

function! IndentLinux()
"-nbad -bap -nbc -bbo -hnl -br -brs -c33 -cd33 -ncdb -ce -ci4
"-cli0 -d0 -di1 -nfc1 -i8 -ip0 -l80 -lp -npcs -nprs -npsl -sai
"-saf -saw -ncs -nsc -sob -nfca -cp33 -ss -ts8 -il1
endfunction

" Key mappings
" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-g> <C-W>>
map <C-s> <C-W><

" convience mappings to jumb through make output
map <F5> :cp<CR>
map <F6> :cn<CR>

" Update Cscope database
" Update Ctags database
" Set format mobisol, solarboard or mine
" Clean EOLs
"
