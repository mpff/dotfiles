runtime! archlinux.vim

"------------
"  vim-plug
"------------

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'majutsushi/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
" General auto completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Python auto completion
Plug 'davidhalter/jedi-vim'
" R auto completion
"Plug 'jalvesaq/Nvim-R'

call plug#end()

"--------------------
"  General Settings
"--------------------

" Syntax Highlighting
if has("syntax")
    syntax on"
endif

set encoding=utf8
set background=dark
set t_Co=256                " enable 256 colors in vim

" Looks
set number relativenumber   " hybrid line numbers
set wildmenu                " show menu over commandline
set showcmd		    " Show (partial) command in status line.
set showmatch		    " Show matching brackets.
set ignorecase		    " Do case insensitive matching
set smartcase		    " Do smart case matching
set incsearch		    " Incremental search
set hidden		    " Hide buffers when they are abandoned
set history=100             " by default Vim saves yoour last 8 commands. We can handle more than this.
set laststatus=2
set timeoutlen=50           " no timeout when leaving insert mode

" Tabs
set expandtab
set shiftwidth=4
set softtabstop=4
" Indentation
set autoindent
filetype plugin indent on
" Line wrapping
set textwidth=79
set breakindent
let &showbreak='> '
set breakindentopt=shift:2,min:20

" mappings
set mouse=a		    " Enable mouse usage (all modes)
set backspace=indent,eol,start  " del and backspace work
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Uncomment the following to have Vim jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"-------------------
"  Plugin settings
"-------------------

let g:gruvbox_italic=1
let g:gruvbox_termcolors=256
colorscheme gruvbox
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = "badwolf"
let g:jedi#completions_enabled = 0

"-------------
"  FileTypes
"-------------

autocmd FileType tex setlocal shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType r setlocal shiftwidth=4 softtabstop=4 textwidth=80
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 textwidth=80

"---------
"  Fixes
"---------

" Transparent Background
hi NonText ctermbg=none
hi Normal guibg=NONE ctermbg=NONE

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
