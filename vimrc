syntax on
set tabstop=8
set autoindent
set smartindent
set cindent
set incsearch
set hlsearch
" change buffer without saving
"set hid

set cscopetag

" disable automatic linewrapping when typing
set textwidth=0
" show airline from the beginning
set laststatus=2

set wildmenu
set wildmode=list:longest,full
"set wildmode=list:longest,list

" save undo history to file
set undodir=$HOME/.vim/.undo
set undofile

" fix colours
set t_Co=256

set nocompatible
set ignorecase
set smartcase

set tags=tags,tags-base

set nospell
set spelllang=en,de

filetype plugin on
filetype indent on

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

let mapleader = ","

" Taglist configuration
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_WinWidth = 50
nnoremap TT :TlistToggle<CR>

" UltiSnips configuration
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsListSnippets = "<c-l>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

set completeopt=menuone,menu,longest,preview

let g:clang_library_path='/usr/lib/libclang.so'
let g:clang_complete_auto=1
let g:clang_complete_copen=1
let g:clang_complete_macros=1
"let g:clang_complete_lib_flags=1
"let g:clang_complete_patterns=1

" Python mode configuration
let g:pymode = 1
let g:pymode_python = 'python'
let g:pymode_folding = 0
let g:pymode_rope_goto_definition_cmd = 'e'

" Rust racer configuration
let g:racer_cmd = "/usr/bin/racer"
let $RUST_SRC_PATH="/usr/src/rust/src"
let g:racer_experimental_completer = 1

" gitgutter configuration
nmap mj :GitGutterNextHunk<CR>
nmap mk :GitGutterPrevHunk<CR>
nmap ms :GitGutterStageHunk<CR>
nmap mr :GitGutterRevertHunk<CR>
nmap mp :GitGutterPreviewHunk<CR>

" Key mappings easier window movement
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l
"map <C-g> <C-W>>
"map <C-s> <C-W><

" error file navigation
nmap cm :make all -j20<CR>
nmap cl :cl<CR>
nmap cc :cc
nmap ck :cp<CR>
nmap cj :cn<CR>

" buffer nmappings
nmap b# :b#<CR>
nmap ba :A<CR>
nmap bl :ls<CR>

" cscope config
source $HOME/.vim/myscope.vim " custom functions
source $HOME/.vim/myfunc.vim " custom functions

map <Leader>t :call UpdateTags()<CR>
map <Leader>w :call HandleURI()<CR>
