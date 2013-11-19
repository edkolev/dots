let mapleader = ","
set nocompatible

" Plugins {{{
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'ironman.vim'
Bundle 'w0ng/vim-hybrid'
Bundle 'jonathanfilip/lucius'
Bundle 'altercation/vim-colors-solarized'
Bundle "daylerees/colour-schemes", { "rtp": "vim-themes/" }
Bundle 'jonathanfilip/vim-lucius'
Bundle 'jnurmine/Zenburn'

Bundle 'tpope/vim-sensible'
Bundle 'surround.vim'
Bundle 'ctrlp.vim'
Bundle 'repeat.vim'
Bundle 'NrrwRgn'
Bundle 'tpope/vim-commentary'
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
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'sjl/gundo.vim'
Bundle 'bogado/file-line'
Bundle 'tpope/vim-dispatch'
Bundle 'bling/vim-airline'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/Css-Pretty'
Bundle 'tpope/vim-rsi'
Bundle 'vim-scripts/ReplaceWithRegister'
Bundle 'moll/vim-bbye'
Bundle 'elzr/vim-json'
Bundle 'edkolev/tmuxline.vim'

runtime ftplugin/man.vim
runtime macros/matchit.vim

" Bundle 'tpope/vim-scriptease'
" Bundle 'kana/vim-vspec'
" Bundle 'xolox/vim-misc'
" Bundle 'xolox/vim-reload'

if has('gui_running')
  Bundle 'xolox/vim-notes'
  Bundle 'xolox/vim-misc'
endif

filetype plugin indent on
" }}}

" Plugin Config {{{

let g:tagbar_autoclose = 1

let g:nrrw_rgn_vert = 1
let g:nrrw_rgn_nohl = 1
let g:nrrw_rgn_wdth = 80

let g:ctrlp_max_height = 45
let g:ctrlp_switch_buffer = 2
let g:ctrlp_working_path_mode = 2
let g:ctrlp_open_multiple_files = '0vt'
let g:ctrlp_dotfiles = 1
let g:ctrlp_custom_ignore = 'Img$\|^Images$\|Files$\|\.svn$\|\.jpg$\|\.png$\|\.gif$\|\.txt$\|\.swf$\|\.css$'
let g:ctrlp_map = '<leader>,'
nmap <leader>t :CtrlPBufTag<CR>
nmap <leader>r :CtrlPMRUFiles<CR>
nmap <leader>f :CtrlP .<CR>
nmap <leader>T :CtrlPTag<CR>
nmap <leader>e :CtrlPBuffer<CR>

vmap <leader>= :Tabularize/=<CR>
vmap <leader>> :Tabularize/=><CR>

nmap <leader>U :GundoToggle<CR>

let g:notes_tab_indents = 0
let g:notes_directories = ['~/.vim/notes']

let g:Gitv_DoNotMapCtrlKey = 1

let g:airline_powerline_fonts = 1
let g:airline_inactive_collapse=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline_mode_map = {
      \ '__' : '- ',
      \ 'n'  : 'N ',
      \ 'i'  : 'I ',
      \ 'R'  : 'R ',
      \ 'v'  : 'V ',
      \ 'V'  : 'VL',
      \ 'c'  : 'C ',
      \ '' : 'VB',
      \ 's'  : 'S ',
      \ 'S'  : 'SL',
      \ '' : 'SB',
      \ }

function! AirlineInit()
    let g:airline_section_y = airline#section#create_right(['%v', '%l'])
    let g:airline_section_z = airline#section#create_right(['%P', '%L'])
endfunction
autocmd VimEnter * call AirlineInit()

" }}}

" UI {{{
if has('gui_running')
   set guioptions-=T " no toolbar
   set guioptions-=M " no menu
   set guioptions-=r " no right scrollbar
   set guioptions-=L " no left scrollbar
   set guitablabel=%m\ %t
   set guifont=Droid\ Sans\ Mono\ for\ Powerline:h11

   colo zenburn
else
   colo zenburn
endif

syntax enable
" }}}

" Set's {{{
set noshowmode
set cursorline
set encoding=utf-8

set smartindent
set noswapfile

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

set scrolloff=25
set sidescrolloff=5

set wildmode=list:longest,full

set nowrap
set linebreak

set ignorecase
set smartcase

set diffopt+=vertical
set diffopt+=iwhite

set complete-=i
set complete-=t

set hidden
set number
set relativenumber
set numberwidth=1
set splitbelow splitright
set showmatch
set autowrite
set synmaxcol=500
set completeopt=longest,menuone,preview

" disable cursor blink
set gcr=a:blinkon0

" persistent undo history
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

set wildignore+=.hg,.git,.svn
set wildignore+=*.beam
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set showbreak=↪

" }}}

" Mappings {{{

" use normal regexes
nnoremap / /\v
vnoremap / /\v

vnoremap . :normal .<CR>

cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

nmap <leader># :%s///ng<CR> " count matches
nmap <leader>D :%s///g<CR> " delete matches

nnoremap <leader>w :vnew<cr>
nnoremap <leader>W :new<cr>
nnoremap <leader>s :update<cr>
nnoremap <cr> :update<cr>
nmap <leader>v :vsplit $MYVIMRC<CR>
nmap <leader>V :vsplit $MYVIMRC.local<CR>
nnoremap <leader><space> :noh<cr>

nmap <C-]> g<C-]>  " jump to tag if one, show list otherwise

nnoremap j gj
nnoremap k gk

inoremap # X<BS>#
noremap 0 ^

" file, tag, line completion
inoremap <c-f> <c-x><c-f>
inoremap <c-]> <c-x><c-]>
inoremap <c-l> <c-x><c-l>

nmap Y y$
" }}}

" Auto Commands {{{

" return to same line on reopen, unless diff-ing
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
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

au WinEnter * :set winfixheight
au VimResized * :wincmd =

" source .vimrc on save
autocmd! bufwritepost .vimrc source $MYVIMRC
autocmd! bufwritepost .vimrc.local source $MYVIMRC

augroup vim
    au!
    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | vertical resize 80 | endif
augroup END

augroup tracwiki
    au!
    au FileType tracwiki setlocal shiftwidth=2 tabstop=2
augroup END

autocmd FileType erlang set commentstring=%\ %s

autocmd FileType perl compiler perl

autocmd BufReadPost fugitive://* set bufhidden=delete

if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

autocmd BufWritePost * if &diff == 1 | diffupdate | endif

au BufWinEnter *.md set ft=markdown
au BufWinEnter *.conf set ft=conf

" }}}

let g:netrw_banner       = 0
let g:netrw_liststyle    = 3
let g:netrw_sort_options = 'i'

