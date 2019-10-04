" --------------------------
" basic settings
" --------------------------
runtime! options.rc.vim
runtime! mappings.rc.vim

" --------------------------
" dein.vim
" --------------------------
if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

" --------------------------
" colorscheme
" --------------------------
" solarized から文字色だけカスタマイズしたやつ
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
highlight Normal gui=NONE guifg=white guibg=NONE cterm=None ctermfg=white ctermbg=NONE
