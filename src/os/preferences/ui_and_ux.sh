#!/bin/bash

print_in_blue "\n   UI & UX\n\n"

execute "osascript -e 'tell application \"System Events\" to tell appearance preferences to set dark mode to true'" \
   "Use dark menu bar and Dock"

execute "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true && \
         defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true" \
   "Avoid creating '.DS_Store' files on network or USB volumes"

# execute "defaults write com.apple.menuextra.battery ShowPercent -string 'NO'" \
#     "Hide battery percentage from the menu bar"

# execute "sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true" \
#     "Show language menu in the top right corner of the boot screen"

execute "defaults write com.apple.CrashReporter UseUNC 1" \
    "Make crash reports appear as notifications"

execute "defaults write com.apple.LaunchServices LSQuarantine -bool false" \
    "Disable 'Are you sure you want to open this application?' dialog"

execute "defaults write com.apple.print.PrintingPrefs 'Quit When Finished' -bool true" \
    "Automatically quit the printer app once the print jobs are completed"

execute "defaults write com.apple.screencapture disable-shadow -bool true" \
    "Disable shadow in screenshots"

execute "defaults write com.apple.screencapture location -string '$HOME/Desktop'" \
    "Save screenshots to the Desktop"

execute "defaults write com.apple.screencapture type -string 'png'" \
    "Save screenshots as PNGs"

execute "defaults write com.apple.screensaver askForPassword -int 1 && \
         defaults write com.apple.screensaver askForPasswordDelay -int 5"\
    "Require password 5s after into sleep or screen saver mode"

execute "defaults write -g AppleFontSmoothing -int 2" \
    "Enable subpixel font rendering on non-Apple LCDs"

execute "sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true" \
    "Enable HiDPI display modes (requires restart)"

# execute "defaults write -g AppleShowScrollBars -string 'Always'" \
#     "Always show scrollbars"

execute "defaults write -g NSAutomaticWindowAnimationsEnabled -bool false" \
    "Disable window opening and closing animations."

execute "defaults write -g NSDisableAutomaticTermination -bool true" \
    "Disable automatic termination of inactive apps"

execute "defaults write -g NSNavPanelExpandedStateForSaveMode -bool true" \
    "Expand save panel by default"

execute "defaults write -g NSTableViewDefaultSizeMode -int 2" \
    "Set sidebar icon size to medium"

execute "defaults write -g NSUseAnimatedFocusRing -bool false" \
    "Disable the over-the-top focus ring animation"

execute "defaults write -g NSWindowResizeTime -float 0.001" \
    "Accelerated playback when adjusting the window size."

execute "defaults write -g PMPrintingExpandedStateForPrint -bool true" \
    "Expand print panel by default"

execute "defaults write -g QLPanelAnimationDuration -float 0" \
    "Disable opening a Quick Look window animations."

execute "defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false" \
    "Disable resume system-wide"

ask "Please provide a name for your computer: "

execute "sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string '"$(get_answer)"' && \
         sudo scutil --set ComputerName '"$(get_answer)"' && \
         sudo scutil --set HostName '"$(get_answer)"' && \
         sudo scutil --set LocalHostName '"$(get_answer)"'" \
    "Set computer name"

execute "sudo systemsetup -setrestartfreeze on" \
    "Restart automatically if the computer freezes"

# execute "sudo defaults write /Library/Preferences/com.apple.Bluetooth.plist ControllerPowerState 0 && \
#          sudo launchctl unload /System/Library/LaunchDaemons/com.apple.blued.plist && \
#          sudo launchctl load /System/Library/LaunchDaemons/com.apple.blued.plist" \
#     "Turn Bluetooth off"

execute "for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
            sudo defaults write \"\${domain}\" dontAutoLoad -array \
                '/System/Library/CoreServices/Menu Extras/TimeMachine.menu' \
                '/System/Library/CoreServices/Menu Extras/Volume.menu'
         done \
            && sudo defaults write com.apple.systemuiserver menuExtras -array \
                '/System/Library/CoreServices/Menu Extras/Bluetooth.menu' \
                '/System/Library/CoreServices/Menu Extras/AirPort.menu'
        " \
    "Hide Time Machine and Volume icons from the menu bar"

# execute "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user" \
#     "Remove duplicates in the “Open With” menu (also see `lscleanup` alias)"

execute "sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist" \
    "Build Locate Database"

killall "SystemUIServer" &> /dev/null
