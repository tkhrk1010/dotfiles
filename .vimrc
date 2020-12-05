" dein -----------------------------------------------------------------------
"dein.vim dark power
let s:dein_dir = expand('~/dotfiles/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

set nocompatible
" dein.vim をインストールしていない場合は自動インストール
if !isdirectory(s:dein_repo_dir)
  echo "install dein.vim..."
  execute '!git clone git://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

"---------------------------
" Start dein.vim Settings.
"---------------------------

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/dotfiles/dein')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOMLファイルにpluginを記述
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" 未インストールを確認
if dein#check_install()
  call dein#install()
endif

"---------------------------
" End dein.vim Settings.
"---------------------------
" dein -------------------------------------------------------------------

" ripgrep -----------------------------------------
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
\ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
\ : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
\ <bang>0)
"-------------------------------------------------


" color scheme ------------
syntax enable
"colorscheme dracula
"--------------------------
" 行を表示
set number
" clipboardに自動コピー
set clipboard=unnamed,autoselect
" backspaceを有効にする
set backspace=indent,eol,start

" code jumpする際に動作不良を防ぐ
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis

"ステータスラインを表示するウィンドウを設定する
"2:常にステータスラインを表示する
set laststatus=2

" ruby -----------------------------
" 挿入モードでTABを挿入するとき、代わりに適切な数の空白を使う
set expandtab
" 新しい行を開始したとき、新しい行のインデントを現在行と同じにする
set autoindent
set smartindent
" Enable rufo (RUby FOrmat)
let g:rufo_auto_formatting = 1
" = を縦に揃えたりするためのplugin
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"-----------------------------------

