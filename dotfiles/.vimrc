";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
" .vimrc設定
"
" @filename .vimrc
" @category Configs
" @package  ConfigsVimrc
" @author   fromearth
" @link     https://github.com/fromearth
";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 設定 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
let s:_encoding = 'utf-8'   " 新規ファイルencoding {'utf-8' or 'cp932'}
let s:_fileformat = 'unix'  " 新規ファイル改行方式 {'unix' or 'dos'}
let s:_indentwidth = 4      " インデント幅   {2 or 4}
let s:_indentchar = 'space' " インデント文字 {'space' or 'tab'}
";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


" 使用する色セット
colorscheme desert

" 文字エンコーディング関連
set encoding=cp932
set fileencoding=
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp

" 改行方式
set fileformats=dos,unix,mac

" インデント関連
set shiftwidth=4
set tabstop=4
set autoindent
set softtabstop=0
set smartindent

" タブ文字・行末スペースの可視化
set list
set listchars=tab:>-,trail:-

" バックアップファイル作成の制御
set nobackup
set noundofile

" 検索と表示
set ignorecase
set ambiwidth=double
set hlsearch

" ステータス表示フォーマット
set laststatus=2
function! GetStatusEx()
    let str = ''
    let str = str . '[' . &fileformat . ']'
    if has('multi_byte') && &fileencoding != ''
        let str = '[' . &fenc . ']' . str
    else
        let str = '[' . &enc . ']' . str
    endif
    return str
endfunction
set statusline=%y%{GetStatusEx()}%F%m%r=<%c:%l>

" Windows用設定
if has('win32')
    set guioptions-=T
    set guioptions-=m
    set guicursor=a:blinkon0
    let loaded_matchparen=1
    "クリップボードをWindowsと連携
    source $VIMRUNTIME/mswin.vim
    "最大1000行まで文字コード判定に使用
    let g:verifyenc_maxlines = 1000
    "自動改行機能Off
    set textwidth=0
    set formatoptions=q
endif


";;;;;;;;;;;;;;;;;;;;;;;;;;;;; 設定値を反映 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if exists('s:_encoding') && s:_encoding != 'cp932'
    let &encoding = s:_encoding
endif
"
if exists('s:_fileformat') && s:_fileformat == 'unix'
    set fileformats=unix,dos,mac
endif
"
if exists('s:_indentwidth') && s:_indentwidth != 4
    let &shiftwidth = s:_indentwidth
    let &tabstop = s:_indentwidth
endif
"
if exists('s:_indentchar') && s:_indentchar == 'space'
    set expandtab
endif

