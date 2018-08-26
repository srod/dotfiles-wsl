#!/bin/bash

print_in_blue "\n   Mail\n\n"

execute "defaults write com.apple.mail DisableReplyAnimations -bool true && \
         defaults write com.apple.mail DisableSendAnimations -bool true" \
    "Disable send and reply animations"

execute "defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false" \
    "Copy email addresses as 'foo@example.com' instead of 'Foo Bar <foo@example.com>''"

execute "defaults write com.apple.mail NSUserKeyEquivalents -dict-add 'Send' '@\U21a9'" \
    "Add the keyboard shortcut ⌘ + Enter to send an email"

killall "Mail" &> /dev/null
