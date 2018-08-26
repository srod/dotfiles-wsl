#!/bin/bash

print_in_blue "\n   Cleanup\n\n"

brew_cleanup

execute \
    "gem cleanup" \
    "GEM (cleanup)"

execute \
    "rm -rf $HOME/.bash.local" \
    "Remove local bash"
