function! UpdateTags()
	exec ":silent !ctags -R --languages=C,C++ --c++-kinds=+px --c-kinds=+px --fields=+iaS --extra=+q ."

	exec ":silent cs kill -1"

	if filereadable("./cscope.out")
		exec "silent !rm ./cscope.out"
	endif

	exec ":silent !cscope -b -R -s $PWD"

	if filereadable("./cscope.out")
		exec ":silent cs add cscope.out"
	endif
	if filereadable("./cscope-base.out")
		exec ":silent cs add cscope-base.out"
	endif
	exec ":redraw!"
endfunction

function! UpdateGoTags()
	exec ":!find . -name '*.go' -exec gotags {} \+ > tags"
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

function! Spell(lang)
	if a:lang == "off"
		set nospell
		set spelllang=
	elseif a:lang == "en"
		set spell
		set spelllang=en
	elseif a:lang == "de"
		set spell
		set spelllang=de
	else
		set spell
		set spelllang=a:lang
	endif
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
  let s:uri = matchstr(getline("."), '[a-z]\+:[^ ">,;:]\+')
  echo s:uri
  if s:uri != ""
	  exec "!xdg-open \"" . s:uri . "\""
  else
	  echo "No URI found in line."
  endif
endfunction

