# 设置 Dock 栏
osascript << EOF
tell application "System Preferences"
	tell application "System Events"
		tell dock preferences
			set dock size to 0.4
			set screen edge to left
			set minimize effect to scale
			set double click behavior to zoom
			set minimize into application to true
			set animate to true
			set autohide to true
			set show indicators to true
			set show recents to false
			set autohide menu bar to true
		end tell
	end tell
end tell
EOF
defaults write com.apple.dock "autohide-delay" -float 0
defaults write com.apple.dock "persistent-apps" -string '{}'
defaults write com.apple.dock "persistent-others" -string '{}'
defaults write com.apple.dock "recent-apps" -string '{}'

# 取消菜单栏图标
osascript << EOF
tell application "System Preferences"
	activate
	delay 0.1
	reveal pane id "com.apple.preference.dock"
	delay 0.5
	tell application "System Events"
		tell process "System Preferences"
            delay 0.5
			tell window "Dock & Menu Bar"
				-- 3. Wifi
				try
					select row 3 of outline 1 of scroll area 1
					if (value of checkbox "Show in Menu Bar") is 1 then
						click checkbox "Show in Menu Bar"
					end if
				end try
				delay 0.1

				-- 4. Bluetooth
				try
					select row 4 of outline 1 of scroll area 1
					if (value of checkbox "Show in Menu Bar") is 1 then
						click checkbox "Show in Menu Bar"
					end if
				end try
				delay 0.1

				-- 6.Focus
				try
					select row 6 of outline 1 of scroll area 1
					if (value of checkbox "Show in Menu Bar") is 1 then
						click checkbox "Show in Menu Bar"
					end if
				end try
				delay 0.1

				-- 8. Screen Mirroring
				try
					select row 8 of outline 1 of scroll area 1
					if (value of checkbox "Show in Menu Bar") is 1 then
						click checkbox "Show in Menu Bar"
					end if
				end try
				delay 0.1

				-- 9. Display
				try
					select row 9 of outline 1 of scroll area 1
					if (value of checkbox "Show in Menu Bar") is 1 then
						click checkbox "Show in Menu Bar"
					end if
				end try
				delay 0.1

				-- 10. Sound
				try
					select row 10 of outline 1 of scroll area 1
					if (value of checkbox "Show in Menu Bar") is 1 then
						click checkbox "Show in Menu Bar"
					end if
				end try
				delay 0.1

				-- 11. Now Playing
				try
					select row 11 of outline 1 of scroll area 1
					if (value of checkbox "Show in Menu Bar") is 1 then
						click checkbox "Show in Menu Bar"
					end if
				end try
				delay 0.1

				-- 17. Clock
				try
					select row 17 of outline 1 of scroll area 1
					click radio button "Analog" of radio group 1
				end try
				delay 0.1
				
				-- 18. Spotlight
				try
					select row 18 of outline 1 of scroll area 1
					delay 0.1
					if (value of checkbox "Show in Menu Bar") is 1 then
						click checkbox "Show in Menu Bar"
					end if
				end try
			end tell
		end tell
	end tell
end tell
EOF