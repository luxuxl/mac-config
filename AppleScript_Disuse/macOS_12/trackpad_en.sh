defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool "true"
osascript << EOF
tell application "System Preferences"
	activate
	delay 0.1
	reveal pane id "com.apple.preference.trackpad"
	delay 0.5
	tell application "System Events"
		tell process "System Preferences"
            delay 0.5
			tell window "Trackpad"
				tell tab group 1
					click radio button "Point & Click"
					delay 0.1
					if (value of checkbox 1) is 0 then
						click checkbox 1
					end if
                    try
                        click menu button "Force Click with one finger"
    					delay 0.1
    					click menu item "Tap with three fingers" of menu "Force Click with one finger" of menu button "Force Click with one finger"
                    end try
					if (value of checkbox 2) is 0 then
						click checkbox 2
					end if
					if (value of checkbox 3) is 0 then
						click checkbox 3
					end if
					tell slider "Click"
						set value to 1.0
					end tell
					
					tell slider "Tracking speed"
						set value to 7.0
					end tell
                    
					delay 0.1
					click radio button "Scroll & Zoom"
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
					click radio button "More Gestures"
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