" ###########################################
" 基本設定
" ###########################################

" --------------------------
" 表示設定 
" --------------------------

" コードの色分け 
syntax on

" 行番号を表示
set number

" タイトルを表示
set title

" ルーラ表示
set ruler

" 対応する括弧をハイライト
set showmatch

" カーソル行の背景色を変える
set cursorline

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
" set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileencodings=utf-8,cp932,sjis,euc-jp,iso-2022-jp
" set fileencodings=utf-8,sjis,euc-jp,iso-2022-jp

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
set ttymouse=xterm2

" Windows でもパスの区切り文字を / にする
" set shellslash

" --------------------------
"  Neobundle
" --------------------------

if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'

" TypeScript
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'clausreinke/typescript-tools.vim'

" Mark Down
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" カラースキーム
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/Zenburn'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'jacoborus/tender'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'ratazzi/blackboard.vim'
NeoBundle 'blackgate/tropikos-vim-theme'
NeoBundle 'blindFS/flattr.vim'
NeoBundle 'altercation/vim-colors-solarized'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" --------------------------
" NERDTree 
" --------------------------

autocmd StdinReadPre * let s:std_in=6
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-t> :NERDTreeToggle<CR>

" --------------------------
" lightline 
" --------------------------

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? '⭠ '.branch : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

" --------------------------
" neocomplcache
" --------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" --------------------------
" Unite Key Mappings
" --------------------------
nnoremap [unite] <Nop>
nmap <Space> [unite]
 
"ファイル一覧
" nnoremap <silent> [unite]f :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>

"新規ファイル作成
nnoremap <silent> [unite]fn :<C-u>Unite<Space>file/new<CR>
"
"新規ディレクトリ作成
nnoremap <silent> [unite]dn :<C-u>Unite<Space>directory/new<CR>

"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>

"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite<Space>register<CR>

"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>

"タブを表示
nnoremap <silent> [unite]t :<C-u>Unite<Space>tab<CR>

"ヒストリ/ヤンクを表示
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>

" --------------------------
" Syntastic
" --------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': ['ruby', 'javascript', 'perl'],
  \ 'passive_filetypes': [] }
let g:syntastic_perl_checkers = ['perl', 'podchecker']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_check_on_wq = 0

" --------------------------
" Mark Down
" --------------------------

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.mkd set filetype=markdown
let g:previm_open_cmd = 'open -a Firefox'
let g:vim_markdown_folding_disabled=1

" --------------------------
" Add Filetype
" --------------------------

au BufRead,BufNewFile *.ect set filetype=html
au BufRead,BufNewFile *.styl set filetype=css

" --------------------------
" カラースキーム設定
" --------------------------
" colorscheme elflord
colorscheme jellybeans
