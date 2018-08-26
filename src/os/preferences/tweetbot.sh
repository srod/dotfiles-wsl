#!/bin/bash

print_in_blue "\n   Tweetbot\n\n"

execute "defaults write com.tapbots.TweetbotMac OpenURLsDirectly -bool true" \
    "Bypass the annoyingly slow t.co URL shortener"

killall "Tweetbot" &> /dev/null
