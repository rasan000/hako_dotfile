" リーダーキーをスペースに設定
let mapleader = " "

" クリップボードを利用可能にする
set clipboard=unnamedplus

" 表示行での移動にする
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" ハイライトを消す
nnoremap <leader>n :noh<CR>

" 全て選択
nnoremap <C-a> ggVG

" ウィンドウ分割
nnoremap ss :split<CR><C-w>w
nnoremap sv :vsplit<CR><C-w>w

" ウィンドウ間の移動
nnoremap sh <C-w>h
nnoremap sk <C-w>k
nnoremap sj <C-w>j
nnoremap sl <C-w>l

" 削除時はヤンクしない
nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X
nnoremap s "_s
vnoremap s "_s
nnoremap S "_S
vnoremap S "_S

" 切り取り時は0レジスタに入れる
nnoremap d "0d
vnoremap d "0d
nnoremap D "0D
vnoremap D "0D

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

