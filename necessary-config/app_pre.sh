# ----------------------- Finder - View Options ----------------------
# 修改桌面视图设置
# 存在问题: 初始状态下 com.apple.finder 中没有 DesktopViewSettings
# 解决方法一: 用 AppleScript 操作会自动生成, 同时可以直接 set 相关属性
# 方法一的缺点: 1、需要获取 Finder 操作权限 2、aps 无法设置 gridSpacing
# 缺点的解决方法: 加入 sudo 或可解决（有待验证）, gridSpacing 用 PlistBuddy 修改
# 解决方法二: 桌面 ⌘J 点一下, 生成后再用 PlistBuddy
# 方法二的缺点: 操作更麻烦, 不予讨论
osascript << EOF
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

# 修改所有 column 视图的标准样式
# 存在问题: 默认情况下 com.apple.finder 中没有 ColumnView
# 解决方法: 用 AppleScript 操作
osascript << EOF
tell application "Finder"
	make new Finder window
	activate
	set theWindow to the front window
	set theView to column view options of theWindow
	set text size of theView to 15
	close every window
end tell
EOF

sleep 0.5

# 修改所有 Icon 视图的标准样式
# 存在问题: defaults 命令无法修改子项
# 解决方法: 用 /usr/libexec/PlistBuddy
# 方法的缺点: 无法操作不存在的文件、属性, 但是 AppleScript 处理后必定生成 com.apple.finder.plist, 故已被解决
# 根据名称排序
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy name" /Users/$USER/Library/Preferences/com.apple.finder.plist
# 图标尺寸
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 64" /Users/$USER/Library/Preferences/com.apple.finder.plist
# 图标间距
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 42" /Users/$USER/Library/Preferences/com.apple.finder.plist
# 名称大小
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:textSize 12" /Users/$USER/Library/Preferences/com.apple.finder.plist
# 显示 label
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:labelOnBottom 1" /Users/$USER/Library/Preferences/com.apple.finder.plist
# 显示图标预览
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showIconPreview 1" /Users/$USER/Library/Preferences/com.apple.finder.plist
# 显示 info
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo 1" /Users/$USER/Library/Preferences/com.apple.finder.plist

# 设置 column 为默认视图
# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: icnv, glyv, nlsv
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
# 设置 name 为默认分组
defaults write com.apple.finder FXPreferredGroupBy -string 'Name'

# ---------------------- Finder - Preference -------------------------
# 桌面显示项目
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
# “访达”新窗口打开位置
#              : PfCm, PfHm, PfDe, PfDo
# Volume       : PfVo
# All My Files : PfAF
# Other…       : PfLo
# ... NewWindowTargetPath "file://..."
defaults write com.apple.finder NewWindowTarget -string 'PfHm'
# 总是新标签打开
defaults write com.apple.finder FinderSpawnTab -bool true
# 清空标签
defaults write com.apple.finder FavoriteTagNames '()'
# 显示所有文件扩展名
defaults write -g AppleShowAllExtensions -bool true
# 禁止 提示修改扩展名
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# 禁止 从 iCloud 移除提示
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false
# 文件夹显示在前面
defaults write com.apple.finder "_FXSortFoldersFirst" -bool true
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool true
# 显示隐藏文件
# defaults write com.apple.finder AppleShowAllFiles -bool true
# 搜索位置 当前文件夹
defaults write com.apple.finder FXDefaultSearchScope 'SCcf'
# 不隐藏 Library
chflags nohidden ~/Library
# 各种 Bar
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowSidebar -bool true
defaults write com.apple.finder SidebarWidth 194
defaults write com.apple.finder ShowPreviewPane -bool false
defaults write com.apple.finder ShowRecentTags -bool false
# 工具栏仅图标
defaults write com.apple.finder "NSToolbar Configuration Browser" -dict-add "TB Display Mode" 2
defaults write com.apple.finder "NSToolbar Configuration Browser" -dict-add "TB Item Identifiers" '("com.apple.finder.BACK","com.apple.finder.SRCH")'
# Finder 快捷键
defaults write com.apple.finder NSUserKeyEquivalents -dict-add "View Clean Up" "@r"
defaults write com.apple.finder NSUserKeyEquivalents -dict-add "Merge All Windows" "^r"
defaults write com.apple.finder NSUserKeyEquivalents -dict-add "Add to Sidebar" "^t"
defaults write com.apple.finder NSUserKeyEquivalents -dict-add "Open" "^e"

# 禁止 在 USB 介质上创建 DS_Store
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# 禁止 在云端创建 DS_Store
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# 可选 Allow quitting Finder via ⌘ + Q , doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# ------------------------- Safari --------------------------
#TODO 为保险要改成 -bool
# 确保存在 com.apple.Safari
open -a Safari
sleep 0.5
killall Safari
sleep 0.5
defaults read com.apple.Safari

# 首页, 展示背景图片和收藏, 其他全关闭
defaults write com.apple.Safari ShowBackgroundImageInFavorites -bool true
defaults write com.apple.Safari ShowFavorites -bool false
defaults write com.apple.Safari ShowFrequentlyVisitedSites -bool false
defaults write com.apple.Safari ShowHighlightsInFavorites -bool false
defaults write com.apple.Safari ShowPrivacyReportInFavorites -bool false
defaults write com.apple.Safari ShowReadingListInFavorites -bool false
defaults write com.apple.Safari HideStartPageSiriSuggestionsEmptyItemView -bool false
defaults write com.apple.Safari ShowSiriSuggestionsPreference -bool false
# 默认下载地址
defaults write com.apple.Safari NSNavLastRootDirectory -string "~/Desktop"
# 下载成功移除
defaults write com.apple.Safari DownloadsClearingPolicy -int 2
# 关闭安全打开
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
# 窗口最大化
defaults write com.apple.Safari "NSWindow Frame BrowserWindowFrame" "0 0 1440 900 0 0 1440 900"
# 紧凑标签, 好看
defaults write com.apple.Safari ShowStandaloneTabBar -bool false
# 在标签页中始终显示网站标题
defaults write com.apple.Safari EnableNarrowTabs -bool false
# 始终在新标签页打开
defaults write com.apple.Safari TabCreationPolicy -int 2
# 打开新标签页或窗口后，使其成为活跃标签页或窗口
defaults write com.apple.Safari OpenNewTabsInFront -bool true
# 关闭自动填充
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false
# 设置搜索引擎
defaults write com.apple.Safari SearchProviderShortName -string "Bing"
# 关闭快速网站搜索
defaults write com.apple.Safari WebsiteSpecificSearchEnabled -bool false
# 关闭后台载入最佳结果
defaults write com.apple.Safari PreloadTopHit -bool false
# 启用开发者菜单
defaults write com.apple.Safari IncludeDevelopMenu -bool true
# 清空工具栏
defaults write com.apple.Safari "NSToolbar Configuration BrowserToolbarIdentifier-v4.6" -dict-add "TB Item Identifiers" "(InputFieldsToolbarIdentifier,UnifiedTabBarToolbarIdentifier)"