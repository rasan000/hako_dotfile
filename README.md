# overview
設定ファイル集

# 使い方
- .gitconfig_alias
  - .gitconigに以下を追加してinclude
  - ```
    [include]
      path = ~/hako_dotfile/.gitconfig_alias
    ```

- .tmux.conf
  - .tmux.confに以下を追加してinclude
  - ```
    source-file ~/hako_dotfile/.mytmux.conf
    ```

- alias.fish 
   - fishのalias設定ファイルに以下を追加してinclude
   - ```
      source ~/hako_dotfile/alias.fish
      ```

- .vimrc 
   - ホームディレクトリのvimrcに以下の記述を追加 
   - ```
      source ~/hako_dotfile/.vimrc
