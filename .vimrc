"vi との互換性OFF
if !&compatible
  set nocompatible
endif

filetype on

call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'fuenor/qfixhowm'
Plug 'vimwiki/vimwiki'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bronson/vim-trailing-whitespace'
Plug 'aklt/plantuml-syntax'
Plug 'ryanoasis/vim-devicons'
Plug 'kazuph/previm', { 'branch': 'feature/add-plantuml-plugin' }
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'thinca/vim-quickrun'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-surround'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

"python3を使う
if has('python3')
endif


"ycm setup
"-------------------------------------------------
let $PATH = "~/.pyenv/shims:".$PATH
let g:ycm_global_ycm_extra_conf = '${HOME}/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1 "自動起動
let g:ycm_min_num_of_chars_for_completion = 3 "補完機能が起動するのにユーザーが入力する文字数の最小
let g:ycm_autoclose_preview_window_after_insertion = 1 "1に設定するとvimのインサートモード抜けた後にプレビュー自動閉じる
set splitbelow

"ale setup
"-------------------------------------------------
"有効にするlinter
let g:ale_linters = {
\ 'python': ['pylint'],
\}
" 保存時のみ実行する
let g:ale_lint_on_text_changed = 0
" 表示に関する設定
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass
" Ctrl + kで次の指摘へ、Ctrl + jで前の指摘へ移動
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"-------------------------------------------------

"jedi-vim setup
"-------------------------------------------------
let g:jedi#force_py_version = 3
autocmd FileType python setlocal completeopt-=preview
"-------------------------------------------------

"NERDTree setup
"-------------------------------------------------
nnoremap <silent><c-e> :NERDTreeToggle<CR> "Ctrl+eでNERDTreeを起動する
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" フォルダアイコンの表示をON
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
nnoremap <silent><c-e> :NERDTreeToggle<CR> "Ctrl+eでNERDTreeを起動する
"-------------------------------------------------

let g:plantuml_executable_script = "~/dotfiles/plantuml"

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
let g:indent_guides_color_change_percent = 50
let g:indent_guides_guide_size = 1
'
let g:vimwiki_list = [{'path':'~/Dropbox/vimwiki/'}, {'gohome':'tabe'}]

"Howmコマンドキーマップ
let QFixHowm_Key = 'g'
set runtimepath+=~/path/to/qfixapp
"Dropboxフォルダに howmフォルダを作るように howm_dir を設定する
let howm_dir = '~/Dropbox/howm'
"Html出力先
let HowmHtml_htmldir = '/Dropbox/howm/html_dir'
" QfixHowm + Markdown
"日記ファイルをhowm_dirのDiaryに作成
let QFixHowm_DiaryFile = 'diary/%Y/%m/%Y-%m-%d-000000.mkd'

let howm_fileencoding		= 'utf-8'
let howm_fileformat		= 'unix'
let QFixHowm_HowmMode		= 0
let QFixHowm_Title		= '##'
"let QFixHowm_Title		= '='
let suffix			= 'mkd'
let QFixHowm_UserFileType	= 'markdown'
let QFixHowm_UserFileExt	= suffix
let howm_filename		= '%Y%m%Y-%m-%d-%H%M%S.' .suffix

set laststatus=2
set statusline=%-(%f%m%h%q%r%w%)%=%{&ff}\|%{&fenc}\ %y%l,%c\ %0P

set showtabline=2
set t_Co=256
let g:airline_theme = 'papercolor'

"タブを有効にする
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
	\ '0': '0 ',
	\ '1': '1 ',
	\ '2': '2 ',
	\ '3': '3 ',
	\ '4': '4 ',
	\ '5': '5 ',
	\ '6': '6 ',
	\ '7': '7 ',
	\ '8': '8 ',
	\ '9': '9 '
	\}

"タブ移動のショートカット
"nmap <C-p> <Plug>AirlineSelectPrevTab
"nmap <C-n> <Plug>AirlineSelectNextTab

nmap gT <Plug>AirlineSelectPrevTab
nmap gt <Plug>AirlineSelectNextTab

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
 
"左側に使用されるセパレータ
let g:airline_left_sep = '»'
let g:airline_left_alt_sep = '⮁'
"右側に使用されるセパレータ
let g:airline_right_sep = '«'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.crypt = '🔒'		"暗号化されたファイル
let g:airline_symbols.linenr = '¶'			"行
let g:airline_symbols.maxlinenr = '㏑'		"最大行
let g:airline_symbols.branch =  '⎇'   "gitブランチ
let g:airline_symbols.paste = 'ρ'			"ペーストモード
let g:airline_symbols.spell = 'Ꞩ'			"スペルチェック
let g:airline_symbols.notexists = '∄'		"gitで管理されていない場合
let g:airline_symbols.whitespace = 'Ξ'	"空白の警告(余分な空白など)

	augroup PrevimSettings
		autocmd!
		autocmd BufNewFile,BufRead *. {pu, md, mdwn, mkd, mkdn, mark*, wiki, adoc} set filetype=markdown
	augroup END
let g:previm_disable_default_css = 1
"let g:previm_custom_css_path = '~/pukiwiki.css.php'
" リアルタイムにプレビューする
let g:previm_enable_realtime = 1
'

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

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
set wildmenu wildmode=list:full  "補完候補を表示する
set clipboard=unnamedplus "クリップボードをWindowsと連携
set autowrite "自動保存
set autoindent "新しい行のインデントを現在行と同じにする
set smartindent
set shiftwidth=2 "オートインデントでずれる幅
set tabstop=2 "画面上でタブ文字が占める幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set expandtab "タブ入力を複数の空白入力に置き換える。
autocmd InsertLeave * set iminsert=0 imsearch=0  "IME関係

"表示関係
syntax on       "文字に色を付ける
set number      "行番号表示
set ruler       "ルーラー表示(ステータスライン変えてるから意味ない)
"set title       "ウィンドウのタイトルを書き換える
set cursorline  "カーソル行を強調表示
set hlsearch     "検索結果をハイライト
set showmode     "現在のモードを表示
set ambiwidth=double "◯や■があってもズレないようにする。
set matchpairs+=（:）,「:」,『:』,【:】,［:］,＜:＞ "日本語の文書構造に対応

colorscheme molokai

let g:molokai_original = 1
let g:rehash256 = 1
set background=dark

highlight Normal ctermbg=none
highlight Visual term=reverse ctermbg=22 guifg=#008800

highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight SpecialKey ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

"set background=dark
"set list  "改行コードを表示する
set hidden "バッファを保存しなくても他のバッファを表示できるようにする
set wildmenu "コマンド補完を便利に
set showcmd "タイプ途中のコマンドを画面最下行に表示

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

"fzf setting
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

"command-line completion(補完候補の表示)
set wildmenu
set wildmode=list:longest

