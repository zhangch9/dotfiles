" General
if &compatible
  set nocompatible
endif
set t_Co=256
let RUNTIME_HOME = $HOME . '/.vim'
let VIM_PLUG_PATH = RUNTIME_HOME . '/autoload/plug.vim'
let VIM_PLUG_URL =
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

" vim-plug automatic installation
if !filereadable(VIM_PLUG_PATH)
  silent execute
      \ '!curl -fLo ' . VIM_PLUG_PATH . ' --create-dirs ' . VIM_PLUG_URL
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" vim-plug configuration
call plug#begin(RUNTIME_HOME . '/bundle')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
call plug#end()

" Plugin Settings
" dracula
syntax on
let g:dracula_italic = 0
let g:airline_theme='dracula'
color dracula

" vim-airline
let g:airline#extensions#tabline#enabled = 1

" nerdtree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter *
    \ if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd BufEnter *
    \ if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) |
    \ q | endif

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhiteSpace = 1
let g:NERDToggleCheckAllLines = 1


" defaults in neovim
set nobackup
set noundofile
let SWAP_DIR = $HOME . '/.local/share/vim/swap'
if !isdirectory(SWAP_DIR)
  call mkdir(SWAP_DIR, 'p')
endif
let &directory = SWAP_DIR . '//'
filetype plugin indent on
set autoindent
set autoread
set backspace=indent,eol,start
" set backupdir
set belloff=all
set complete-=i
set cscopeverbose
" set direcotry=
set display=lastline
set encoding=utf-8
" set fillchars
set nofsync
set formatoptions=tcqj
set history=10000
set hlsearch
set incsearch
set langnoremap
set laststatus=2
set listchars=tab:>\ ,trail:-,nbsp:+
set nrformats=bin,hex
set ruler
set sessionoptions-=options
set shortmess+=F
set showcmd
set sidescroll=1
set smarttab
set tabpagemax=50
" set tags
set ttimeoutlen=50
set ttyfast
" set undodir
set viminfo+=!
set wildmenu


set fileencodings=ucs-bom,utf-8,default,latin1
set fileformat=unix
set number
set relativenumber
set wrap
set showmatch
set shiftround
set scrolloff=15
set switchbuf=usetab,newtab
highlight ColorColumn ctermbg=darkgrey
" search
set ignorecase
set smartcase

let mapleader = ","
let maplocalleader = ";"

" edit and source vimrc
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>c :set cursorline! cursorcolumn!<CR>
" search in VISUAL mode
xnoremap <leader>/ <Esc>/\%V

" C/Cpp/Java/Scala
au FileType c,cpp,java,scala setl et cin tw=80 cc=+0 ts=2 sw=2 fdm=syntax

" Python
au FileType python setl et tw=80 cc=+0 ts=4 fdm=indent

" Shell/Vim Scripts
au FileType sh,vim setl et tw=80 cc=+0 ts=2

" Tex
au FileType tex setl cindent
au FileType tex setl expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType tex setl spell spelllang=en_us


" Others
autocmd FileType php,proto setl cindent textwidth=80 colorcolumn=+0
autocmd FileType html,php,proto setl expandtab
autocmd FileType php setl tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType html,proto setl tabstop=2 softtabstop=2 shiftwidth=2
