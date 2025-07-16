" clipboardを使えるように
set clipboard=unnamedplus

" リーダーキーをスペースに設定
let g:mapleader = "\<Space>"

" 表示行での移動にする
nnoremap j gj
nnoremap k gk

" 選択状態でのxは切り取り用
nnoremap x "_x
vnoremap X "_x
nnoremap X "_X
vnoremap X "_X

" 文字コード
set fileencoding=utf-8
set encoding=utf-8

" 行番号
set number

