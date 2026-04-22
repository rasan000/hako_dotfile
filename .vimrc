" clipboardを利用する
set clipboard=unnamedplus

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
xnoremap c "_c

" ;と:の入れ替え
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :

" 選択状態でのxは切り取り用
nnoremap x "_x
nnoremap X "_X

" コマンド候補
set wildmenu
set noswapfile
set showcmd

" 文字コード
set fileencoding=utf-8
set encoding=utf-8

" 表示
set cursorline
set syntax=enable
set hlsearch

" タブを4文字に設定
set tabstop=4
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

" デフォルトシェルをzshに設定
set shell=/usr/bin/zsh 
