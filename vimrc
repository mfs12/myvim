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

" save undo history to file
set undodir=$HOME/.vim/undo
set undofile

" fix colours
set t_Co=256

" install modules
execute pathogen#infect()
execute pathogen#helptags()

if has("gui_running")
	set background=light
	syntax off
else
	"set background=light
	"set background=dark

	"colo dejavu
	"colo delek
	"colo montz
	"colo msz_montz
	"colo morning
	"colo themes
	colo wombat256
	"colo wombat256mod
endif

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
	let OmniCpp_LocalSearchDecl     = 1
	set completeopt=menuone,menu,longest,preview

	inoremap <expr> <C-N> omni#cpp#maycomplete#Complete()
endif

set tags=tags,tags-base

" Python mode configuration
let g:pymode_python = 'python'
let g:pymode_folding = 0

let g:loaded_racer = 1

" custom functions
function! UpdateTags()
	exec ":!ctags -R --languages=C,C++ --c++-kinds=+px --c-kinds=+px --fields=+iaS --extra=+q ."
endfunction

function! UpdateCscope()
	exec ":cs kill -1"

	if filereadable("./cscope.out")
		exec "!rm ./cscope.out"
	endif

	exec ":!cscope -b -R -s $PWD"

	if filereadable("./cscope.out")
		exec ":cs add cscope.out"
	endif
	if filereadable("./cscope-base.out")
		exec ":cs add cscope-base.out"
	endif
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

function! HandleURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ ">,;:]*')
  echo s:uri
  if s:uri != ""
	  exec "!xdg-open \'" . s:uri . "\'"
  else
	  echo "No URI found in line."
  endif
endfunction
map <Leader>w :call HandleURI()<CR>

" Key mappings
" easier window movement
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l
"map <C-g> <C-W>>
"map <C-s> <C-W><

" error file navigation
nmap cm :make<CR>
nmap cl :cl<CR>
nmap cc :cc 
nmap ck :cp<CR>
nmap cj :cn<CR>

" gitgutter nmappings
nmap mj :GitGutterNextHunk<CR>
nmap mk :GitGutterPrevHunk<CR>
nmap ms :GitGutterStageHunk<CR>
nmap mr :GitGutterRevertHunk<CR>
nmap mp :GitGutterPreviewHunk<CR>

" buffer nmappings
nmap b# :b#<CR>
nmap ba :A<CR>
nmap bl :ls<CR>

" cscope config
source $HOME/.vim/myscope.vim
