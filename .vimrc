set hlsearch




set incsearch

set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartcase
set nobackup
set undodir=~/.vim/undodir
set undofile



set expandtab
set autoindent
set fileformat=unix
set nocompatible



syntax on
set encoding=utf-8

set noswapfile 

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'christoomey/vim-system-copy'
Plug 'https://github.com/ycm-core/YouCompleteMe'
Plug 'https://github.com/lukhio/vim-mapping-conflicts'


call plug#end()

"YCM
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 1 


"NERDTree
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-t> :NERDTreeToggle<CR>
:let g:NERDTreeWinSize=20
" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p

set number relativenumber

set wildmode=longest,list,full
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Gruvbox
autocmd vimenter * colorscheme gruvbox 


set background=dark



set splitbelow splitright
nnoremap <C-r> :%s//g<Left><Left>
nnoremap <silent> <Esc><Esc> :let @/=""<CR>



nnoremap <S-Left> <C-w>h
nnoremap <S-Right> <C-w>l


nnoremap D "_d
vnoremap D "_d



nnoremap <Space> <S-v>
nnoremap <Tab> i<Tab>

 
nnoremap <silent> - :vertical resize +5<CR>
nnoremap <silent> + :vertical resize -5<CR>
nnoremap * <C-u>
nnoremap _ <C-d>

nmap <C-n> <S-Left>ma
nmap <C-r> <S-Left>mdy
nnoremap <CR> i
nnoremap e $
nnoremap E A
