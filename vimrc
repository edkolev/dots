let mapleader = ","
" Vundle config
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" colours
Bundle 'peaksea'
Bundle 'twilight'
Bundle 'jellybeans.vim'
Bundle 'herald.vim'
Bundle 'Wombat'
Bundle 'Zenburn'
Bundle 'phd'
Bundle 'xoria256.vim'
Bundle 'paintbox'
Bundle 'Sift'
Bundle 'Mustang2'
Bundle 'badwolf'
Bundle 'darktango.vim'
Bundle 'ironman.vim'
Bundle 'Atom'
Bundle 'w0ng/vim-hybrid'
Bundle 'noahfrederick/Hemisu'
Bundle 'Lucius'
Bundle 'altercation/vim-colors-solarized'

" code assistance
Bundle 'The-NERD-tree'
Bundle 'surround.vim'
Bundle 'localvimrc'
Bundle 'Syntastic'
Bundle 'Tagbar'
Bundle 'ctrlp.vim'
Bundle 'project.tar.gz'
Bundle 'mbbill/undotree'
Bundle 'scratch.vim'
Bundle 'ack.vim'
Bundle 'repeat.vim'
Bundle 'NrrwRgn'
Bundle 'commentary.vim'
Bundle 'yankstack'
Bundle 'mihaifm/vimpanel'
Bundle 'bufexplorer.zip'
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-lastpat'
Bundle 'kana/vim-textobj-entire'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'tpope/vim-abolish'
Bundle 'nelstrom/vim-qargs'
Bundle 'leshill/vim-json'
Bundle 'tracwiki'
Bundle 'xolox/vim-notes'
Bundle 'godlygeek/tabular'
" Bundle 'tomtom/quickfixsigns_vim'

filetype plugin indent on
" end of Vundle config

let g:localvimrc_whitelist = 'dev/.lvimrc'
let g:localvimrc_sandbox = 0

let g:nrrw_rgn_nohl = 1
let g:easytags_auto_update = 0

let g:UltiSnipsSnippetDirectories=["bundle/UltiSnips/UltiSnips/"]

let g:ctrlp_switch_buffer = 2
let g:ctrlp_working_path_mode = 2
let g:ctrlp_open_multiple_files = '0vt'
let g:ctrlp_dotfiles = 1
let g:ctrlp_custom_ignore = 'Img$\|Images$\|Files$\|\.svn$\|\.jpg$\|\.png$\|\.gif$'

let g:nrrw_rgn_wdth = 50

vmap <Leader>= :Tabularize/=<CR>
vmap <Leader>> :Tabularize/=><CR>

nmap <Leader>U :UndotreeToggle<CR>
nmap <Leader>n :NERDTreeToggle<CR>
nmap <silent> <Leader>E :Project<CR>
nmap <Leader>e :BufExplorer<CR>

let g:NERDTreeWinPos = "right"
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeChDirMode = 1
let g:NERDTreeDirArrows=0
let g:proj_flags='imstc'

nmap <Leader>t :CtrlPBufTag<CR>
nmap <Leader>r :CtrlPMRUFiles<CR>
nmap <Leader>f :CtrlP .<CR>

let g:syntastic_check_on_open=0
let g:syntastic_enable_balloons = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_auto_jump=1
let g:syntastic_mode_map = { 'mode': 'passive' ,
                           \ 'active_filetypes': ['erlang'],
                           \ 'passive_filetypes': ['perl'] }

let g:yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

call yankstack#setup()
nmap Y y$

:let g:notes_tab_indents = 0

syntax enable
if has('gui_running')
   set cursorline
   set guioptions-=T " no toolbar
   set guioptions-=M " no menu
   set guioptions-=r " no right scrollbar
   set guioptions-=L " no left scrollbar
   set guitablabel=%m\ %t
   set guifont=Inconsolata:h13
   colo lucius
else
   let g:solarized_termtrans = 1
   colo solarized
endif

if &diff
  " colo hybrid
endif

set laststatus=2   " Always show the statusline
set encoding=utf-8

set autoindent
set smartindent
set noswapfile
inoremap # #

set shiftwidth=4
set tabstop=4
set expandtab

set scrolloff=20
set sidescrolloff=20

set wildmode=longest:full
set wildmenu

" always show tabar
" set showtabline=2
set nowrap

nmap <Leader>V :source $MYVIMRC
nmap <Leader>v :vsplit $MYVIMRC<CR>

set ignorecase
set smartcase

set diffopt+=vertical

set complete-=i
set complete-=t

" same terminal
set notimeout ttimeout ttimeoutlen=10

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50 " keep 50 lines of command line history
set showcmd    " display incomplete commands
set incsearch  " do incremental searching

" nmap <Leader>s :w<CR>:! svn diff %<CR>

" Moving around windows 
map <C-j> <C-w>j<C-w><Esc>
map <C-k> <C-w>k<C-w><Esc>
map <C-l> <C-w>l<C-w><Esc>
map <C-h> <C-w>h<C-w><Esc>
  
nnoremap ; :
vnoremap ; :

cnoremap help vert help

" use normal regexes
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>

set gdefault " replace all matches on the line e.g. s///g
set showmatch
set hls
nohls
au FocusLost * silent! wa
au FocusLost,TabLeave * call feedkeys("\<C-\>\<C-n>")

nmap <Leader># :%s///n<CR> " count matches
nmap <Leader>D :%s///g<CR> " delete matches

map [t :tabprevious<CR>
map ]t :tabnext<CR>
map [T :tabfirst<CR>
map ]T :tablast<CR>

map [b :bprevious<CR>
map ]b :bnext<CR>
map [B :bfirst<CR>
map ]B :blast<CR>

nnoremap <leader>w :vnew<cr>

" show line numbers in current window only
set relativenumber
" au WinEnter * :setlocal relativenumber
" au WinLeave * :setlocal norelativenumber

" Automatically resize vertical splits.
au WinEnter * :set winfixheight
" :au WinEnter * :wincmd =
" set hidden

" source the .vimrc file on save to apply all changes immediately
if has("autocmd")
  autocmd! bufwritepost .vimrc source $MYVIMRC
endif

" set list lcs=trail:·,tab:»·


nmap <C-]> g<C-]>     " jump to tag if one, show list otherwise

set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%*%=%-14.(%c%V%)%c\ \ %l/%L

autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch

augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
augroup END

set splitbelow splitright

nnoremap j gj
nnoremap k gk
nnoremap J mzJ`z

" set autowrite
" set autoread
set ttyfast
set synmaxcol=800
set completeopt=longest,menuone,preview
au VimResized * :wincmd =

augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
