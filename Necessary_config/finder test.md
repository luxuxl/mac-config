```bash
# ------------- Custom System shortcuts ------------------
### ⌘ caps（⌃）3 全功能截图
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 184 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>parameters</key>
      <array>
        <integer>51</integer>
        <integer>20</integer>
        <integer>1310720</integer>
      </array>
      <key>type</key><string>standard</string>
    </dict>
  </dict>
"
### ⌘ caps（⌃）J move to left desktop（79, 80未知）
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 79 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>parameters</key>
      <array>
        <integer>106</integer>
        <integer>38</integer>
        <integer>1310720</integer>
      </array>
      <key>type</key><string>standard</string>
    </dict>
  </dict>
"
### ⌘ caps（⌃）K move to right desktop（81, 82未知）
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 81 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>parameters</key>
      <array>
        <integer>107</integer>
        <integer>40</integer>
        <integer>1310720</integer>
      </array>
      <key>type</key><string>standard</string>
    </dict>
  </dict>
"
# --------- Custom Application Shortcuts - English Version ----------
# All - Preference ⌘丶
defaults write -g NSUserKeyEquivalents '{"Preferences..." = "@`";}'

# Apple Application tab move
# Cant work if change com.apple.safari NSUserKeyEquivalents
defaults write -g NSUserKeyEquivalents -dict-add "\033Window\033Show Previous Tab" "@j"
defaults write -g NSUserKeyEquivalents -dict-add "\033Window\033Show Next Tab" "@k"
defaults write -g NSUserKeyEquivalents -dict-add "\033Window\033Pin Tab" "@p"

# Chrome tab move
# Cant work if change com.google.chrome NSUserKeyEquivalents
defaults write -g NSUserKeyEquivalents -dict-add "\033Tab\033Select Previous Tab" "@j"
defaults write -g NSUserKeyEquivalents -dict-add "\033Tab\033Select Next Tab" "@k"
defaults write -g NSUserKeyEquivalents -dict-add "\033Tab\033Pin Tab" "@p"

# Finder
defaults write -g -dict-add "\033View\033Clean Up" "@r"

# 重置键盘、触控板
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

# ------------------ View Options ------------------
# 修改桌面视图设置
# 存在问题: 初始状态下 com.apple.finder 中没有 DesktopViewSettings
# 解决方法一: 用 AppleScript 操作会自动生成, 同时可以直接 set 相关属性
# 方法一的缺点: 1、需要获取 Finder 操作权限 2、aps 无法设置 gridSpacing
# 缺点的解决方法: 加入 sudo 或可解决（有待验证）, gridSpacing 用 PlistBuddy 修改
# 解决方法二: 桌面 ⌘J 点一下, 生成后再用 PlistBuddy
# 方法二的缺点: 操作更麻烦, 不予讨论
sudo osascript << EOF
tell application "Finder"
	set iconView to icon view options of window of desktop
	tell iconView
		set arrangement to snap to grid
		set icon size to 52
		-- Cant set gridSpacing
		set text size to 10
		set label position to bottom
		set shows icon preview to true
		set shows item info to true
	end tell
end tell
EOF
# 修改 Desktop 间距
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 1" /Users/$USERNAME/Library/Preferences/com.apple.finder.plist

# 修改所有 column 视图的标准样式
# 存在问题: 默认情况下 com.apple.finder 中没有 ColumnView
# 解决方法: 用 AppleScript 操作
sudo osascript << EOF
tell application "Finder"
	make new Finder window
	activate
	set theWindow to the front window
	set theView to column view options of theWindow
	set text size of theView to 15
	close every window
end tell
EOF

# 修改所有 Icon 视图的标准样式
# 存在问题: defaults 命令无法修改子项
# 解决方法: 用 /usr/libexec/PlistBuddy
# 方法的缺点: 无法操作不存在的文件、属性, 但是 AppleScript 处理后必定生成 com.apple.finder.plist, 故已被解决
# 根据名称排序
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy name" /Users/$USERNAME/Library/Preferences/com.apple.finder.plist
# 图标尺寸
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 64" /Users/$USERNAME/Library/Preferences/com.apple.finder.plist
# 图标间距
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 42" /Users/$USERNAME/Library/Preferences/com.apple.finder.plist
# 名称大小
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:textSize 12" /Users/$USERNAME/Library/Preferences/com.apple.finder.plist
# 显示 label
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:labelOnBottom 1" /Users/$USERNAME/Library/Preferences/com.apple.finder.plist
# 显示图标预览
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showIconPreview 1" /Users/$USERNAME/Library/Preferences/com.apple.finder.plist
# 显示 info
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo 1" /Users/$USERNAME/Library/Preferences/com.apple.finder.plist

# 设置 column 为默认视图
# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: icnv, glyv, nlsv
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
# 设置 name 为默认分组
defaults write com.apple.finder FXPreferredGroupBy -string 'Name'

# ------------------ Finder Preference --------------------
# 桌面显示项目
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
# “访达”新窗口打开位置
#              : PfCm, PfHm, PfDe, PfDo
# Volume       : `PfVo`
# All My Files : `PfAF`
# Other…       : `PfLo`
# ... NewWindowTargetPath "file://..."
defaults write com.apple.finder NewWindowTarget -string 'PfHm'
# 总是新标签打开
defaults write com.apple.finder FinderSpawnTab 1
# 清空标签
defaults write com.apple.finder FavoriteTagNames '()'
# 显示所有文件扩展名
defaults write -g AppleShowAllExtensions 1
# 修改扩展名不提示
defaults write com.apple.finder FXEnableExtensionChangeWarning 0
# 文件夹显示在前面
defaults write com.apple.finder "_FXSortFoldersFirst" 1
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" 1
# 显示隐藏文件
# defaults write com.apple.finder AppleShowAllFiles 1
# 搜索位置 当前文件夹
defaults write com.apple.finder FXDefaultSearchScope 'SCcf'
# 不隐藏 Library
chflags nohidden ~/Library
# 各种 Bar
defaults write com.apple.finder ShowPathbar 1
defaults write com.apple.finder ShowStatusBar 0
defaults write com.apple.finder ShowSidebar 1
defaults write com.apple.finder SidebarWidth 194
defaults write com.apple.finder ShowPreviewPane 0
defaults write com.apple.finder ShowRecentTags 0
# 工具栏仅图标
defaults write com.apple.finder "NSToolbar Configuration Browser" -dict-add "TB Display Mode" 2
defaults write com.apple.finder "NSToolbar Configuration Browser" -dict-add "TB Item Identifiers" '("com.apple.finder.BACK","com.apple.finder.SRCH")'
# 禁止 下载警告 Turn off the “Application Downloaded from Internet” quarantine warning.
defaults write com.apple.LaunchServices "LSQuarantine" -bool false
# 禁止 在 USB 介质上创建 DS_Store
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# 禁止 在云端创建 DS_Store
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# 可选 Allow quitting Finder via ⌘ + Q , doing so will also hide desktop icons
# defaults write com.apple.finder QuitMenuItem -bool true
```