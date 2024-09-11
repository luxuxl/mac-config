# ----------------------- Dock ----------------------
# Dock 大小
# defaults write com.apple.dock tilesize -int 60
defaults write com.apple.dock "tilesize" -int 16
# 放大效果
# magnification = 1;
# 位置
defaults write com.apple.dock "orientation" -string 'left'
# 缩小效果
defaults write com.apple.dock "mineffect" -string 'scale'
# 关闭弹跳打开
defaults write com.apple.dock "launchanim" -bool false
# 自动隐藏
defaults write com.apple.dock "autohide" -bool true
# 自动隐藏延迟
defaults write com.apple.dock "autohide-delay" -float 0
# 打开应用显示指示灯
defaults write com.apple.dock "show-process-indicators" 1
# 更简单的方法（未测试）, empty dock and only show opened app
# defaults write com.apple.dock "static-only" -bool "true" && killall Dock
# 不显示最近使用
defaults write com.apple.dock "show-recents" -bool false
# Dock 栏固定的应用
defaults write com.apple.dock "persistent-apps" -string '{}'
# 垃圾桶边上的应用
defaults write com.apple.dock "persistent-others" -string '{}'
# set speed for Mission Control (fast)
defaults write com.apple.dock "expose-animation-duration" -float 0.1

# ------------------------ Menu Bar -------------------------
# 24-隐藏 18-总是显示 2-激活时显示
# 显示 WiFi
defaults -currentHost write com.apple.controlcenter WiFi -int 24
# 隐藏 蓝牙
defaults -currentHost write com.apple.controlcenter Bluetooth -int 24
# 隐藏 AirDrop
defaults -currentHost write com.apple.controlcenter AirDrop -int 24
# 隐藏 专注模式
defaults -currentHost write com.apple.controlcenter FocusModes -int 24
# 隐藏 键盘亮度
defaults -currentHost write com.apple.controlcenter KeyboardBrightness -int 24
# 隐藏 屏幕镜像
defaults -currentHost write com.apple.controlcenter ScreenMirroring -int 24
# defaults write com.apple.airplay "showInMenuBarIfPresent" -bool false
# 隐藏 显示器
defaults -currentHost write com.apple.controlcenter Display -int 24
# 隐藏 声音
defaults -currentHost write com.apple.controlcenter Sound -int 24
# 隐藏 正在播放
defaults -currentHost write com.apple.controlcenter NowPlaying -int 24
# 隐藏 辅助功能
defaults -currentHost write com.apple.controlcenter AccessibilityShortcuts -int 24
# 显示 电池
defaults -currentHost write com.apple.controlcenter Battery -int 18
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -int 24
# 隐藏 用户切换
defaults -currentHost write com.apple.controlcenter UserSwitcher -int 24
# 隐藏 Spotlight
defaults -currentHost write com.apple.Spotlight MenuItemHidden -int 0
# 隐藏 Siri
defaults write com.apple.Siri "StatusMenuVisible" -bool false
# 设置时钟
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM HH:mm\""

# ------------------- Trackpad - Point & Click ------------------
# 触控板灵敏度
defaults write -g "com.apple.trackpad.scaling" -int 2
# 禁用强力点击
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool true
# 启用三指查询
defaults -currentHost write -g "com.apple.trackpad.threeFingerTapGesture" -int 2

# ------------------- Trackpad - Scroll & Zoom -------------------
# 启用自然滚动
defaults write -g "com.apple.swipescrolldirection" -bool true
# 启用双指放大
defaults -currentHost write -g "com.apple.trackpad.pinchGesture" -bool true
# 禁用双击缩放
defaults -currentHost write -g "com.apple.trackpad.twoFingerDoubleTapGesture" -bool false
# 启用双指旋转
defaults -currentHost write -g "com.apple.trackpad.rotateGesture" -bool true

# ------------------- Trackpad - More gestures -------------------
# 取消 双指 前进返回
defaults write -g AppleEnableSwipeNavigateWithScrolls -bool false
# 取消 双指 通知中心
defaults -currentHost write -g "com.apple.trackpad.twoFingerFromRightEdgeSwipeGesture" -int 0
# 启用 三指 拖移
defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool true
# 启用 control command 任意位置拖移
defaults write -g NSWindowShouldDragOnGesture -bool true
# 启用 四指 左右桌面
defaults -currentHost write -g "com.apple.trackpad.fourFingerHorizSwipeGesture" -int 2
# 启用 四指 向上调度
defaults write com.apple.dock showMissionControlGestureEnabled -bool true
# 禁用 四指 向下
defaults write com.apple.dock showAppExposeGestureEnabled -bool false
# 禁用 捏合控制台, 张开桌面
defaults -currentHost write -g "com.apple.trackpad.fiveFingerPinchSwipeGesture" -int 0
defaults write com.apple.dock showLaunchpadGestureEnabled -bool false
defaults write com.apple.dock showDesktopGestureEnabled -bool false

# ------------------- Keyboard - Keyboard -------------------
# 禁用持续按住触发西班牙语
defaults write -g ApplePressAndHoldEnabled -bool false
# 重复频率, 存在的问题 见下
# 1. seems to conflict with karabiner
# 2. 不会显示在设置中
# 3. 需要退出登录生效
defaults write -g KeyRepeat -int 1
# 重复前的 delay, 问题同上
defaults write -g InitialKeyRepeat -int 13
# 直接功能键
defaults write -g com.apple.keyboard.fnState -bool false

# ------------------- Keyboard - Text -------------------
# 取消更正
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# 取消首字母大写
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# 取消自动逗号
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# ------------------- Keyboard - Shortcuts -------------------
## Remove System shortcuts dont use
### ------------------------- ###
### 移除 显示/隐藏 Dock（52, 64、65未知）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 52 "<dict><key>enabled</key><false/></dict>"
### ------------------------- ###
### 移除 mission control（32、34）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 32 "<dict><key>enabled</key><false/></dict>"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 34 "<dict><key>enabled</key><false/></dict>"
### 移除 Application window（33、35）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 33 "<dict><key>enabled</key><false/></dict>"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 35 "<dict><key>enabled</key><false/></dict>"
### 移除 show desktop（36、37）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 36 "<dict><key>enabled</key><false/></dict>"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 37 "<dict><key>enabled</key><false/></dict>"
### 移除 switch to desktop1（118）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 118 "<dict><key>enabled</key><false/></dict>"
### 移除 switch to desktop2（119）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 119 "<dict><key>enabled</key><false/></dict>"
### 移除 switch to desktop3（120）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 120 "<dict><key>enabled</key><false/></dict>"
### 移除 quick note（190）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 190 "<dict><key>enabled</key><false/></dict>"
### ------------------------- ###
### 移除 open keyboard access（12）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 12 "<dict><key>enabled</key><false/></dict>"
### 移除 ^F2（7）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 7 "<dict><key>enabled</key><false/></dict>"
### 移除 ^F3（8）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 8 "<dict><key>enabled</key><false/></dict>"
### 移除 ^F4（9）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 9 "<dict><key>enabled</key><false/></dict>"
### 移除 ^F5（10）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 10 "<dict><key>enabled</key><false/></dict>"
### 移除 ^F6（11）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 11 "<dict><key>enabled</key><false/></dict>"
### 移除 ^F7（13）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 13 "<dict><key>enabled</key><false/></dict>"
### 移除 ^F8（57）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 57 "<dict><key>enabled</key><false/></dict>"
### 移除 cmd丶（27）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 27 "<dict><key>enabled</key><false/></dict>"
### ------------------------- ###
### 移除 前一个输入法（60）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 60 "<dict><key>enabled</key><false/></dict>"
### 移除 后一个输入法（61）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 61 "<dict><key>enabled</key><false/></dict>"
### ------------------------- ###
### 移除 cmdshift3 截图（28）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 28 "<dict><key>enabled</key><false/></dict>"
### 移除 ^cmdshift3 截图（29）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 29 "<dict><key>enabled</key><false/></dict>"
### 移除 cmdshift4 截图（30）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 30 "<dict><key>enabled</key><false/></dict>"
### 移除 ^cmdshift4 截图（31）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 31 "<dict><key>enabled</key><false/></dict>"
### 移除 cmdshift5 截图（184）
# defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 184 "<dict><key>enabled</key><false/></dict>"
### ------------------------- ###
### 移除 spotlight cmd space（64）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "<dict><key>enabled</key><false/></dict>"
### 移除 option cmd space（65）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 65 "<dict><key>enabled</key><false/></dict>"
### ------------------------- ###
### 移除 增强、减弱对比度（25、26）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 25 "<dict><key>enabled</key><false/></dict>"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 26 "<dict><key>enabled</key><false/></dict>"
### 移除 反转颜色（21）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 21 "<dict><key>enabled</key><false/></dict>"
### 移除 voice over（59）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 59 "<dict><key>enabled</key><false/></dict>"
### 移除 accessibliy control（162）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 162 "<dict><key>enabled</key><false/></dict>"
### ------------------------- ###
### 显示帮助（98）

# ------------------- Keyboard - Input Sources -------------------
# Seen Remove ABC Input Method

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
defaults write -g NSUserKeyEquivalents -dict-add "\033View\033Clean Up" "@r"

# 重置键盘、触控板
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

# ---------------- 调度中心 ---------------
# 取消 自动排列空间
defaults write com.apple.dock "mru-spaces" -bool false
# 开启 切换应用时切换空间
defaults write NSGlobalDomain "AppleSpacesSwitchOnActivate" -bool true
# 开启 应用分组
defaults write com.apple.dock "expose-group-apps" -bool true
# 关闭 显示器具有单独桌面
defaults write com.apple.spaces "spans-displays" -bool true
# 快捷键在键盘中已经取消

# ---------------- 通用 ------------------
# 点击跳转
defaults write NSGlobalDomain AppleScrollerPagingBehavior -int 1

# ----------------- 声音 -----------------
# 提醒音量
defaults write NSGlobalDomain "com.apple.sound.beep.volume" -int 0

# ----------------- 截图 -----------------
# 禁用 截图阴影 Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true
# 默认 jpg 格式
defaults write com.apple.screencapture type JPG