
" Plugins {{{

let g:plugin_dir = expand('~/.vim/bundle', ':p')
let g:plugin_hash = {}
let g:pathogen_blacklist = []

" Poor man's plugin downloader {{{
if !isdirectory(g:plugin_dir) | call mkdir(g:plugin_dir, "p") | endif

function! DownloadPluginIfMissing(plugin) abort
  let output_dir = g:plugin_dir . '/' . fnamemodify(a:plugin, ":t")
  if isdirectory(output_dir) || !executable('git')
    return
  endif
  let command = printf("git clone -q %s %s", "https://github.com/" . a:plugin . '.git', output_dir)
  echo "DownloadPluginIfMissing: " . command | echo system(command)
  silent! execute 'helptags ' . output_dir . '/doc'
endfunction

function! UpdatePlugin(plugin) abort
  let output_dir = g:plugin_dir . '/' . fnamemodify(a:plugin, ":t")
  if !isdirectory(output_dir) || !executable('git')
    return
  endif
  let command = printf("cd %s && git pull -q", output_dir)
  echo "UpdatePlugin: " . command | echo system(command)
endfunction

function! Pl(...) abort
  for plugin in map(copy(a:000), 'substitute(v:val, ''''''\|"'', "", "g")')
    let g:plugin_hash[ fnamemodify(plugin, ':t') ] = 1
    call DownloadPluginIfMissing(plugin)
  endfor
endfunction

command! -nargs=+ Pl call Pl(<f-args>)
command! -bang -nargs=0 UpdatePlugins if len("<bang>") == 0 | call map( keys(g:plugin_hash), 'UpdatePlugin( v:val )' ) | else | execute "Start! vim -c UpdatePlugin -c qa" | endif
" }}}

Pl 'vim-scripts/ironman.vim'
Pl 'w0ng/vim-hybrid'
Pl 'jonathanfilip/vim-lucius'
Pl 'jnurmine/Zenburn'
Pl 'vim-scripts/twilight256.vim'
Pl 'vim-scripts/jellybeans.vim'
Pl 'vim-scripts/wombat256.vim'
Pl 'junegunn/seoul256.vim'

Pl 'tpope/vim-sensible'  'tpope/vim-commentary' 'tpope/vim-eunuch'
Pl 'tpope/vim-obsession' 'tpope/vim-tbone'      'tpope/vim-unimpaired'
Pl 'tpope/vim-git'       'tpope/vim-markdown'   'tpope/vim-fugitive'
Pl 'tpope/vim-dispatch'  'tpope/vim-rsi'        'tpope/vim-repeat'
Pl 'tpope/vim-jdaddy'    'tpope/vim-surround'   'tpope/vim-sleuth'
Pl 'tpope/vim-endwise'   'tpope/vim-abolish'

Pl 'edkolev/tmuxline.vim'
Pl 'edkolev/promptline.vim'
Pl 'jeetsukumaran/vim-filebeagle'
Pl 'kien/ctrlp.vim'
Pl 'vim-scripts/NrrwRgn'
Pl 'vim-scripts/tracwiki'
Pl 'gregsexton/gitv'
Pl 'christoomey/vim-tmux-navigator'
Pl 'bogado/file-line'
Pl 'michaeljsmith/vim-indent-object'
Pl 'majutsushi/tagbar'
Pl 'vim-scripts/ReplaceWithRegister'
Pl 'moll/vim-bbye'
Pl 'elzr/vim-json'
Pl 'edkolev/tmuxline.vim'
Pl 'mbbill/undotree'
Pl 'junegunn/goyo.vim'
Pl 'wellle/targets.vim'
Pl 'tommcdo/vim-lion'
Pl 'tommcdo/vim-exchange'
Pl 'junegunn/vader.vim'
Pl 'nelstrom/vim-visual-star-search'
Pl 'AndrewRadev/splitjoin.vim'
Pl 'AndrewRadev/linediff.vim'
if has('gui_running')
  Pl 'vimwiki/vimwiki'
endif
Pl 'tpope/vim-scriptease'

set nocompatible
syntax on
filetype plugin indent on
Pl 'tpope/vim-pathogen'
execute "source " . g:plugin_dir . '/vim-pathogen/autoload/pathogen.vim'
let g:pathogen_blacklist = filter(map(split(glob(g:plugin_dir . '/*', 1), "\n"),'fnamemodify(v:val,":t")'), '!has_key(g:plugin_hash, v:val)')
execute pathogen#infect(g:plugin_dir . '/{}')

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

let g:tmuxline_preset = {
      \ 'b'   : '#h',
      \ 'win' : ['#I', '#W'],
      \ 'cwin': ['#I', '#W'],
      \ 'y'   : '%R'}

let g:syntastic_mode_map = { 'mode': 'passive' }

autocmd FileType perl
         \ let b:endwise_addition = '}' |
         \ let b:endwise_words = 'if,else,sub,while' |
         \ let b:endwise_syngroups = 'perlConditional,perlFunction,perlRepeat'

autocmd FileType r
         \ let b:endwise_addition = '}' |
         \ let b:endwise_words = 'function,for' |
         \ let b:endwise_syngroups = 'rType,rRepeat'

let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" }}}

" UI {{{
if has('gui_running')
   set guioptions-=T " no toolbar
   set guioptions-=M " no menu
   set guioptions-=r " no right scrollbar
   set guioptions-=L " no left scrollbar
   set guitablabel=%m\ %t
   set guifont=Droid\ Sans\ Mono\ for\ Powerline:h11

   set gcr=a:blinkon0
else
endif
colo seoul256-light

set statusline=
set statusline+=[%n%H%R%W]%*\ 
set statusline+=%f%m\ 
set statusline+=%{fugitive#head()}
set statusline+=%=
set statusline+=%c:%l\ of\ %L

" }}}

" Set's {{{
set formatoptions=
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
set numberwidth=1
set splitbelow splitright
set showmatch
set autowrite
set synmaxcol=500
set completeopt=longest,menuone,preview
set complete=.,b,u,t
set wildmode=list:longest,full

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
set showbreak=+++\ 
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
nmap \ g;
map \| g,

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

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

inoremap <c-]> <c-x><c-]>
inoremap <c-l> <c-x><c-l>

nmap Y y$

nmap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

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

nmap gn :%normal 

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

augroup commentstring
  au!
  autocmd FileType erlang set commentstring=%\ %s
  autocmd FileType R set commentstring=#%s
augroup END

autocmd FileType perl compiler perl

augroup git
  au!
  autocmd BufReadPost fugitive://* set bufhidden=delete
  autocmd FileType gitcommit setlocal spell
augroup END

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
"

function! SaveRegister()
  echo "save"
  let line = line('.') | let col = col('.') |
  execute 'normal gg"' . b:register . 'yG'
  call cursor(line, col)
  let &modified = 0

  let @a=substitute(@a, "\n", "", 'g')

  execute 'reg ' . b:register
endfunction

function! EditRegister(register) abort
  new
  execute 'file register://' . a:register

  nnoremap <buffer> q :q<cr>
  set buftype=acwrite
  setlocal bufhidden=delete
  setlocal noswapfile

  execute 'normal "' . a:register . 'p'

  let b:register = a:register

  autocmd BufWriteCmd <buffer> call SaveRegister()
endfunction

