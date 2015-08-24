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

	nmap fc :cs find c <C-R><C-W><CR>
	nmap fd :cs find d <C-R><C-W><CR>
	nmap fe :cs find e <C-R><C-W><CR>
	nmap ff :cs find f <C-R><C-W><CR>
	nmap fg :cs find g <C-R><C-W><CR>
	nmap fi :cs find i <C-R><C-W><CR>
	nmap fs :cs find s <C-R><C-W><CR>
	nmap ft :cs find t <C-R><C-W><CR>
endif
