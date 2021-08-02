"autosave on text change (doesn't work with Nerdtree)
"autocmd TextChanged,TextChangedI * silent write

"au BufWritePost $MYVIMRC source $MYVIMRC 
set backspace=indent,eol,start
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug '907th/vim-auto-save'

Plug 'tikhomirov/vim-glsl'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'mbbill/undotree'

Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'zhaohuaxishi/auto-header'

Plug 'ryanoasis/vim-devicons'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


Plug 'honza/vim-snippets'

Plug 'scrooloose/nerdcommenter'

Plug 'itchyny/lightline.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

Plug 'unkiwii/vim-nerdtree-sync'

"Plug 'morhetz/gruvbox'
"Plug 'flazz/vim-colorschemes'
"Plug 'atelierbram/vim-colors_atelier-schemes'
Plug 'tomasiser/vim-code-dark'

Plug 'urso/haskell_syntax.vim'


"Plug 'eddyekofo94/gruvbox-material.nvim'

" Initialize plugin system
call plug#end()

" enable AutoSave on Vim startup
let g:auto_save = 1  

"undo
nnoremap <F5> :UndotreeToggle<CR>

let g:airline_powerline_fonts = 1

"haskell
syntax on
filetype plugin indent on
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
"let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
"let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
"let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
"let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
"let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
"let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

"ejs
autocmd BufWritePre *.ejs :setfiletype html



" open NERDTree automatically
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree

let g:NERDTreeGitStatusWithFlags = 1
let g:nerdtree_sync_cursorline = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
"autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p


vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]



set relativenumber


set hlsearch




set incsearch

set nobackup
set undodir=~/.vim/undodir
set undofile
set noswapfile 

set encoding=utf-8



set wildmode=longest,list,full

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab
colorscheme codedark

"colorscheme Atelier_SulphurpoolLight
"colorscheme Atelier_DuneDark
"colorscheme badwolf
"colorscheme gruvbox-material
"colorscheme molokai

"colorscheme seoul256

" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap jk <ESC>
inoremap Jk <ESC>
inoremap jK <ESC>
inoremap JK <ESC>
inoremap JAK <ESC>
nmap <C-m> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gb :e#<CR>

" Use K to show documentation in preview window
nnoremap <silent> <C-k> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"jump to parent brackets
nnoremap <silent> <space>f  $%
vnoremap <silent> <space>f  $%










set splitbelow splitright

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> <Down> (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> <Up> (v:count == 0 ? 'gk' : 'k')
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')



"empty search buffer
nnoremap <silent> <Esc> :let @/=""<CR>


nnoremap <Space> <S-v>
nnoremap ; :

"jump between buffers
nnoremap <S-h> <C-w>h
nnoremap <S-l> <C-w>l 
"find a file
nnoremap <silent> <C-f> :FZF<CR>
"resize buffers
nnoremap <silent> ö :vertical resize +5<CR>
nnoremap <silent> ä :vertical resize -5<CR>
"faster jump
nnoremap K <C-u>
nnoremap J <C-d>
vnoremap K <C-u>
vnoremap J <C-d>
"search for word under cursor
nnoremap <C-s> *

"go to end of line
nnoremap e $
"select all
map <C-a> <esc>ggVG<CR>
"copy to clipboard
noremap <S-y> "+y
"delete to void
nnoremap <S-d> "_dd<Esc>
vnoremap <S-d> "_dd<Esc>

"nnoremap <silent> <C-n> :w<CR>:exe 'e myFile-'.strftime("%Y-%m-%d-%H:%M:%S")'.html'<CR>
nnoremap <silent> <C-n> :w<CR>:e 

inoremap <M-BS> <C-w>
noremap <C-h> b
noremap <C-l> w

noremap <S-b> bi

noremap <C-y> v$"+y

map Ü :! pdflatex %<CR>
map S :! mupdf $(echo % \| sed 's/tex$/pdf/') & disown <CR><CR>
