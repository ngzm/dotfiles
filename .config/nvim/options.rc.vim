" --------------------------
" 表示設定 
" --------------------------

" 行番号を表示
set number

" タイトルを表示
set title

" ルーラ表示
set ruler

" 対応する括弧をハイライト
set showmatch

" カーソル行の背景色を変える --> カーソルが遅くなるので設定しない
set nocursorline

" ステータス行を常に表示
set laststatus=2

" メッセージ表示欄を2行確保
""set cmdheight=2

" --------------------------
" インデント関連 
" --------------------------

"タブ入力を複数の空白入力に置き換える
set expandtab

" タブストップ数
set tabstop=2

" 連続空白でカーソルが動く数
set softtabstop=2

"自動インデントでずれる幅
set shiftwidth=2

" オートインデント有効
set autoindent

" 行末尾に合わせて改行時のインデントを増減
set smartindent

" --------------------------
" 検索および置換設定
" --------------------------

" 検索文字列のハイライト
set hlsearch

" インクリメンタルサーチ
set incsearch

" 大文字と小文字を区別しない
set ignorecase

" 大文字と小文字が混在した検索ワードの場合に限り大文字と小文字を区別
set smartcase

" 最後尾 --> 先頭に移る
set wrapscan

" --------------------------
" 文字コード設定
" --------------------------

" vim 内部の文字コード
set encoding=utf-8

" ファイルエンコーディング判別用
set fileencodings=utf-8,cp932,sjis,euc-jp,iso-2022-jp

" ファイル形式判別用
set fileformats=unix,dos,mac

" --------------------------
" ファイル操作関連
" --------------------------

" ファイルが編集中の場合、終了時に保存するか破棄するか確認
set confirm

" 編集中のファイルがあるときでも別ファイルを開ける
set hidden

" 外部でファイルに変更がされた時にロードしなおす
set autoread

" ファイル保存時のバックアップファイルを作らない
set nobackup

" ファイル編集中にスワップファイルを作らない
set noswapfile

" undoファイル保存を無効化
set noundofile

" --------------------------
" コマンドライン操作関連
" --------------------------

" TABキーによるファイル名一覧表示
set wildmenu
set wildmode=list:longest,full

" コマンドラインの履歴数
set history=10000

" --------------------------
"  OS環境との操作関連
" --------------------------

" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set clipboard=unnamed,unnamedplus

" マウスの入力を受け付ける
set mouse=a
