" IMEをOFFにするコマンドを設定
" これは各種OSに合わせて個別のvimrcに記載すること
" Linux系jk
"autocmd InsertLeave * call system('${zenhan} 0')
"autocmd CmdlineLeave * call system('${zenhan} 0')
"windows系
" Linux系jk
"autocmd InsertLeave * call system('${zenhan} 0')
"autocmd CmdlineLeave * call system('${zenhan} 0')
" インサートモードを離れた時、zenhan.exeを使ってIMEをオフにする
if has('win32') || has('win64')
  let s:zenhan = 'zenhan.exe'
  autocmd InsertLeave * :call system(s:zenhan . ' 0')
endif

" リーダーキーをスペースに設定
let mapleader = " "

" クリップボードを利用可能にする
set clipboard=unnamedplus,autoselect

" 表示行での移動にする
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" 削除時はヤンクしない
nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X
nnoremap s "_s
vnoremap s "_s
nnoremap S "_S
vnoremap S "_S

" 入力中に移動したい時
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-n> <Down>
inoremap <C-p> <Up>

" Ctrl+gで:%s///g
nnoremap <C-g> :%s///<left><Left>

" コマンド候補
set wildmenu
set noswapfile
set showcmd

" 文字コード
set fileencoding=utf-8
set encoding=utf-8

" 行番号
set number

" タブを2文字に設定
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent

" 検索
set ignorecase
set smartcase

" その他
set showmatch

" バッファ削除時に保存されていないバッファを閉じる
set hidden

" タイトルを出す
set title
