"vi との互換性OFF
if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

"Start dein Scripts-------------------------
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.vim') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/.dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif

" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

"End dein Scripts-------------------------

" ファイル形式検出、プラグイン、インデントを ON
filetype plugin indent on       " restore filetype

"ファイル形式の検出on/off
filetype plugin indent on

"拡張子をmarkdownと認識させる
"autocmd BufRead,BufNewFile *.mkd  setfiletype markdown
"autocmd BufRead,BufNewFile *.md  setfiletype markdown

"autocmd CursorHold *  wall
"autocmd CursorHoldI *  wall

"#####################################
"########## 基本設定 #################
"#####################################

"############
"入力関係
set backspace=indent,eol,start "BSでなんでも消せるようにする
set showmatch "綴じ括弧の入力時に対応する括弧を表示する。
set wildmenu "補完候補を表示する
set clipboard+=unnamed "クリップボードをWindowsと連携
set autowrite "自動保存
set autoindent "新しい行のインデントを現在行と同じにする
set smartindent
set shiftwidth=2 "オートインデントでずれる幅
set tabstop=2 "画面上でタブ文字が占める幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set expandtab "タブ入力を複数の空白入力に置き換える。

"表示関係
syntax on       "文字に色を付ける
set number      "行番号表示
set ruler       "ルーラー表示(ステータスライン変えてるから意味ない)
set title       "ウィンドウのタイトルを書き換える
set cursorline  "カーソル行を強調表示
set hlsearch     "検索結果をハイライト
set showmode     "現在のモードを表示

highlight Visual term=reverse ctermbg=22 guifg=#008800
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
highlight Normal ctermbg=none

set background=dark
"set list  "改行コードを表示する
set hidden "バッファを保存しなくても他のバッファを表示できるようにする
set wildmenu "コマンド補完を便利に
set showcmd "タイプ途中のコマンドを画面最下行に表示

set ambiwidth=double "◯や■があってもズレないようにする。

"Googleカレンダーと同期する
let g:calendar_google_calendar = 1

" Enable 256 colors FORCELY on screen
if $TERM == 'screen'
    set t_Co=256
endif

" Manコマンドを:Man "コマンド名"で参照出来るようにする
runtime ftplugin/man.vim

" gcで!git と入力されるようにする
nnoremap gc :<C-u>!git<Space>

"横長コード対策(textwidthに設定した値+1の行に目印表示)
if exists('$colorcolumn')
  set colorcolumn=+1
endif
