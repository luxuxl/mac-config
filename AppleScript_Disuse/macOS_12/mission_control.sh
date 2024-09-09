osascript << EOF
tell application "System Preferences"
	activate
	delay 0.1
	reveal pane id "com.apple.preference.expose"
	delay 0.5
	tell application "System Events"
		tell process "System Preferences"
			tell window "Mission Control"
				tell group 2
					if (value of checkbox "Automatically rearrange Spaces based on most recent use") is 1 then
						click checkbox "Automatically rearrange Spaces based on most recent use"
					end if
                    delay 0.1
					if (value of checkbox "When switching to an application, switch to a Space with open windows for the application") is 0 then
						click checkbox "When switching to an application, switch to a Space with open windows for the application"
					end if
					delay 0.1
					if (value of checkbox "Group windows by application") is 0 then
						click checkbox "Group windows by application"
					end if
					delay 0.1
					if (value of checkbox "Displays have separate Spaces") is 0 then
						click checkbox "Displays have separate Spaces"
					end if
				end tell

                tell group "Keyboard and Mouse Shortcuts"
					try
						click pop up button 1
						delay 0.1
						tell menu 1 of pop up button 1
							click menu item "-"
						end tell
					end try
					
					try
						click pop up button 2
						delay 0.1
						tell menu 1 of pop up button 2
							click menu item "-"
						end tell
					end try
					
					try
						click pop up button 3
						delay 0.1
						tell menu 1 of pop up button 3
							click menu item "-"
						end tell
					end try
					
					try
						click pop up button 4
						delay 0.1
						tell menu 1 of pop up button 4
							click menu item "-"
						end tell
					end try
					
					try
						click pop up button 5
						delay 0.1
						tell menu 1 of pop up button 5
							click menu item "-"
						end tell
					end try
					
					try
						click pop up button 6
						delay 0.1
						tell menu 1 of pop up button 6
							click menu item "-"
						end tell
					end try
				end tell
			end tell
		end tell
	end tell
end tell
EOF