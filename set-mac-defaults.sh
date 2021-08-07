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
# Mission Control
#
# Bottom right screen corner → Launchpad （右下 → Launchpad）
defaults write com.apple.dock wvous-br-corner -int 11
defaults write com.apple.dock wvous-br-modifier -int 0

#
# QuickLook
#
# Allow you to select and copy string in QuickLook （QuickLook で文字の選択、コピーを出来るようにする）
defaults write com.apple.finder QLEnableTextSelection -bool true

#
# Finder
#
# Show Status bar in Finder （ステータスバーを表示）
defaults write com.apple.finder ShowStatusBar -bool true
# Show Path bar in Finder （パスバーを表示）
defaults write com.apple.finder ShowPathbar -bool true
# Show Tab bar in Finder （タブバーを表示）
defaults write com.apple.finder ShowTabView -bool true
# スクロールバーを常時表示する
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Show the ~/Library directory （ライブラリディレクトリを表示、デフォルトは非表示）
chflags nohidden ~/Library
# /Volumes ディレクトリを見えるようにする
chflags nohidden /Volumes
# Show the hidden files （不可視ファイルを表示）
defaults write com.apple.finder AppleShowAllFiles YES

#
# Safari
#
# Enable the `Develop` menu and the `Web Inspector` （開発メニューを表示）
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
# Enable `Debug` menu （メニュー → デバッグを表示）
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
# Show the full URL in the address bar (note: this will still hide the scheme)
# アドレスバーに完全なURLを表示
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
# Add a context menu item for showing the `Web Inspector` in web views
# コンテキストメニューにWebインスペクタを追加
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
# Show Safari's Status Bar （ステータスバーを表示）
defaults write com.apple.Safari ShowStatusBar -bool true

#
# Spotlight
#
# Load new settings before rebuilding the index （インデックスを再構築する前に新しい設定を読み込む）
killall mds > /dev/null 2>&1
# Make sure indexing is enabled for the main volume （メインディスクのインデックスを有効にする）
sudo mdutil -i on / > /dev/null
# Rebuild the index from scratch （インデックスを最初から再構築）
sudo mdutil -E / > /dev/null

#
# Others
#
# Date options: Show the day of the week: on （日付表示設定、曜日を表示）
defaults write com.apple.menuextra.clock 'DateFormat' -string 'EEE H:mm'
# Automatically quit the printer app once the print jobs are completed
# 印刷が終了したら、自動的にプリンターアプリを終了する
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
# Save screenshots as PNGs （スクリーンショット保存形式をPNGにする）
defaults write com.apple.screencapture type -string "png"
# ブート時のサウンドを無効化する
sudo nvram SystemAudioVolume=" "
# 時計アイコンクリック時に OS やホスト名 IP を表示する
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
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
# スクリーンショットの保存形式を PNG にする
defaults write com.apple.screencapture type -string "png"
# スクリーンショットの保存先をDownloadに移行する
defaults write com.apple.screencapture location ~/Downloads
# DashBoardを無効にする
defaults write com.apple.dashboard mcx-disabled -bool true

