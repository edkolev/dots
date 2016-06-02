
" Plugins {{{
if !isdirectory(expand("~/.vim/bundle/poor-mans-plugin-downloader.vim"))
  !git clone -q https://github.com/edkolev/poor-mans-plugin-downloader.vim ~/.vim/bundle/poor-mans-plugin-downloader.vim
endif
set rtp+=~/.vim/bundle/poor-mans-plugin-downloader.vim

call plugins#begin()

Pl 'edkolev/poor-mans-plugin-downloader.vim'
Pl 'w0ng/vim-hybrid'
Pl 'jonathanfilip/vim-lucius'
Pl 'jnurmine/Zenburn'
Pl 'vim-scripts/jellybeans.vim'
Pl 'vim-scripts/wombat256.vim'
Pl 'junegunn/seoul256.vim'
Pl 'chriskempson/base16-vim'
Pl 'morhetz/gruvbox'

Pl 'tpope/vim-sensible'  'tpope/vim-commentary' 'tpope/vim-eunuch'
Pl 'tpope/vim-obsession' 'tpope/vim-tbone'      'tpope/vim-unimpaired'
Pl 'tpope/vim-git'       'tpope/vim-fugitive'   'tpope/vim-abolish'
Pl 'tpope/vim-dispatch'  'tpope/vim-rsi'        'tpope/vim-repeat'
Pl 'tpope/vim-jdaddy'    'tpope/vim-surround'   'tpope/vim-projectionist'
Pl 'tpope/vim-endwise'   'tpope/vim-haystack'

Pl 'edkolev/promptline.vim'
Pl 'vim-scripts/tracwiki'
Pl 'christoomey/vim-tmux-navigator'
Pl 'michaeljsmith/vim-indent-object'
Pl 'majutsushi/tagbar'
Pl 'vim-scripts/ReplaceWithRegister'
Pl 'moll/vim-bbye'
Pl 'elzr/vim-json'
Pl 'edkolev/tmuxline.vim'
Pl 'mbbill/undotree'
Pl 'junegunn/goyo.vim'
Pl 'junegunn/limelight.vim'
Pl 'tommcdo/vim-lion'
Pl 'tommcdo/vim-exchange'
Pl 'junegunn/vader.vim'
Pl 'AndrewRadev/linediff.vim'
Pl 'pydave/renamer.vim'
" Pl 'tpope/vim-scriptease'
Pl 'thinca/vim-qfreplace'
Pl 'AndrewRadev/inline_edit.vim'
" Pl 'vim-scripts/DirDiff.vim'
Pl 'vim-scripts/fish-syntax'
Pl 'Wolfy87/vim-expand'
Pl 'shime/vim-livedown'
Pl 'thinca/vim-ref'
Pl 'nicwest/QQ.vim'
Pl 'vim-scripts/LargeFile'
Pl 'itchyny/vim-haskell-indent'
Pl 'ledger/vim-ledger'
Pl 'reedes/vim-colors-pencil'
Pl 'justinmk/vim-dirvish'

call plugins#end()

syntax on
filetype indent on

let mapleader = ","

runtime macros/matchit.vim

" }}}

" Plugin Config {{{

" let g:promptline_preset = {
"         \'a' : [ promptline#slices#host({'only_if_ssh': 1}), promptline#slices#vcs_branch(), promptline#slices#git_status() ],
"         \'c' : [ promptline#slices#cwd() ],
"         \'options': {
"           \'left_sections' : [ 'a', 'c' ],
"           \'left_only_sections' : [ 'a', 'c' ]}}

" let g:tmuxline_powerline_separators = 0
" let g:tmuxline_preset = {
"         \ 'a': '#S',
"         \ 'win': '#I #W',
"         \ 'cwin': '#I #W',
"         \ 'z': '%R',
"         \ 'options': {
"           \'status-justify': 'centre'}
"         \}

let g:rsi_no_meta = 1
let g:vim_json_syntax_conceal = 0
let g:inline_edit_autowrite = 1
" }}}

" UI {{{
if has('gui_running')
   set guioptions=egm
   set guitablabel=%m\ %t
   set guifont=Droid\ Sans\ Mono\ for\ Powerline:h11
   set gcr=a:blinkon0
else
endif

set laststatus=1
set statusline=\ 
set statusline+=[%n%H%R%W]%*\ 
set statusline+=%f%m\ 
set statusline+=%{fugitive#head()}
set statusline+=%=
set statusline+=%c:%l\ of\ %L\ 

" }}}

" Set's {{{
set report=0
set nojoinspaces

set formatoptions=
set noshowcmd
set noshowmode
set nocursorline
set encoding=utf-8

set smartindent
set noswapfile

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

set scrolloff=0
set scrolljump=-15
set sidescrolloff=5
set history=2000

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
set path=**
set shortmess=ao

if !isdirectory($HOME . '/.vim/undo')
  call mkdir($HOME . '/.vim/undo')
endif
if isdirectory($HOME . '/.vim/undo')
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
set foldlevelstart=99

set spellfile=~/.vim/en.utf-8.add

" change cursor in INSERT
let &t_SI = exists('$TMUX') ? "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\" : "\<Esc>]50;CursorShape=1\x7"
let &t_EI = exists('$TMUX') ? "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\" : "\<Esc>]50;CursorShape=0\x7"

if executable('ag')
  set grepprg=ag\ -s\ \ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m
endif
set sessionoptions-=options

" }}}

" Mappings & Commands {{{

vnoremap . :normal .<CR>

map Q gwap
nmap \ g;
map \| g,

nnoremap !! :!!<cr>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nmap # :%s///ng<CR>
nmap <leader>D :%s///g<CR>

nnoremap <leader>w :vsplit<cr>
nnoremap <expr> <cr> &modified>0?":update<cr>":"\<Lt>cr>"
nmap <leader>v :e <c-r>=resolve($MYVIMRC)<CR><CR>
nmap <leader>V :e $MYVIMRC.local<CR>

" jump to tag if one, show list otherwise
nmap <C-]> g<C-]>

nmap <C-f> <Nop>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

noremap 0 ^

inoremap <c-]> <c-x><c-]>
inoremap <c-l> <c-x><c-l>
inoremap <c-x><c-x> <c-x><c-p>

nmap Y y$

function! s:VSetSearch()
  let temp = @@
  norm! gvy
  call s:SetSearch(@@, 0)
  let @@ = temp
endfunction

function! s:SetSearch(pattern, match_whole_words)

  if a:match_whole_words
    let @/ = "\\<". a:pattern ."\\>"
  else
    let @/ = '\V' . substitute(escape(a:pattern, '\'), '\n', '\\n', 'g')
  endif

endfunction

function! s:EchoMatchCount()
  %s///gne
  normal ``
endfunction

function! s:SetGrepSearch(pattern)
  if &grepprg =~# '^ag'
    execute "grep! -Q -- " . shellescape(a:pattern)
  else
    execute "grep! -R -F " . shellescape(a:pattern) . ' .'
  endif
  call s:SetSearch(a:pattern, 0)
endfunction

function! s:VSetGrepSearch()
  let temp = @@
  norm! gvy
  call s:SetGrepSearch(@@)
  let @@ = temp
endfunction

vmap <silent> *  :<C-u>call <SID>VSetSearch()<CR>:set hlsearch<CR>:call <SID>EchoMatchCount()<CR>
vmap <silent> g* :<C-u>call <SID>VSetSearch()<CR>:set hlsearch<CR>:call <SID>EchoMatchCount()<CR>
vmap <silent> K  :<C-u>call <SID>VSetGrepSearch()<CR>: set hlsearch<CR>
nmap <silent> *  :call <SID>SetSearch(expand("<cword>"), 1)<CR>:set hlsearch<CR>:call <SID>EchoMatchCount()<CR>
nmap <silent> g* :call <SID>SetSearch(expand("<cword>"), 0)<CR>:set hlsearch<CR>:call <SID>EchoMatchCount()<CR>
nmap <silent> K  :call <SID>SetGrepSearch(expand("<cword>"))<CR>: set hlsearch<CR>

nmap <silent> gK :lgrep! "<C-R><C-W>"<CR>:lw<CR>

function! ChompWhitespace()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
command! -nargs=0 ChompWhitespace call ChompWhitespace()

command! DiffOrig lefta vnew | setlocal bt=nofile bh=delete noswf | r ++edit # | 0d_ | setlocal noma | diffthis | nnoremap <buffer> q :q<cr>:diffoff<cr> | wincmd p | diffthis

command! -bang -range=% -nargs=1 JoinWith <line1>,<line2>-1s/$/<args>/|<line1>,<line2>join<bang>

function! QffilterFunction(pat)
  let qf_lines = getqflist()
  let pattern = len(a:pat) > 1 ? a:pat : getreg('/')
  for qf_line in qf_lines
    if qf_line['text'] !~ pattern
        call remove(qf_lines, index(qf_lines, qf_line))
    endif
  endfor
  call setqflist(qf_lines)
endfunction

function! QfremoveFunction(pat)
  let qf_lines = getqflist()
  let pattern = len(a:pat) > 1 ? a:pat : getreg('/')
  for qf_line in qf_lines
    if qf_line['text'] =~ pattern
        call remove(qf_lines, index(qf_lines, qf_line))
    endif
  endfor
  call setqflist(qf_lines)
endfunction
command! -nargs=* Qffilter call QffilterFunction(<q-args>)
command! -nargs=* Qfremove call QfremoveFunction(<q-args>)

if executable('tidyp')
  command! TidyHTML :silent! %!tidyp --indent-attributes 1 --sort-attributes alpha -q -i --show-errors 0 --tidy-mark 0 --show-body-only 1
endif

if executable('python')
  command! TidyJSON :%!python -m json.tool
endif

nmap gn :%normal 
vmap gn :normal 

nnoremap <silent> gm :silent make \| redraw!<cr>
nnoremap gM :make!<cr>

" 'entire' text object
onoremap ie :<c-u>normal! ggvG$<cr>
xnoremap ie :<c-u>normal! ggvG$<cr>

" 'next' text object, by https://gist.github.com/AndrewRadev/1171559
onoremap an :<c-u>call <SID>NextTextObject('a')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i')<cr>

function! s:NextTextObject(motion)
  echo
  let c = nr2char(getchar())
  let c = c ==# "b" ? "(" : c
  exe "normal! f".c."v".a:motion.c
endfunction

" fuzzy buffer completion
function! GetBufferFileNames() abort
  let buffers = range(1, bufnr('$'))
  call filter(buffers, 'buflisted(v:val)')
  call map(buffers, "fnamemodify(bufname(v:val), ':.')")
  return buffers
endfunction

function! GetOldFileNames() abort
  let oldfiles = deepcopy(v:oldfiles)
  call filter( oldfiles, 'filereadable( v:val )' )
  call map( oldfiles, 'fnamemodify( v:val, ":." )' )
  call filter( oldfiles, 'v:val !~ "^/" && v:val !~ "^\\."' )
  return oldfiles
endfunction

function! BufferCompletionFunction(lead, cmdline, _) abort
  let buffers = GetBufferFileNames()
  let old_buffers = GetOldFileNames()
  call extend(buffers, old_buffers)
  call uniq(sort(buffers))

  return haystack#filter(buffers, a:lead)
endfunction

command! -bar -bang -nargs=* -complete=customlist,BufferCompletionFunction B :silent! edit <args>
nmap <space> :B <c-d>

" }}}

" Auto Commands {{{
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

" return to same line on reopen, unless diff-ing
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") && !&diff |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

augroup q_to_quit
   au!
   au BufReadPost,BufNewFile *
            \ if !&modifiable |
            \   nnoremap <buffer> q :q<cr>|
            \ endif
  au BufReadPost fugitive://* nnoremap <buffer> q :q<cr>
  au FileType qf nnoremap <buffer> q :q<cr>
  au FileType qf set nowinfixheight

  au FileType qf setlocal stl=%t%{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}\ %=\ %l\ of\ %L
  au FileType ref-* nnoremap <buffer> q :q<cr>
augroup END

augroup vim_tweaks
  au VimResized * :wincmd =
  au CmdwinEnter * nnoremap <buffer> <CR> <CR>
augroup END

" source vimrc on save
augroup vimrc
  au!
  au BufWritePost *vimrc{,.local} if filereadable(expand('%'))|execute 'source ' . expand('%')|endif
augroup END

if filereadable(expand($MYVIMRC . ".local"))
  source $MYVIMRC.local
endif

augroup diff_update
  au!
  au BufWritePost * if &diff == 1 | diffupdate | endif
augroup END

" highlight ExtraWhitespace only after entering insert mode
if hlID('ExtraWhitespace') == 0
  hi link ExtraWhitespace StatusLineNC
endif

augroup extra_whitespace
   au!
  au BufNewFile,BufRead,InsertLeave * silent! match ExtraWhitespace /\s\+$/
  au InsertEnter * silent! match ExtraWhitespace /\s\+\%#\@<!$/
augroup END

augroup auto_open_quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* nested below cwindow
    autocmd QuickFixCmdPost    l* nested below lwindow
augroup END

" }}}

" Per-language config {{{
let g:perl_compiler_force_warnings = 0
augroup filetype_options
  au!
  au BufReadPost * setlocal path=**

  au FileType haskell setlocal makeprg=ghc\ -e\ :q\ %
  au FileType haskell setlocal errorformat=
                    \%-G,
                    \%-Z\ %#,
                    \%W%f:%l:%c:\ Warning:\ %m,
                    \%E%f:%l:%c:\ %m,
                    \%E%>%f:%l:%c:,
                    \%+C\ \ %#%m,
                    \%W%>%f:%l:%c:,
                    \%+C\ \ %#%tarning:\ %m,

  au FileType ledger set commentstring=;%s
  au FileType ledger set foldmethod=manual
  au FileType perl compiler perl
  au FileType perl setlocal makeprg=perl\ -w\ -Mstrict\ -c\ %

  au FileType perl
        \ let b:endwise_addition = '}' |
        \ let b:endwise_words = 'if,else,sub,while,for,foreach,unless,elsif' |
        \ let b:endwise_syngroups = 'perlConditional,perlFunction,perlRepeat'
  au FileType perl let b:dispatch = 'perl -wc %'
  au FileType perl set iskeyword-=:

  au FileType perl nnoremap <silent><buffer> ]m m':call search('^\s*sub\>', "W")<CR>
  au FileType perl nnoremap <silent><buffer> ]] m':call search('^\s*sub\>', "W")<CR>
  au FileType perl nnoremap <silent><buffer> [m m':call search('^\s*sub\>', "bW")<CR>
  au FileType perl nnoremap <silent><buffer> [[ m':call search('^\s*sub\>', "bW")<CR>
  au FileType perl set foldmethod=indent

  " shell-style comments in json
  au FileType json set commentstring=#%s
  au FileType json syn match jsonComment /#.*/
  au FileType json hi link jsonComment Comment

  if executable('jshint')
     au FileType javascript setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
     au FileType javascript setlocal makeprg=jshint\ %
  endif
  au FileType javascript syntax region  javaScriptStringT start=+`+ skip=+\\\(`\|$\)+  end=+`\|$+
  au FileType javascript hi link javaScriptStringT		String
  au FileType javascript
        \ let b:endwise_addition = '}' |
        \ let b:endwise_words = '{' |
        \ let b:endwise_pattern = '{$' |
        \ let b:endwise_syngroups = 'javaScriptBraces'

  au FileType r set commentstring=#%s
  au FileType r
        \ let b:endwise_addition = '}' |
        \ let b:endwise_words = 'function,for' |
        \ let b:endwise_syngroups = 'rType,rRepeat'

  au FileType tracwiki setlocal shiftwidth=2 tabstop=2
  au FileType tracwiki set commentstring={{{#!comment#%s}}}
  au FileType tracwiki syn clear tracDefList
  au FileType tracwiki syn match tracDefList "^\s.\+::$"

  au FileType erlang set commentstring=%\ %s
  au FileType mail set noexpandtab
  au BufReadPost fugitive://* set bufhidden=delete
  au FileType gitcommit setlocal spell
  au BufReadPost *vimrc* setlocal foldmethod=marker
  au BufWinEnter *.md set ft=markdown
  au FileType markdown syn clear markdownItalic | syn clear markdownError
  au BufWinEnter *.conf set ft=conf
augroup END
" }}}

