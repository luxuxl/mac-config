# -------- Keyboard Settings --------
osascript << EOF
tell application "System Preferences"
	activate
	delay 0.1
	reveal pane id "com.apple.preference.keyboard"
	delay 0.5
	tell application "System Events"
		tell process "System Preferences"
            delay 0.5
			tell window "Keyboard"
				tell tab group 1
					click radio button "Keyboard"
					set value of slider "Key Repeat" to 7.0
					delay 0.1
					set value of slider "Delay Until Repeat" to 6.0
					delay 0.1
					if (value of checkbox "Use F1, F2, etc. keys as standard function keys") is 1 then
						click checkbox "Use F1, F2, etc. keys as standard function keys"
					end if
				end tell
			end tell
		end tell
	end tell
end tell
EOF

# -------- Remove All the System Shortcuts --------
osascript << EOF
tell application "System Preferences"
	activate
	delay 0.1
	reveal pane id "com.apple.preference.keyboard"
	delay 0.5
	tell application "System Events"
		tell process "System Preferences"
			tell window "Keyboard"
				tell tab group 1
					click radio button "Shortcuts"
					tell splitter group 1
						repeat with tab in rows of table 1 of scroll area 1
							delay 0.1
							select tab
							tell scroll area 2
								repeat with test in rows of outline 1
									try
										if (value of checkbox 1 of UI element 1 of test) is 1 then
											click checkbox 1 of UI element 1 of test
										end if
										delay 0.1
									end try
								end repeat
							end tell
						end repeat
					end tell
				end tell
			end tell
		end tell
	end tell
end tell
EOF

# --------- Custom Application Shortcuts - English Version ----------
# All
defaults write -g NSUserKeyEquivalents '{"Preferences..." = "@$`";}'

# Finder
defaults write com.apple.finder NSUserKeyEquivalents '{"\033File\033Compress" = "@g";"\033Go\033Downloads" = "@$l";"\033View\033Clean Up" = "@r";}'
# defaults write -g NSUserKeyEquivalents -dict-add "\033View\033Clean Up" "@r"

# Safari | Cant work if change com.apple.safari
# defaults write com.apple.safari NSUserKeyEquivalents '{"\033Window\033Show Next Tab" = "@k";"\033Window\033Show Previous Tab" = "@j";}'
defaults write -g NSUserKeyEquivalents -dict-add "\033Window\033Show Previous Tab" "@j"
defaults write -g NSUserKeyEquivalents -dict-add "\033Window\033Show Next Tab" "@k"
defaults write -g NSUserKeyEquivalents -dict-add "\033Window\033Pin Tab" "@p"

# Chrome | Cant work if change com.google.chrome
# defaults write com.google.chrome NSUserKeyEquivalents '{"\033Tab\033Select Next Tab" = "@k";"\033Tab\033Select Previous Tab" = "@j";}'
defaults write -g NSUserKeyEquivalents -dict-add "\033Tab\033Select Previous Tab" "@j"
defaults write -g NSUserKeyEquivalents -dict-add "\033Tab\033Select Next Tab" "@k"
defaults write -g NSUserKeyEquivalents -dict-add "\033Tab\033Pin Tab" "@p"


# --------- 自定义快捷键 - 中文用 ----------
# 所有 偏好设置 → cmd + shift + `
defaults write -g NSUserKeyEquivalents '{"\U504f\U597d\U8bbe\U7f6e..." = "@$`";}'

# Finder
## 前往 → 下载 cmd shift l
defaults write com.apple.finder NSUserKeyEquivalents -dict-add "\033\U524d\U5f80\033\U4e0b\U8f7d" "@$l"

## 显示 → 整理 cmd + k
defaults write com.apple.finder NSUserKeyEquivalents -dict-add "\033\U663e\U793a\033\U6574\U7406" "@k"

## 文件 → 压缩 cmd + g
defaults write com.apple.finder NSUserKeyEquivalents -dict-add "\033\U6587\U4ef6\033\U538b\U7f29" "@g"

# Safari | 若修改 com.apple.safari 不生效
defaults write -g NSUserKeyEquivalents -dict-add "\033\U7a97\U53e3\033\U663e\U793a\U4e0a\U4e00\U4e2a\U6807\U7b7e\U9875" "@j"
defaults write -g NSUserKeyEquivalents -dict-add "\033\U7a97\U53e3\033\U663e\U793a\U4e0b\U4e00\U4e2a\U6807\U7b7e\U9875" "@k"

# Chrome | 若修改 com.google.chrome 不生效, 未完成
# defaults write -g NSUserKeyEquivalents -dict-add "" "@j"
# defaults write -g NSUserKeyEquivalents -dict-add "" "@k"