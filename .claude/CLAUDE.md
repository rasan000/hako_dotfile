# dotfile

Linux/WSL2 環境向けの個人dotfileリポジトリ。zsh・neovim・bash・miseなどの設定をシンボリックリンクで管理する。

## 構成

```
.
├── nvim/          → ~/.config/nvim
├── zsh/           → ~/.zshrc, ~/.p10k.zsh
├── bash/          → ~/.bashrc, ~/.bash_aliases
├── mise/          → ~/.config/mise
├── install.sh     # パッケージインストール（apt, starship, oh-my-zsh等）
└── Makefile       # シンボリックリンク作成・削除
```

## コマンド

```bash
make install    # install.sh実行 + シンボリックリンク作成 + mise install
make uninstall  # シンボリックリンク削除のみ（パッケージはアンインストールしない）
```

## 注意

- `make install` は冪等。既にインストール済みのものはスキップする。
- `.gitconfig` はシンボリックリンクではなく `[include]` で取り込む形式。
- `make uninstall` はシンボリックリンクを削除するだけで、パッケージはそのまま残る。
