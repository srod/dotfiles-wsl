#!/bin/bash

print_in_blue "\n   Language & Region\n\n"

execute "defaults write -g AppleLanguages -array 'en'" \
    "Set language"

execute "defaults write -g AppleMeasurementUnits -string 'Centimeters'" \
    "Set measurement units"

execute "defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false" \
    "Disable auto-correct"

execute "sudo systemsetup -settimezone 'Europe/Paris'" \
    "Set the timezone; see 'sudo systemsetup -listtimezones' for other values"
