"treeを開く
nnoremap <silent><C-e> :NERDTreeToggle<CR>


" zenhanをwindows側に入れパスも通っている前提
" インサートモードを離れた時、zenhan.exeを使ってIMEをオフにする
if has('win32') || has('win64')
  let s:zenhan = 'zenhan.exe'
  autocmd InsertLeave * :call system(s:zenhan . ' 0')
elseif has('unix') || has('mac') || has('macunix')
  let s:zenhan = '${zenhan}'
  autocmd InsertLeave * call system(s:zenhan . ' 0')
  autocmd CmdlineLeave * call system(s:zenhan . ' 0')
endif

" リーダーキーをスペースに設定
let g:mapleader = "\<Space>"

" 各OSでクリップボードを利用可能にする
if has('win32') || has('win64')
  set clipboard=unnamed,autoselect
elseif has('unix') || has('mac') || has('macunix')
  set clipboard=unnamedplus,autoselect
endif

" jjでesc
inoremap jj <ESC>
inoremap ｊｊ <ESC>
inoremap っｊ <ESC>

" 表示行での移動にする
nnoremap j gj
nnoremap k gk

" dscはヤンクさせない
nnoremap d "_d
xnoremap d "_d
nnoremap dd "_dd
nnoremap D "_D
xnoremap D "_D
nnoremap s "_s
xnoremap s "_s
xnoremap S "_S
nnoremap c "_c
xnoremap c "_c
nnoremap C "_C
xnoremap c "_C

" 選択状態でのxは切り取り用
nnoremap x "_x
nnoremap X "_X

" ddも削除。コピーしたいときはvisualモード
nnoremap dd "_dd

" カーソル下の単語を、置換後の文字列の入力を待つ状態にする
nnoremap <C-g> :%s;\<<C-R><C-W>\>;g<Left><Left>;

" Ctrl + j と Ctrl + k で 段落の前後に移動
nnoremap <C-j> }
nnoremap <C-k> {

" コマンド候補
set wildmenu
set noswapfile
set showcmd

" 文字コード
set fileencoding=utf-8
set encoding=utf-8

" 行番号
set number

" 表示
set cursorline
set syntax=enable
set hlsearch
noremap <ESC><ESC> :nohlsearch<CR><ESC>

" タブを2文字に設定
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent

" 検索
set ignorecase
set smartcase
set incsearch

" その他
set showmatch

" バッファ削除時に保存されていないバッファを閉じる
set hidden

" タイトルを出す
set title
set laststatus=2

" その他バックアップ
set nobackup
set noswapfile
set autoread 
set showcmd 

" 行末まで移動可能
set virtualedit=onemore

" undo永続化
if has('persistent_undo')
	let undo_path = expand('~/.vim/undo')
  if !isdirectory(undo_path)
    call mkdir(undo_path, 'p')
  endif
	exe 'set undodir=' .. undo_path
	set undofile
endif

"" dein.vimの自動インストールと設定
let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE . '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(
        \ fnamemodify(s:dein_dir, ':p') , '/$', '', '')
endif

" dein.vimの設定
if dein#load_state($CACHE . '/dein')
  call dein#begin($CACHE . '/dein')

  " プラグインリスト toml形式でも良い)
  call dein#add('Shougo/dein.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('preservim/nerdtree')
  call dein#add('junegunn/fzf')
  call dein#add('whatyouhide/vim-gotham')
  call dein#add('obcat/vim-hitspop')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-commentary')
  call dein#add('gosukiwi/vim-smartpairs')
  call dein#add('dominikduda/vim_current_word')
Lokaltog/vim-easymotion
  " 必要なプラグインを追加
  call dein#end()
  call dein#save_state()
endif

" 未インストールのプラグインがあればインストール
if dein#check_install()
  call dein#install()
endif
