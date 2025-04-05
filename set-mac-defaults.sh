#
# Dock
#
# Automatically hide or show the Dock （Dock を自動的に隠す）
defaults write com.apple.dock autohide -bool true
# Set the icon size （アイコンサイズの設定）
defaults write com.apple.dock tilesize -int 25
# Dockのデザインを2Dにする
defaults write com.apple.dock no-glass -bool true
# Wipe all app icons from the Dock （Dock に標準で入っている全てのアプリを消す、Finder とごみ箱は消えない）
defaults write com.apple.dock persistent-apps -array

#
# Finder
#
# Show Status bar in Finder （ステータスバーを表示）
defaults write com.apple.dock persistent-apps -array
# Show Path bar in Finder （パスバーを表示）
defaults write com.apple.finder ShowPathbar -bool true
# Show Tab bar in Finder （タブバーを表示）
defaults write com.apple.finder ShowPathbar -bool true
# スクロールバーを常時表示する
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Show the ~/Library directory （ライブラリディレクトリを表示、デフォルトは非表示）
chflags nohidden ~/Library
# /Volumes ディレクトリを見えるようにする
sudo chflags nohidden /Volumes
# Show the hidden files （不可視ファイルを表示）
defaults write com.apple.finder AppleShowAllFiles YES

#
# Others
#
# コントラストを上げる（Increase contrast）
# defaults write com.apple.universalaccess increaseContrast -bool true
# ブート時のサウンドを無効化する
sudo nvram SystemAudioVolume=" "
# ファイルを開くときのアニメーションを無効にする
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
# ツールチップ表示までのタイムラグをなくす
defaults write -g NSInitialToolTipDelay -integer 0
# ダイアログ表示やウィンドウリサイズ速度を高速化する
defaults write -g NSWindowResizeTime 0.1
# キーリピートの速度
defaults write NSGlobalDomain KeyRepeat -int 2
# キーリピート開始までのタイミング
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# クラッシュレポートを無効化する
defaults write com.apple.CrashReporter DialogType -string "none"
# スクリーンキャプチャの影をなくす
defaults write com.apple.screencapture disable-shadow -bool true
# スクリーンショットの保存先をDownloadに移行する
defaults write com.apple.screencapture location ~/Downloads
# DashBoardを無効にする
defaults write com.apple.dashboard mcx-disabled -bool true

