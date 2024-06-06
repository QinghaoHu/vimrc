lua require('init')
set nobackup
set noswapfile
set nocompatible
set encoding=utf-8
set backspace=2

func! Run()
    exec "w"
    exec "sp"
    exec "resize 10"
	if &filetype == "cpp"
		exec "term g++ -O2 -std=c++17 -Wall -Wfatal-errors % -o %<"
	elseif &filetype == "cc"
		exec "term g++ -O2 -std=c++17 -Wall -Wfatal-errors % -o %<"
	elseif &filetype == "java"
		exec "term javac %"
    elseif &filetype == "python"
        exec "term python3 %"
    else 
        exec ":terminal"
	endif
endfunc

func! Mode()
	exec "w"
	if &filetype == "cpp"
		exec "w"
		exec "sp"
		exec "resize 10"
		exec "term ./%<"
	elseif &filetype == "java"
		exec "w"
		exec "sp"
		exec "resize 10"
		exec "term java %<"
	elseif &filetype == "cc"
		exec "w"
		exec "sp"
		exec "resize 10"
		exec "term ./%<"
	endif
endfunc

noremap <F9> :call Run()<CR>
noremap <F11> :call Mode()<CR>

noremap <F8> :!cp /home/qinghaoh/Templates/code/c++/Template.cpp 
noremap <F3> :Trouble diagnostics toggle<CR>
noremap <C-a> ggVG
noremap <F10> :cd %:p:h<CR>:sp<CR>:resize 10<CR>:terminal<CR>
tnoremap <Esc> <C-\><C-n>
noremap <C-s> :w<CR>

colorscheme kanagawa
" colorscheme gruvbox
" colorscheme gruvbox8_hard
" colorscheme solarized8_flat
" colorscheme tokyonight-night
" colorscheme onedark
" colorscheme tokyonight-moon
" colorscheme monokai-pro-octagon
" colorscheme monokai-pro-default
" colorscheme monokai-pro-classic
" colorscheme monokai-pro-ristretto
" colorscheme monokai-pro-machine
" colorscheme base16-google-dark
" colorscheme base16-kanagawa
" colorscheme base16-tokyo-night-terminal-light
" colorscheme base16-gruvbox-material-light-dark
" colorscheme base16-windows-10-light
set background=dark
" set background=light
" colorscheme base16-onedark
" set background=light
" colorscheme solarized8_flat
" colorscheme tokyonight-stor
" colorscheme kanagawa-lotus
" colorscheme monokai-pro-octagon
"colorscheme vscode


set number
set signcolumn=number

sign define meow numhl=something
sign place 2 line=1 name=meow

set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar

colorscheme
