let mapleader = ","

" Vundle config {{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Themes
Bundle 'twilight'
Bundle 'jellybeans.vim'
Bundle 'herald.vim'
Bundle 'Zenburn'
Bundle 'Mustang2'
Bundle 'badwolf'
Bundle 'darktango.vim'
Bundle 'ironman.vim'
Bundle 'Atom'
Bundle 'w0ng/vim-hybrid'
Bundle 'jonathanfilip/lucius'
Bundle 'altercation/vim-colors-solarized'

" Plugins
Bundle 'surround.vim'
Bundle 'localvimrc'
Bundle 'ctrlp.vim'
Bundle 'mbbill/undotree'
Bundle 'repeat.vim'
Bundle 'NrrwRgn'
Bundle 'tpope/vim-commentary'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'bufexplorer.zip'
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-lastpat'
Bundle 'kana/vim-textobj-entire'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'tpope/vim-abolish'
Bundle 'leshill/vim-json'
Bundle 'tracwiki'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-obsession'
Bundle 'tpope/vim-tbone'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Bundle 'christoomey/vim-tmux-navigator'

if has('gui_running')
  Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
  Bundle 'xolox/vim-notes'
endif

filetype plugin indent on
" }}}

" Plugin Config {{{

let g:localvimrc_whitelist = 'dev/.lvimrc'
let g:localvimrc_sandbox = 0

let g:nrrw_rgn_nohl = 1
let g:nrrw_rgn_wdth = 50

let g:ctrlp_max_height = 25
let g:ctrlp_switch_buffer = 2
let g:ctrlp_working_path_mode = 2
let g:ctrlp_open_multiple_files = '0vt'
let g:ctrlp_dotfiles = 1
let g:ctrlp_custom_ignore = 'Img$\|^Images$\|Files$\|\.svn$\|\.jpg$\|\.png$\|\.gif$'
let g:ctrlp_map = '<leader>,'
nmap <leader>t :CtrlPBufTag<CR>
nmap <leader>r :CtrlPMRUFiles<CR>
nmap <leader>f :CtrlP .<CR>
nmap <leader>T :CtrlPTag<CR>

vmap <leader>= :Tabularize/=<CR>
vmap <leader>> :Tabularize/=><CR>

nmap <leader>U :UndotreeToggle<CR>
nmap <leader>e :BufExplorer<CR>


nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
let g:yankstack_map_keys = 0
call yankstack#setup()
nmap Y y$

:let g:notes_tab_indents = 0
:let g:notes_directories = ['~/.vim/notes']

" }}}

" UI {{{
if has('gui_running')
   set guioptions-=T " no toolbar
   set guioptions-=M " no menu
   set guioptions-=r " no right scrollbar
   set guioptions-=L " no left scrollbar
   set guitablabel=%m\ %t
   set guifont=Inconsolata\ for\ Powerline:h12
   colo solarized
else
   let g:solarized_termtrans = 1
   colo solarized
endif

if &diff
  " colo hybrid
endif

syntax enable
" }}}

" Set's {{{

set laststatus=2   " Always show the statusline
set encoding=utf-8

set autoindent
set smartindent
set noswapfile

set shiftwidth=4
set tabstop=4
set expandtab

set scrolloff=15
set sidescrolloff=5

set wildmode=longest:full
set wildmenu

set nowrap

set ignorecase
set smartcase

set diffopt+=vertical

set complete-=i
set complete-=t

" sane terminal
set notimeout ttimeout ttimeoutlen=10

set backspace=indent,eol,start

set history=500
set showcmd
set incsearch

set hidden
set relativenumber
set splitbelow splitright
set showmatch
set hls
set autoread
set autowrite
set ttyfast
set synmaxcol=500
set completeopt=longest,menuone,preview
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%*%=%-14.(%c%V%)%c\ \ %l/%L
nohls

" disable cursor blink
set gcr=a:blinkon0

" persistent undo history
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

set wildignore+=.hg,.git,.svn
set wildignore+=*.beam
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg

" }}}

" Mappings {{{

" use normal regexes
nnoremap / /\v
vnoremap / /\v

  
nnoremap ; :
vnoremap ; :

cnoremap help vert help

nmap <leader># :%s///n<CR> " count matches
nmap <leader>D :%s///g<CR> " delete matches

map [t :tabprevious<CR>
map ]t :tabnext<CR>
map [T :tabfirst<CR>
map ]T :tablast<CR>

map [b :bprevious<CR>
map ]b :bnext<CR>
map [B :bfirst<CR>
map ]B :blast<CR>

nnoremap <leader>w :vnew<cr>

nmap <leader>V :source $MYVIMRC
nmap <leader>v :vsplit $MYVIMRC<CR>
nnoremap <leader><space> :noh<cr>

nmap <C-]> g<C-]>  " jump to tag if one, show list otherwise

noremap H ^
noremap L $
nnoremap j gj
nnoremap k gk

inoremap # X<BS>#

inoremap <c-f> <c-x><c-f>
inoremap <c-]> <c-x><c-]>


inoremap <C-U> <C-G>u<C-U>
vnoremap z :fold<CR>
" }}}

" Auto Commands {{{

" return to same line on reopen
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") && !&diff |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" cursorline on active windows only
augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
augroup END

autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch

au WinEnter * :set winfixheight
au VimResized * :wincmd =

" source the .vimrc file on save to apply all changes immediately
autocmd! bufwritepost .vimrc source $MYVIMRC

augroup vimrc
    au!
    au FileType vim setlocal foldmethod=marker
augroup END

augroup tracwiki
    au!
    au FileType tracwiki setlocal shiftwidth=2 tabstop=2
augroup END

autocmd FileType erlang set commentstring=%\ %s

" }}}

runtime macros/matchit.vim


nnoremap <leader>s :update<cr>
