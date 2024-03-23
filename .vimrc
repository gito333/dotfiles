set nu
syntax on 
set rnu
set belloff=all
set ai
set si
set wrap
set clipboard=unnamedplus
let mapleader=" "

nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
inoremap K <Esc>:m .-2<CR>==gi
inoremap J <Esc>:m .+1<CR>==gi
vnoremap K : m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv


call plug#begin()
	Plug 'cacharle/c_formatter_42.vim'
call plug#end()


call plug#end()
map <silent> <c-s> :update<CR> 
let g:c_formatter_42_set_equalprg=0
let g:c_formatter_42_format_on_save=1
" WSL yank support
let s:clip = '/mnt/c/WINDOWS/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
