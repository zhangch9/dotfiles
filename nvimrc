" General
if &compatible
  set nocompatible
endif
let mapleader = ","
let maplocalleader = ";"
let RUNTIME_HOME = $HOME . '/.config/nvim'
let VIM_PLUG_PATH = RUNTIME_HOME . '/autoload/plug.vim'
let VIM_PLUG_URL =
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

" vim-plug automatic installation
if !filereadable(VIM_PLUG_PATH)
  silent execute
      \ '!curl -fLo ' . VIM_PLUG_PATH . ' --create-dirs ' . VIM_PLUG_URL
  au VimEnter * PlugInstall | source $MYVIMRC
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
Plug 'neomake/neomake'
Plug 'easymotion/vim-easymotion'
" autocompletion
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'zchee/deoplete-jedi'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
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

" neomake
let g:neomake_open_list = 2
let g:neomake_list_height = 1
let g:neomake_python_pylint_exe =
    \ fnamemodify(g:python3_host_prog, ':p:h') . '/pylint'
let g:neomake_python_enabled_makers = ['pylint']
call neomake#configure#automake('nrw')

" deoplete
let g:deoplete#enable_at_startup = 1

" snippets
" TODO
"let g:UltiSnipsExpandTrigger = '<Tab>'
"let g:UltiSnipsJumpForwardTrigger = '<C-b>'
"let g:UltiSnipsJumpBackwardTrigger = '<C-z>'

" appearance
set fileformat=unix
set number
set relativenumber
highlight ColorColumn ctermbg=darkgrey
" search
set ignorecase
set smartcase

" key mappings
noremap <Leader>n :NERDTreeToggle<CR>
noremap <Leader>ev :split $MYVIMRC<CR>
noremap <Leader>sv :source $MYVIMRC<CR>
" search in VISUAL mode
xnoremap <leader>/ <Esc>/\%V

" C/Cpp/Java/Scala
au FileType c,cpp,java,scala setl et cin tw=80 cc=+0 ts=2 sw=2 fdm=syntax

" Python
au FileType python setl et tw=80 cc=+0 ts=4 fdm=indent

" Shell/Vim Scripts
au FileType sh,vim setl et tw=80 cc=+0 ts=2

