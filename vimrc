
" Plugins {{{

let g:plugin_dir = '~/.vim/bundle'
let g:plugin_list = []

" Poor man's plugin downloader {{{
function! Pl(...)
  let g:plugin_list += map(copy(a:000), "substitute(v:val,\"'\",\"\",\"g\")")
endfunction
command! -nargs=+ Pl call Pl(<f-args>)

function! ClonePlugins(update_plugins) abort
  if !isdirectory(expand(g:plugin_dir))
    call mkdir(expand(g:plugin_dir))
  endif

  for plugin in g:plugin_list
    let output_dir = expand(g:plugin_dir . '/' . fnamemodify(plugin, ":t"), ':p')
    let is_plugin_installed = isdirectory(output_dir)
    if is_plugin_installed && !a:update_plugins
      continue
    endif

    let command = is_plugin_installed ? printf("cd %s && git pull -q", output_dir) : printf("git clone -q %s %s", "https://github.com/" . plugin . '.git', output_dir)
    let output = system(command)
    if strlen(output) > 0 | echohl ErrorMsg | echo "ClonePlugins: '" . plugin . "' failed" |  echo output | echohl None | else | echo "ClonePlugins: installed " . plugin | endif
  endfor
endfunction
command! -nargs=0 -bang ClonePlugins call ClonePlugins(strlen("<bang>"))
" }}}

Pl 'vim-scripts/ironman.vim'
Pl 'w0ng/vim-hybrid'
Pl 'jonathanfilip/vim-lucius'
Pl 'jnurmine/Zenburn'
Pl 'vim-scripts/twilight256.vim'
Pl 'vim-scripts/jellybeans.vim'
Pl 'vim-scripts/wombat256.vim'

Pl 'tpope/vim-sensible'
Pl 'tpope/vim-commentary'
Pl 'tpope/vim-eunuch'
Pl 'tpope/vim-obsession'
Pl 'tpope/vim-tbone'
Pl 'tpope/vim-unimpaired'
Pl 'tpope/vim-git'
Pl 'tpope/vim-markdown'
Pl 'tpope/vim-fugitive'
Pl 'tpope/vim-dispatch'
Pl 'tpope/vim-rsi'
Pl 'jeetsukumaran/vim-filebeagle'
Pl 'tpope/vim-jdaddy'
Pl 'tpope/vim-surround'
Pl 'tpope/vim-pathogen'
Pl 'kien/ctrlp.vim'
Pl 'tpope/vim-repeat'
Pl 'vim-scripts/NrrwRgn'
Pl 'vim-scripts/tracwiki'
Pl 'gregsexton/gitv'
Pl 'christoomey/vim-tmux-navigator'
Pl 'bogado/file-line'
Pl 'bling/vim-airline'
Pl 'michaeljsmith/vim-indent-object'
Pl 'majutsushi/tagbar'
Pl 'vim-scripts/ReplaceWithRegister'
Pl 'moll/vim-bbye'
Pl 'elzr/vim-json'
Pl 'edkolev/tmuxline.vim'
Pl 'mbbill/undotree'
Pl 'edkolev/promptline.vim'
Pl 'junegunn/goyo.vim'
Pl 'wellle/targets.vim'
Pl 'tommcdo/vim-lion'
Pl 'tommcdo/vim-exchange'
Pl 'junegunn/vader.vim'
Pl 'wellle/tmux-complete.vim'
Pl 'vim-scripts/DirDiff.vim'
Pl 'nelstrom/vim-visual-star-search'
Pl 'AndrewRadev/splitjoin.vim'
Pl 'AndrewRadev/linediff.vim'
if has('gui_running')
  Pl 'xolox/vim-notes'
endif
" Pl 'tpope/vim-scriptease'
" Pl 'xolox/vim-misc'
" Pl 'xolox/vim-reload'

ClonePlugins

execute "source " . g:plugin_dir . '/vim-pathogen/autoload/pathogen.vim'
execute pathogen#infect(g:plugin_dir . '/{}')

set nocompatible
syntax on
filetype plugin indent on

let mapleader = ","

runtime ftplugin/man.vim
runtime macros/matchit.vim

" }}}

" Plugin Config {{{

let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#close_symbol = 'Y'

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
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

nmap <leader>t :CtrlPBufTag<CR>
nmap <leader>r :CtrlPMRUFiles<CR>
nmap <leader>f :CtrlP .<CR>
nmap <leader>T :CtrlPTag<CR>
nmap <leader>e :CtrlPBuffer<CR>

nmap <leader>U :GundoToggle<CR>

let g:notes_tab_indents = 0
let g:notes_directories = ['~/.vim/notes']
let g:notes_shadowdir = '/Users/edkolev/.vim/notes/shadow'

let g:Gitv_DoNotMapCtrlKey = 1

let g:airline_powerline_fonts = 1
let g:airline_inactive_collapse=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline_mode_map = {
      \ '__' : '- ',
      \ 'n'  : 'n ',
      \ 'i'  : 'i ',
      \ 'R'  : 'r ',
      \ 'v'  : 'v ',
      \ 'V'  : 'vl',
      \ 'c'  : 'c ',
      \ '' : 'vb',
      \ 's'  : 's ',
      \ 'S'  : 'sl',
      \ '' : 'sb',
      \ }

let g:promptline_preset = {
        \'a' : [ promptline#slices#vcs_branch(), promptline#slices#git_status() ],
        \'c' : [ promptline#slices#cwd() ],
        \'options': {
          \'left_sections' : [ 'a', 'c' ],
          \'left_only_sections' : [ 'a', 'c' ]}}

let g:tmuxline_preset = 'full'

let g:syntastic_mode_map = { 'mode': 'passive' }

autocmd FileType perl
         \ let b:endwise_addition = '}' |
         \ let b:endwise_words = 'if,else,sub,while' |
         \ let b:endwise_syngroups = 'perlConditional,perlFunction,perlRepeat'

" }}}

" UI {{{
if has('gui_running')
   set guioptions-=T " no toolbar
   set guioptions-=M " no menu
   set guioptions-=r " no right scrollbar
   set guioptions-=L " no left scrollbar
   set guitablabel=%m\ %t
   set guifont=Droid\ Sans\ Mono\ for\ Powerline:h11
else
endif
colo lucius

syntax enable
" }}}

" Set's {{{
set noshowcmd
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

set nowrap
set linebreak

set ignorecase
set smartcase
set diffopt+=vertical
set diffopt+=iwhite
set hidden
set number
set relativenumber
set numberwidth=1
set splitbelow splitright
set showmatch
set autowrite
set synmaxcol=500
set completeopt=longest,menuone,preview
set complete=.,b,u,t
set wildmode=list:longest,full

" disable cursor blink
set gcr=a:blinkon0

" persistent undo history
if !filewritable(expand('~/.vim/undo'))
  call mkdir(expand('~/.vim/undo'))
endif
if filewritable(expand('~/.vim/undo'))
  set undodir=~/.vim/undo
  set undofile
endif

set wildignore+=.hg,.git,.svn
set wildignore+=*.beam
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set showbreak=↪
set fillchars=""

set exrc
set secure
set wrapscan
set lazyredraw

set foldopen-=block

" }}}

" Mappings & Commands {{{

vnoremap . :normal .<CR>

map Q gwap
" TODO remove either one of these
nmap \ g;
map \| g,
nmap [. g;
map ]. g,

cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

nmap <leader># :%s///ng<CR>
nmap <leader>D :%s///g<CR>

nnoremap <leader>w :vsplit<cr>
nnoremap <cr> :update<cr>
nmap <leader>v :e $MYVIMRC<CR>
nmap <leader>V :e $MYVIMRC.local<CR>

" jump to tag if one, show list otherwise
nmap <C-]> g<C-]>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

noremap 0 ^

" file, tag, line completion
inoremap <c-f> <c-x><c-f>
inoremap <c-]> <c-x><c-]>
inoremap <c-l> <c-x><c-l>

nmap Y y$

nmap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
command! -nargs=+ -complete=file -bar Grep silent! grep! <args>|cwindow|redraw!
nnoremap <leader>/ :Grep<SPACE>

function! ChompWhitespace()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
command! -nargs=0 ChompWhitespace call ChompWhitespace()

command! DiffOrig lefta vnew | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis

if executable('tidyp')
  command! TidyHTML :%!tidyp -q -i --show-errors 0 --tidy-mark 0 --show-body-only 1
endif

" 'entire' text object
onoremap ie :<c-u>normal! ggvG$<cr>
xnoremap ie :<c-u>normal! ggvG$<cr>

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

au VimResized * :wincmd =

" source .vimrc on save
autocmd! bufwritepost .vimrc source $MYVIMRC
autocmd! bufwritepost .vimrc.local source $MYVIMRC

augroup vim
    au!
    au FileType vim setlocal foldmethod=marker
augroup END

augroup tracwiki
    au!
    au FileType tracwiki setlocal shiftwidth=2 tabstop=2
augroup END

autocmd FileType erlang set commentstring=%\ %s

autocmd FileType perl compiler perl

autocmd BufReadPost fugitive://* set bufhidden=delete

autocmd FileType gitcommit setlocal spell

if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

autocmd BufWritePost * if &diff == 1 | diffupdate | endif

au BufWinEnter *.md set ft=markdown
au BufWinEnter *.conf set ft=conf

augroup fast_quit
  au!
  au FileType help nnoremap <buffer> q :q<cr>
  au FileType qf nnoremap <buffer> q :q<cr>
  au CmdwinEnter * nnoremap <buffer> q :q<cr>
augroup END

" }}}
