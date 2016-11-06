"vi との互換性OFF
set nocompatible
filetype off            " for NeoBundle

if has('vim_starting')
        set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif

if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
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

"{{{--- lightline setting
set laststatus=2
"---}}}

" ファイル形式検出、プラグイン、インデントを ON
filetype plugin indent on       " restore filetype

"#####################################
"########## Plugin Setting ###########
"#####################################

"{{{--- neocomplete setting
let g:neocomplete#enable_at_startup = 1
"---}}}

"{{{--- previm setting
let g:previm_open_cmd = 'open -a Google\ Chrome'

	augroup PrevimSettings
		autocmd!
		autocmd BufNewFile,BufRead *. {md, mdwn, mkd, mkdn, mark*, wiki} set filetype=markdown
	augroup END

" デフォルトのCSSを使わず、独自のCSSのみ適用する
let g:previm_disable_default_css = 1
let g:previm_custom_css_path = '~/pukiwiki.css.php'
" リアルタイムにプレビューする
let g:previm_enable_realtime = 1
"---}}}

"{{{--- qfixhown setting
set runtimepath+=~/path/to/qfixapp
"Dropboxフォルダに howmフォルダを作るように howm_dir を設定する
let howm_dir = '~/Dropbox/howm'
"Html出力先
let HowmHtml_htmldir = '/Dropbox/howm/html_dir'
" QfixHowm + Markdown
"日記ファイルをhowm_dirのDiaryに作成
"let QFixHowm_DiarYFile = 'diary/%Y/%m/%Y-%m-%d-000000.mkd'

let howm_fileencoding		= 'utf-8'
let howm_fileformat		= 'unix'
let QFixHowm_HowmMode		= 0
let QFixHowm_Title		= '##'
"let QFixHowm_Title		= '='
let suffix			= 'mkd'
let QFixHowm_UserFileType	= 'markdown'
let QFixHowm_UserFileExt	= suffix
let howm_filename		= '%Y%m%Y-%m-%d-%H%M%S.' .suffix
"---}}}

"{{{--- syntastic setting
"行番号の左に表示するワーニングシンボルを設定する。
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

let g:syntastic_enable_signs=1
"1:Qfix有 2:Qfix無
let g:syntastic_auto_loc_list=1

"pythonのsyntax checkerをpylintに設定する。
let g:syntastic_python_checkers = ['pylint']
"---}}}

"{{{--- indent-guides setting
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
let g:indent_guides_color_change_percent = 50
let g:indent_guides_guide_size = 1
"---}}}


"{{{--- quickrun setting
nmap <Leader>r <plug>(quickrun)
let g:quickrun_config={'*': {'split': ''}}
set splitbelow
"---}}}
"###############################

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
set backspace=indent,eol,start  "BSでなんでも消せるようにする
set showmatch "綴じ括弧の入力時に対応する括弧を表示する。
""閉じ括弧が入力されたとき、対応する括弧を表示する
set wildmenu    "補完候補を表示する
set clipboard+=unnamed   "クリップボードをWindowsと連携
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

