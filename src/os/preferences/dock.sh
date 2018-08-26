#!/bin/bash

print_in_blue "\n   Dock\n\n"

execute "defaults write com.apple.dock autohide -bool true" \
    "Automatically hide/show the Dock"

execute "defaults write com.apple.dock autohide-delay -float 0" \
    "Disable the hide Dock delay"

execute "defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true" \
    "Enable spring loading for all Dock items"

execute "defaults write com.apple.dock expose-animation-duration -float 0.1" \
    "Make all Mission Control related animations faster."

execute "defaults write com.apple.dock expose-group-by-app -bool true" \
    "Group windows by application in Mission Control"

# execute "defaults write com.apple.dock launchanim -bool false" \
#     "Disable the opening of an application from the Dock animations."

execute "defaults write com.apple.dock mineffect -string 'scale'" \
    "Change minimize/maximize window effect"

execute "defaults write com.apple.dock minimize-to-application -bool true" \
    "Reduce clutter by minimizing windows into their application icons"

execute "defaults write com.apple.dock mru-spaces -bool false" \
    "Do not automatically rearrange spaces based on most recent use"

execute "defaults write com.apple.dock persistent-apps -array && \
         defaults write com.apple.dock persistent-others -array " \
    "Wipe all app icons"

execute "defaults write com.apple.dock show-process-indicators -bool true" \
    "Show indicator lights for open applications"

execute "defaults write com.apple.dock showhidden -bool true" \
    "Make icons of hidden applications translucent"

execute "defaults write NSGlobalDomain AppleMiniaturizeOnDoubleClick -bool true" \
    "Double-click a window's title bar to minimize"

execute "defaults write com.apple.dock magnification -bool true" \
    "Enable magnification"

execute "defaults write com.apple.dock tilesize -int 44" \
    "Set the icon size of Dock items to 44 pixels"

execute "defaults write com.apple.dock largesize -int 64" \
    "Set the over icon size of Dock items to 64 pixels"

execute "defaults write com.apple.dock dashboard-in-overlay -bool true" \
    "Don’t show Dashboard as a Space"

execute "defaults write com.apple.dock autohide -bool true" \
    "Automatically hide and show the Dock"

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# Top left screen corner → Mission Control
#defaults write com.apple.dock wvous-tl-corner -int 2
#defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Desktop
#defaults write com.apple.dock wvous-tr-corner -int 4
#defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Start screen saver
#defaults write com.apple.dock wvous-bl-corner -int 5
#defaults write com.apple.dock wvous-bl-modifier -int 0
# ⌘ Bottom left screen corner → Start screen saver

execute "defaults write com.apple.dock 'wvous-br-corner' -int 5 && \
         defaults write com.apple.dock 'wvous-br-modifier' -int 1048576" \
    "Hot corners"

killall "Dock" &> /dev/null
