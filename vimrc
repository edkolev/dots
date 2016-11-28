
" Plugins {{{

if empty(glob('~/.vim/autoload/plug.vim'))
  !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'w0ng/vim-hybrid'
Plug 'jonathanfilip/vim-lucius'
Plug 'jnurmine/Zenburn'
Plug 'vim-scripts/jellybeans.vim'
Plug 'vim-scripts/wombat256.vim'
Plug 'junegunn/seoul256.vim'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'reedes/vim-colors-pencil'
Plug 'owickstrom/vim-colors-paramount'
Plug 'robertmeta/nofrils'
Plug 'ewilazarus/preto'
Plug 'JarrodCTaylor/spartan'
Plug 'fxn/vim-monochrome'
Plug 'pbrisbin/vim-colors-off'
Plug 'zeis/vim-kolor'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-obsession', { 'on': 'Obsession' }
Plug 'tpope/vim-tbone', { 'on': [ 'Tyank', 'Tput', 'Twrite' ] }
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-haystack'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'edkolev/promptline.vim', { 'on': 'PromptlineSnapshot' }
Plug 'vim-scripts/tracwiki', { 'for': 'tracwiki' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'moll/vim-bbye'
Plug 'elzr/vim-json'
Plug 'edkolev/tmuxline.vim', { 'on': 'Tmuxline' }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tommcdo/vim-lion'
Plug 'tommcdo/vim-exchange'
Plug 'AndrewRadev/linediff.vim'
let g:linediff_buffer_type = 'scratch'
Plug 'pydave/renamer.vim'
" Plug 'tpope/vim-scriptease'
Plug 'thinca/vim-qfreplace'
Plug 'AndrewRadev/inline_edit.vim'
Plug 'vim-scripts/DirDiff.vim', { 'on': 'DirDiff' }
Plug 'Wolfy87/vim-expand'
Plug 'thinca/vim-ref'
Plug 'nicwest/QQ.vim', { 'on': 'QQ' }
Plug 'vim-scripts/LargeFile'
Plug 'itchyny/vim-haskell-indent', { 'for': 'haskell' }
Plug 'ledger/vim-ledger', { 'for': 'ledger' }
Plug 'justinmk/vim-dirvish'
Plug 'junegunn/rainbow_parentheses.vim', { 'for': 'clojure' }
Plug 'vim-perl/vim-perl'

Plug '~/.vim/src/vim-curry', { 'for': 'haskell' }
Plug '~/.vim/src/vim-funs'

call plug#end()

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

let g:goyo_width = '40%'
let g:goyo_height = '100%'

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
set complete=.,b,u
set wildmode=list:full,full
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
let &showbreak='⤷ '
set fillchars=""
if has('linebreak')
   set breakindent
   set breakindentopt=shift:2
endif

set exrc
set secure
set wrapscan
set lazyredraw

set foldopen-=block
set foldlevelstart=99
set foldminlines=0

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

fun! s:CycleBuffers(go_forward) abort
   let bnr1 = bufnr('%')
   let bnr2 = bnr1

   while bnr1 == bnr2 && bnr2 > 0
      if a:go_forward
         normal! "\<c-v>\<c-i>"
      else
         normal! "\<c-o>"
      endif
      let bnr2 = bufnr('%')
   endwhile
endfun

nmap <silent> ]b :call <SID>CycleBuffers(1)<cr>
nmap <silent> [b :call <SID>CycleBuffers(0)<cr>

fun! s:jumpToPreviousEdit(go_forward) abort
   let jump_command = "norm! " . (a:go_forward ? "g," : "g;")
   let line = line('.')

   try
      execute jump_command
      let line2 = line('.')
      while (abs(line2 - line) < 5)
         execute jump_command
         let line2 = line('.')
      endwhile
      echo
   catch /^Vim\%((\a\+)\)\=:E662/
		echohl WarningMsg | echo "At start of changelist"| echohl None
   catch /^Vim\%((\a\+)\)\=:E663/
		echohl WarningMsg | echo "At end of changelist"| echohl None
   catch /^Vim\%((\a\+)\)\=:E664/
		echohl WarningMsg | echo "Changelist is empty"| echohl None
   catch
		echohl ErrorMsg | echo v:exception | echohl None
   endtry
endfun

nnoremap <expr> [c &diff ? "[c" : ":call <sid>jumpToPreviousEdit(0)<cr>"
nnoremap <expr> ]c &diff ? "]c" : ":call <sid>jumpToPreviousEdit(1)<cr>"

vnoremap . :normal .<CR>

nnoremap !! :!!<cr>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" like <c-w>, but for the whole line
cnoremap <C-l> <C-r>=getline('.')<CR>

nmap # :%s///ng<CR>
nmap <leader>D :%s///g<CR>

nnoremap <leader>w :vsplit<cr>
nnoremap <expr> <silent> <cr> &modifiable ? ":update<cr>" : "<cr>"

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

" <c-r>/ in insert and command mode should not insert encolsing <\...\> and \V
inoremap <silent> <c-r>/ <c-r>=substitute(substitute(@/, '\v^\\\<(.+)\\\>$', '\1', ''), '\\V', '', '')<cr>
cnoremap <c-r>/ <c-r>=substitute(substitute(@/, '\v^\\\<(.+)\\\>$', '\1', ''), '\\V', '', '')<cr>

" toggle iwhite diffopt
nnoremap co<space> :set <C-R>=(&diffopt =~# 'iwhite') ? 'diffopt-=iwhite' : 'diffopt+=iwhite'<CR><CR>

nmap Y y$

map Q gq

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

vnoremap <silent> *  :<C-u>call <SID>VSetSearch()<CR>:set hlsearch<CR>:call <SID>EchoMatchCount()<CR>
vnoremap <silent> g* :<C-u>call <SID>VSetSearch()<CR>:set hlsearch<CR>:call <SID>EchoMatchCount()<CR>
vnoremap <silent> K  :<C-u>call <SID>VSetGrepSearch()<CR>: set hlsearch<CR>
nnoremap <silent> *  :call <SID>SetSearch(expand("<cword>"), 1)<CR>:set hlsearch<CR>:call <SID>EchoMatchCount()<CR>
nnoremap <silent> g* :call <SID>SetSearch(expand("<cword>"), 0)<CR>:set hlsearch<CR>:call <SID>EchoMatchCount()<CR>
nnoremap <silent> K  :call <SID>SetGrepSearch(expand("<cword>"))<CR>: set hlsearch<CR>

nnoremap <silent> gK :lgrep! "<C-R><C-W>"<CR>:lw<CR>
command! -range=% -nargs=0 ChompWhitespace mark ` | execute <line1> . ',' . <line2> . 's/\s\+$//' | normal! ``

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
vnoremap gn :normal 

nnoremap <silent> gm :silent make \| redraw!<cr>
nnoremap gM :make!<cr>

nnoremap <silent> c* :set hls<cr>*Ncgn

" 'entire' text object
xnoremap ie GoggV
onoremap ie :<C-u>normal vie<CR>

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
  call map( oldfiles, 'fnamemodify( v:val, ":." )' )
  call filter( oldfiles, 'filereadable( v:val )' )
  call filter( oldfiles, 'v:val !~ "^/" && v:val !~ "^\\."' )
  return oldfiles
endfunction

function! s:CompareFileModTime(a, b)
  let a = getftime(a:a)
  let b = getftime(a:b)
  return a == b ? 0 : a < b ? 1 : -1
endfunc

function! s:bufferCompletionFunction(lead, cmdline, _) abort
  let buffers = GetBufferFileNames()
  let old_buffers = GetOldFileNames()
  call extend(buffers, old_buffers)

  let cfile = fnamemodify( bufname(bufnr('%')), ":." )
  call uniq(sort(filter(buffers, 'v:val !=# "' . cfile . '"' ), 's:CompareFileModTime'))

  let filtered = haystack#filter(buffers, a:lead)

  call sort(buffers, 's:CompareFileModTime')
  return filtered
endfunction

function! s:filesCompletionFunction(lead, cmdline, _) abort
  let files = systemlist('ag -l')
  return haystack#filter(files, a:lead)
endfunction

command! -bar -bang -nargs=* -complete=customlist,<sid>bufferCompletionFunction B :silent! edit <args>
command! -bar -bang -nargs=* -complete=customlist,<sid>filesCompletionFunction Files :silent! edit <args>
nmap <space> :B 
nmap g<space> :Files 

fun! s:ExchangeWindows(direction) abort
   let wnr1 = winnr()
   let bnr1 = bufnr('%')
   let wview1 = winsaveview()

   exec "wincmd " . a:direction
   let wnr2 = winnr()
   let bnr2 = bufnr('%')
   let wview2 = winsaveview()

   if wnr1 == wnr2
      return
   endif

   if bnr1 == bnr2
      call winrestview(wview1)
      wincmd p
      call winrestview(wview2)
   else
      exec wnr1 . "wincmd w"
      exec 'hide buf' bnr2
      call winrestview(wview2)

      exec wnr2 . "wincmd w"
      exec 'hide buf' bnr1
      call winrestview(wview1)

      exec wnr1 . "wincmd w"
   endif
endfun

nmap <silent> <c-w>h :call <sid>ExchangeWindows('h')<cr>
nmap <silent> <c-w>j :call <sid>ExchangeWindows('j')<cr>
nmap <silent> <c-w>k :call <sid>ExchangeWindows('k')<cr>
nmap <silent> <c-w>l :call <sid>ExchangeWindows('l')<cr>

" syntax group under the cursor
nmap zS :echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')<cr>

" }}}

" Auto Commands {{{
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * if !&diff | setlocal cursorline | endif
  au WinLeave * setlocal nocursorline
augroup END

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
    autocmd QuickFixCmdPost grep,make nested below cwindow
    autocmd QuickFixCmdPost lgrep,lmake nested below lwindow
augroup END

" }}}

" Per-language config {{{
let g:perl_compiler_force_warnings = 0
let g:perl_sub_signatures=1
augroup filetype_options
  au!

  au FileType haskell iabbrev <buffer> undef undefined
  au FileType haskell iabbrev <buffer> und undefined
  au FileType haskell setlocal iskeyword+='
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
  au FileType ledger setlocal foldmethod=manual
  au FileType perl compiler perl
  au FileType perl setlocal makeprg=perl\ -w\ -Mstrict\ -c\ %

  au FileType perl
        \ let b:endwise_addition = '}' |
        \ let b:endwise_words = 'if,else,sub,while,for,foreach,unless,elsif' |
        \ let b:endwise_syngroups = 'perlConditional,perlFunction,perlRepeat'
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
  au FileType gitcommit setlocal spell
  au BufReadPost *vimrc* setlocal foldmethod=marker
  au BufWinEnter *.md set ft=markdown
  au FileType markdown syn clear markdownItalic | syn clear markdownError
  au BufWinEnter *.conf set ft=conf
augroup END
" }}}

