defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool "true"
osascript << EOF
tell application "System Preferences"
	activate
	delay 0.1
	reveal pane id "com.apple.preference.trackpad"
	delay 0.5
	tell application "System Events"
		tell process "System Preferences"
			tell window "触控板"
				tell tab group 1
					click radio button "光标与点按"
					delay 0.1
					if (value of checkbox 1) is 0 then
						click checkbox 1
					end if
					if (value of checkbox 2) is 0 then
						click checkbox 2
					end if
					if (value of checkbox 3) is 0 then
						click checkbox 3
					end if
					
					delay 0.1
					click radio button "滚动缩放"
					if (value of checkbox 1) is 0 then
						click checkbox 1
					end if
					if (value of checkbox 2) is 0 then
						click checkbox 2
					end if
					if (value of checkbox 3) is 1 then
						click checkbox 3
					end if
					if (value of checkbox 4) is 0 then
						click checkbox 4
					end if
					
					delay 0.1
					click radio button "更多手势"
					if (value of checkbox 1) is 1 then
						click checkbox 1
					end if
					if (value of checkbox 2) is 0 then
						click checkbox 2
					end if
					if (value of checkbox 3) is 1 then
						click checkbox 3
					end if
					if (value of checkbox 4) is 0 then
						click checkbox 4
					end if
					if (value of checkbox 5) is 1 then
						click checkbox 5
					end if
					if (value of checkbox 6) is 1 then
						click checkbox 6
					end if
					if (value of checkbox 7) is 1 then
						click checkbox 7
					end if
				end tell
			end tell
		end tell
	end tell
end tell
EOF