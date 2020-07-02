syntax on 

colorscheme iceberg

" band-aid solution
" https://github.com/neovim/neovim/issues/11393
" cnoremap 3636 <c-u>undo<CR>

" カレント行ハイライトon
set cursorline

set termguicolors

" yankした内容をクリップボードに
set clipboard=unnamed

" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
" ファイルを上書きする前にバックアップを作ることを無効化
set nobackup
" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start
" 全角文字専用の設定
set ambiwidth=double
" wildmenuオプションを有効(vimバーからファイルを選択できる)
set wildmenu

"----------------------------------------
" 検索
"----------------------------------------
" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索結果をハイライト表示
set hlsearch

"----------------------------------------
" 表示設定
"----------------------------------------
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" Windowsでパスの区切り文字をスラッシュで扱う
set shellslash
" 対応する括弧やブレースを表示
set showmatch matchtime=1
" インデント方法の変更
set cinoptions+=:0
" メッセージ表示欄を2行確保
set cmdheight=2
" ステータス行を常に表示
set laststatus=2
" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd
" 省略されずに表示
set display=lastline
" タブ文字を CTRL-I で表示し、行末に $ で表示する
set list
" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~
" コマンドラインの履歴を10000件保存する
set history=10000
" コメントの色を水色
hi Comment ctermfg=3
" 入力モードでTabキー押下時に半角スペースを挿入
set expandtab
" インデント幅
set shiftwidth=2
" タブキー押下時に挿入される文字幅を指定
set softtabstop=2
" ファイル内にあるタブ文字の表示幅
set tabstop=2
" ツールバーを非表示にする
set guioptions-=T
" yでコピーした時にクリップボードに入る
set guioptions+=a
" メニューバーを非表示にする
set guioptions-=m
" 右スクロールバーを非表示
set guioptions+=R
" 対応する括弧を強調表示
set showmatch
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" スワップファイルを作成しない
set noswapfile
" 検索にマッチした行以外を折りたたむ(フォールドする)機能
set nofoldenable
" タイトルを表示
set title
" 行番号の表示
set number
" 相対行番号を有効にする
set relativenumber
" 補完オフ
" autocmd WinEnter README,*.go :DisableAcp
" autocmd WinLeave README,*.go :EnableAcp
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
" すべての数を10進数として扱う
" set nrformats=
" 行をまたいで移動
"set whichwrap=b,s,h,l,<,>,[,],~
" バッファスクロール
" マウスで操作可能に
set mouse=a
" 日本語
lang en_US.UTF-8

" C-z でEsc
inoremap <C-z> <Esc>
vnoremap <C-z> <Esc>

" Shift + j,kで移動距離10倍
nnoremap <S-k> 10<UP>
nnoremap <S-j> 10<DOWN>

vnoremap <S-k> 10<UP>
vnoremap <S-j> 10<DOWN>

" ショートカット
" 削除キーでyankしない
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D

" C-eで文末移動
" 挿入モード時
inoremap <C-e> <Esc>$a
inoremap <C-a> <Esc>I

" 標準モード時
noremap <C-e> <Esc>$
noremap <C-a> <Esc>^

" 入力モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

" tn 次のタブ
map <silent> <C-l> :bnext<CR>
" tp 前のタブ
map <silent> <C-h> :bprev<CR>


" ビルド(makeなど)したらファイルを自動保存
set autowrite

" vim起動時の変な文字列の表示をなくす？
" https://github.com/neovim/neovim/issues/5990
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

" pythonの設定
let g:python_host_prog  = '/Users/mimaken/.pyenv/shims/python2'
let g:python3_host_prog = '/Users/mimaken/.pyenv/shims/python3'

" dein
if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0}) " 追加
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1}) " 追加
  call dein#end()
  call dein#save_state()
endif
" pluginのinstallを自動化
if dein#check_install()
  call dein#install()
endif
filetype plugin indent on
syntax enable

" Go補完の設定
" https://github.com/deoplete-plugins/deoplete-go
"
" neocomplete like
" set completeopt+=noinsert
" deoplete.nvim recommend
" set completeopt+=noselect

" Path to python interpreter for neovim
let g:python3_host_prog  = '/Users/mimaken/.pyenv/shims/python3'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

" Run deoplete.nvim automatically
" let g:deoplete#enable_at_startup = 1
" deoplete-go settings
" let g:deoplete#sources#go#gocode_binary = '/Users/mimaken/go/bin/gocode'
" let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

