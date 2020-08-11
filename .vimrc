set hlsearch
set incsearch

set tabstop=4
set softtabstop=4
set shiftwidth=4


set expandtab
set autoindent
set fileformat=unix

syntax on
set encoding=utf-8

set noswapfile 

"NERDTree
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-t> :NERDTreeToggle<CR>


set number relativenumber

set wildmode=longest,list,full
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Gruvbox
autocmd vimenter * colorscheme gruvbox 
set background=dark


set splitbelow splitright

nnoremap <C-r> :%s//g<Left><Left>
nnoremap <silent> <C-n> :tabnew<CR>

nnoremap <silent> <C-p> :vertical resize +5<CR>
nnoremap <silent> <C-m> :vertical resize -5<CR>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


nnoremap D "_d
vnoremap D "_d

imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>


noremap <Space> <S-v>
