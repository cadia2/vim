"===============================
" Basic Settings & Vundle Setup
"===============================
set nocompatible              " Required
filetype off                  " Required before initializing plugins

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" List your plugins here:
Plugin 'vim-scripts/indentpython.vim'
Plugin 'neoclide/coc.nvim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All plugins must be added before this line
call vundle#end()            " Required
filetype plugin indent on    " Enable filetype detection and indentation

"===============================
" General Settings
"===============================
set encoding=utf-8
syntax on
set clipboard=unnamed

" Enable Hybrid Line Numbers
set number          " Show absolute number for the current line
set relativenumber  " Show relative numbers for all other lines

" Auto-toggle to absolute numbers in Insert mode for clarity
augroup HybridNumber
  autocmd!
  autocmd InsertEnter * set norelativenumber   " Absolute numbers in Insert mode
  autocmd InsertLeave * set relativenumber     " Relative numbers in Normal mode
augroup END



" Split window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"aesthetic
let python_highlight_all=1
syntax on

"Color Sceme
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme industry
endif

"===============================
" Python-Specific Settings
"===============================
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Virtualenv support (if you have virtualenv.py)
if has("python")
    pyfile ~/.vim/python/virtualenv.py
endif
if has("python3")
    py3file ~/.vim/python/virtualenv.py
    py3 sys.path.insert(0, '/Users/chrisandreopoulos/coding/data_analysis/lib/python3.13/site-packages')
endif

"===============================
" Terminal & Miscellaneous Mappings
"===============================
" Map <leader>t to open a terminal on the right side
nnoremap <leader>t :rightbelow vert term<CR>

"===============================
" Color Scheme & Appearance
"===============================
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

" If you have the togglebg plugin, map F5 to toggle background colors
if exists("*togglebg#map")
  call togglebg#map("<F5>")
endif
