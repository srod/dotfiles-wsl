#!/bin/bash

print_in_blue "\n   Time Machine\n\n"

execute "defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true" \
    "Prevent Time Machine from prompting to use new hard drives as backup volume"

execute "hash tmutil &> /dev/null && sudo tmutil disablelocal" \
    "Disable local Time Machine backups"
