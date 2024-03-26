set nu
set belloff=all
set mouse=a
syntax on
set rnu
set colorcolumn=81
set scrolloff=6
set ai
set si
set clipboard=unnamed
set termwinsize=10x100
set nowrap
let mapleader=" "
noremap <leader>pv :Ex<CR>

"cambia el cursor de grosor y lo resetea
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

noremap <leader>t  :bo terminal<CR>
noremap <c-n> <c-w>s
noremap <c-m> <c-w>v
"cambia los mapings para navegar entre ventanas

nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

vnoremap K : m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv


noremap <silent> <leader>w         :update<CR>
vnoremap <silent> <leader>w         :update<CR>


call plug#begin()
Plug 'preservim/nerdtree'
Plug 'bagrat/vim-buffet'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/vim-auto-save'
Plug 'mbbill/undotree'
Plug 'wadackel/vim-dogrun'
Plug 'terryma/vim-smooth-scroll'
Plug 'tpope/vim-surround'
Plug 'ap/vim-css-color'
Plug 'preservim/vim-indent-guides'
Plug 'vim-syntastic/syntastic'
Plug 'alexandregv/norminette-vim'
Plug 'justinmk/vim-syntax-extra'
Plug 'cacharle/c_formatter_42.vim'
call plug#end()

nnoremap <leader>e :NERDTreeToggle<CR>

nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)

nnoremap <silent> L :bn<CR>
nnoremap <silent> H :bp<CR>
nnoremap <Leader><Tab> :Bw<CR>
nnoremap <Leader><S-Tab> :Bw!<CR>
nnoremap <C-t> :tabnew split<CR>map <leader>0 <Plug>BuffetSwitch(10)

"cerrar ventanas
nnoremap <silent> <leader>c :q!<CR>
nnoremap <silent> <leader>o <c-w>o
nnoremap <silent> <c-k> <c-w>c

let g:buffet_show_index=1

colorscheme dogrun
nnoremap <F5> :UndotreeToggle<CR>
" persistend undoo
let vimDir = '$HOME/.vim'

if stridx(&runtimepath, expand(vimDir)) == -1
  " vimDir is not on runtimepath, add it
  let &runtimepath.=','.vimDir
endif

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

let g:c_formatter_42_set_equalprg=0
function! ToggleFormatter()
    let l:filename = expand('%:t')  " Get the name of the current file
    if l:filename == "main.c"
        let g:c_formatter_42_format_on_save=0
    else
        let g:c_formatter_42_format_on_save=1 
    endif
endfunction

" Automatically call ToggleFormatter when opening a file
autocmd BufEnter * call ToggleFormatter()

" Optionally, call ToggleFormatter when saving a file
autocmd BufWritePre * call ToggleFormatter()

