"vi との互換性OFF
set nocompatible
filetype off            " for NeoBundle
 
if has('vim_starting')
        set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'
 
" ここから NeoBundle でプラグインを設定します
"  
"  " NeoBundle で管理するプラグインを追加します。
"  NeoBundle 'Shougo/neocomplcache.git'
"  NeoBundle 'Shougo/unite.vim.git'

NeoBundle 'Shougo/neocomplete.vim'  
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser'
NeoBundle 'fuenor/qfixhowm'
".mdなどのvimのMarkdownテキストを開いたらvimにMarkdown形式と認識させ、シンタックスハイライトを行うプラグイン
NeoBundle 'Markdown'
NeoBundle 'vim-scripts/vimwiki'
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-scripts/VOom'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
call neobundle#end()

" ファイル形式検出、プラグイン、インデントを ON
filetype plugin indent on       " restore filetype

" neocomplete setting
let g:neocomplete#enable_at_startup = 1
" previm setting
let g:previm_open_cmd = 'open -a Google\ Chrome'


"qfixhown setting
set runtimepath+=~/path/to/qfixapp
"Dropboxフォルダに howmフォルダを作るように howm_dir を設定する
let howm_dir = '~/Dropbox/howm'
"Html出力先
let HowmHtml_htmldir = '/Dropbox/howm/html_dir'
" QfixHowm + Markdown
let QfixHowm_HowmMode		= 0
let QfixHowm_Title		= '#'
let suffix			= 'mkd'
let QfixHowm_UserFileType	= 'markdown'
let QfixHowm_UserFileExt	= suffix
let howm_filename		= '%Y%m%Y-%m-%d-%H%M%S.' .suffix

"airline setting
set laststatus=2
let g:airline_section_a = airline#section#create(['mode','','branch'])
let g:airline_powerline_fonts = 1
set guifont=Ricty\ Regular\ for\ Powerline:h14
let g:Powerline_symbols = 'fancy'
let g:airline_theme = 'molokai'
set t_Co=256
"let g:airline#extensions#tabline#enabled = 1

let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'

"ファイル形式の検出on/off
filetype plugin on

"拡張子をmarkdownと認識させる
autocmd BufRead,BufNewFile *.mkd  setfiletype markdown
autocmd BufRead,BufNewFile *.md  setfiletype markdown

autocmd CursorHold *  wall
autocmd CursorHoldI *  wall

"############
"標準形
"############
"入力関係
set backspace=indent,eol,start  "BSでなんでも消せるようにする
set autoindent  "新しい行のインデントを現在行と同じにする
set smartindent
set showmatch "綴じ括弧の入力時に対応する括弧を表示する。
""閉じ括弧が入力されたとき、対応する括弧を表示する
set wildmenu    "補完候補を表示する
set clipboard+=unnamed   "クリップボードをWindowsと連携
set autowrite "自動保存
set autoindent "オートインデント

"表示関係
syntax on       "文字に色を付ける
set number      "行番号表示
set ruler       "ルーラー表示(ステータスライン変えてるから意味ない)
set title       "ウィンドウのタイトルを書き換える
set cursorline  "カーソル行を強調表示
set hlsearch     "検索結果をハイライト
set showmode     "現在のモードを表示
colorscheme elflord 
"set list       "改行コードを表示する
set hidden "バッファを保存しなくても他のバッファを表示できるようにする
set wildmenu "コマンド補完を便利に
set showcmd "タイプ途中のコマンドを画面最下行に表示

"□や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double

