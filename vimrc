syntax on
set tabstop=8
set smartindent
set incsearch
set hlsearch
"set hid " change buffer without saving

" disable automatic linewrapping when typing
set textwidth=0 
" show airline from the beginning
set laststatus=2

set wildmenu
set wildmode=list:longest,full

" colours
"colo dejavu
"colo morning
colo delek

"set background=light
set background=dark

set ignorecase
set smartcase

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

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

set nocp
filetype plugin on 

"let g:pydiction_location = '~/.vim/after/ftplugin/pydiction/complete-dict'

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

function! UpdateTags()
	execute "rm -f tags"
"	execute ":!ctags -R --languages=C,C++ --c++-kinds=+gpx --c-kinds=+gpx --fields=+iaS --extra=+q ./"
	execute ":!ctags -R --languages=C,C++ --c++-kinds=+defgmpstuv --c-kinds=+defgmpstuv --fields=+iaS --extra=+q ./"
endfunction

function! MyFormat()
	set tabstop=8 shiftwidth=8 noexpandtab
endfunction

function! MobisolFormat()
	set tabstop=4 shiftwidth=4 expandtab
endfunction

function! UpdateWebTags()
	execute ":!ctags -R --languages=JavaScript,HTML ./"
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

"set tags=./tags,~/.vim/tags/host_tags;
set tags=tags,host_tags

"source /usr/share/vim/vim73/ftplugin/man.vim

" new stuff
execute pathogen#infect()

