function! MyInstallPlugins()
        let l:urls = [
\               'https://github.com/Lokaltog/vim-powerline.git',
\               'https://github.com/vim-scripts/DirDiff.vim.git',
\               'https://github.com/vim-scripts/YankRing.vim.git',
\               'https://github.com/vim-scripts/mru.vim.git',
\               'https://github.com/AndrewRadev/linediff.vim',
\               'https://github.com/vim-scripts/project.tar.gz.git',
\               'https://github.com/vim-scripts/ShowMarks.git'
\       ]
" 'https://github.com/scrooloose/nerdtree.git'
" 'https://github.com/vim-scripts/QuickBuf.git'
" 'https://github.com/Shougo/neocomplcache.git'
" 'https://github.com/Shougo/neobundle.vim.git'
" 'https://github.com/Shougo/unite.vim.git'
" 'the-nerd-commenter'
" 'https://github.com/mortice/taglist.vim.git'
" 'https://github.com/kana/vim-fakeclip.git'

        let l:dir = expand("$HOME/.vim/plugins")

        if ! isdirectory(l:dir)
                call mkdir (l:dir, "p")
        endif

        for l:u in l:urls
                let l:cmd = "!git clone " . l:u . " \"" . l:dir . "/" . substitute(fnamemodify(l:u, ":t"), ".git", "", "") . "\""
                echo l:cmd
                exe l:cmd
        endfor
endfunction

"set makeprg=make
autocmd quickfixcmdpost make,grep,grepadd,vimgrep cwin

filetype plugin indent on
syntax on
colorscheme molokai

"hi DiffAdd ctermfg=black ctermbg=2
"hi DiffChange ctermfg=black ctermbg=3
"hi DiffDelete ctermfg=black ctermbg=6
"hi DiffText ctermfg=black ctermbg=7

hi DiffAdd    ctermfg=black ctermbg=2
hi DiffChange ctermfg=black ctermbg=3
hi DiffDelete ctermfg=black ctermbg=6
hi DiffText   ctermfg=black ctermbg=7

set autoindent
set smartindent
set backspace=indent,eol,start
"set clipboard=unnamed,autoselect
set cmdheight=2
set diffopt=filler,vertical
set expandtab
set noeol
set formatoptions+=mm
set hlsearch
set ignorecase
set laststatus=2
set list
"set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
"set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set modelines=0
set nrformats=hex
set nobackup
set noswapfile
set number
set shiftwidth=4
set showcmd
set softtabstop=4
set tabstop=4
set title
"set t_co=256
set visualbell t_vb=
set wrap
set wildmenu
set whichwrap=b,s,h,l,<,>,[,],~
set viminfo+=! "for YankRing

if has("autocmd")
  autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType eruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js          setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scss        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sass        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript  setlocal sw=4 sts=4 ts=4 noet
endif

"行頭のスペースの連続をハイライトさせる
"Tab文字も区別されずにハイライトされるので、区別したいときはTab文字の表示を別に
"設定する必要がある。

function! SOLSpaceHilight()
    syntax match SOLSpace "^\s\+" display containedin=ALL
    highlight SOLSpace term=underline ctermbg=LightGray
endf

"全角スペースをハイライトさせる。
function! JISX0208SpaceHilight()
    syntax match JISX0208Space "　" display containedin=ALL
    highlight JISX0208Space term=underline ctermbg=LightCyan
endf

"syntaxの有無をチェックし、新規バッファと新規読み込み時にハイライトさせる
if has("syntax")
    syntax on
        augroup invisible
        autocmd! invisible
"        autocmd BufNew,BufRead * call SOLSpaceHilight()
        autocmd BufNew,BufRead * call JISX0208SpaceHilight()
    augroup END
endif


"=======================================
" .vimrc.local
"=======================================
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction

"================================================================================
" binary file
"================================================================================
augroup binaryxxd
  autocmd!
  autocmd bufreadpre  *.bin let &binary =1
  autocmd bufreadpost * if &binary | silent %!xxd -g 1
  autocmd bufreadpost * set ft=xxd | endif
  autocmd bufwritepre * if &binary | %!xxd -r | endif
  autocmd bufwritepost * if &binary | silent %!xxd -g 1
  autocmd bufwritepost * set nomod | endif
augroup end

"================================================================================
" japanese language
"================================================================================
set fileencodings=utf-8,cp932,euc-jp,iso-20220-jp,default,latin
"if &encoding !=# 'utf-8'
"  set encoding=japan
"  set fileencoding=japan
"endif
"if has('iconv')
"  let s:enc_euc = 'euc-jp'
"  let s:enc_jis = 'iso-2022-jp'
"
"  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'eucjp-ms'
"    let s:enc_jis = 'iso-2022-jp-3'
"  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'euc-jisx0213'
"    let s:enc_jis = 'iso-2022-jp-3'
"  endif
"
"  if &encoding ==# 'utf-8'
"    let s:fileencodings_default = &fileencodings
"    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
"    let &fileencodings = &fileencodings .','. s:fileencodings_default
"    unlet s:fileencodings_default
"  else
"    let &fileencodings = &fileencodings .','. s:enc_jis
"    set fileencodings+=utf-8,ucs-2le,ucs-2
"    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
"      set fileencodings+=cp932
"      set fileencodings-=euc-jp
"      set fileencodings-=euc-jisx0213
"      set fileencodings-=eucjp-ms
"      let &encoding = s:enc_euc
"      let &fileencoding = s:enc_euc
"    else
"      let &fileencodings = &fileencodings .','. s:enc_euc
"    endif
"  endif
"
"  unlet s:enc_euc
"  unlet s:enc_jis
"endif

if has('autocmd')
  function! AutoRecheck_fenc()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd bufreadpost * call AutoRecheck_fenc()
endif

set fileformats=unix,dos,mac
if exists('&ambiwidth')
  set ambiwidth=double
endif

"================================================================================
" plugin
"================================================================================
let tlist_ctags_cmd='/usr/local/bin/ctags'
"let tlist_use_right_window=1
"let g:srcexpl_updatetagscmd = "/usr/local/bin/ctags --sort=foldcase -r ."
let g:netrw_liststyle = 3
let g:netrw_sort_sequence = '[\/]$'
let g:neocomplcache_enable_at_startup = 1
let MRU_Max_Entries = 1000

let showmarks_enable = 1
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
if getcwd() != $HOME
  if &diff == 0
    if filereadable(getcwd().'/.vimprojects')
      runtime plugin/project.vim
      Project .vimprojects
    endif
  endif
endif


