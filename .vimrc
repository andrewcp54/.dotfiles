let python_highlight_all=1
syntax on
set nu

:tnoremap <Esc> <C-\><C-n>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

:noremap <leader>cs :,$s///gc\|1,''-&&<c-b><right><right><right><right>

set encoding=UTF-8
" set guifont=FiraCode:h11
set nocompatible              " required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'nvie/vim-flake8'
Plug 'preservim/vimux'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'tmhedberg/SimpylFold'
Plug 'ryanoasis/vim-devicons'
call plug#end()

colorscheme nord
let g:airline_theme='nord'

" ALE settings
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'python': ['autoflake', 'black']
\}
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
set signcolumn=yes
set updatetime=100
highlight clear SignColumn
