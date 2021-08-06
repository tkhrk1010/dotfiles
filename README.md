# dotfiles
control dotfiles
itermの設定は、https://scrapbox.io/***/iterm2%E8%A8%AD%E5%AE%9Aにある。

# karabiner
$ mv ~/.config/karabiner/karabiner.json ~/dotfiles/
$ ln -sf ~/dotfiles/karabiner.json ~/.config/karabiner/karabiner.json

#
# Brewfile
#
# バックアップ
$ brew bundle dump --global --force --describe
# インストール
$ brew bundle --global

