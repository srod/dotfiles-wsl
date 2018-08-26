#!/bin/bash

print_in_blue "\n • Preferences\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Close any open `System Preferences` panes in order to
# avoid overriding the preferences that are being changed.

osascript -e 'tell application "System Preferences" to quit'

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

source preferences/app_store.sh
source preferences/dock.sh
source preferences/finder.sh
source preferences/keyboard.sh
source preferences/language_and_region.sh
source preferences/mail.sh
source preferences/photos.sh
source preferences/safari.sh
source preferences/textedit.sh
source preferences/trackpad.sh
source preferences/tweetbot.sh
source preferences/ui_and_ux.sh
