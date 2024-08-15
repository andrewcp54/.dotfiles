set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

let python_highlight_all=1
syntax on
set nu

:tnoremap <Esc> <C-\><C-n>

let mapleader=" "

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Toggle nerdtree
nnoremap <silent> <C-a> :NERDTreeToggle<CR>

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

" leader key is Space
:noremap <leader>cs :,$s///gc\|1,''-&&<c-b><right><right><right><right>
nnoremap <Leader>f :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>
nnoremap <Leader>w :lua require'telescope.builtin'.live_grep(require('telescope.themes').get_dropdown({}))<cr>

set encoding=UTF-8
set guifont=Meslo\ NF
set nocompatible              " required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter',
Plug 'arcticicestudio/nord-vim'
Plug 'posva/vim-vue'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'nvie/vim-flake8'
Plug 'preservim/vimux'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'tmhedberg/SimpylFold'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()

let g:airline_theme='nord'

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" set termguicolors

colorscheme nord

" ALE settings
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'php': ['prettier'],
\   'css': ['prettier'],
\   'vue': ['prettier'],
\   'typescript': ['prettier'],
\   'python': ['autoflake', 'black']
\}
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let NERDTreeShowHidden = 1
set signcolumn=yes
set updatetime=100
highlight clear SignColumn

let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1
