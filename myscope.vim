if has("cscope")
	set csprg=cscope
	set csto=0
	set cst
	set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i-
	set nocsverb
	if $CSCOPE_DB != ""
	    cs add $CSCOPE_DB
	endif
	set csverb

	let g:cscope_silent=1

	autocmd FileType c,cpp nmap fc :cs find c <C-R><C-W><CR>
	autocmd FileType c,cpp nmap fd :cs find d <C-R><C-W><CR>
	autocmd FileType c,cpp nmap fe :cs find e <C-R><C-W><CR>
	autocmd FileType c,cpp nmap ff :cs find f <C-R><C-W><CR>
	autocmd FileType c,cpp nmap fg :cs find g <C-R><C-W><CR>
	autocmd FileType c,cpp nmap fi :cs find i <C-R><C-W><CR>
	autocmd FileType c,cpp nmap fs :cs find s <C-R><C-W><CR>
	autocmd FileType c,cpp nmap ft :cs find t <C-R><C-W><CR>
endif
