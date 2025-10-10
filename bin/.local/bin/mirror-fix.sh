#! /bin/bash

# Refresh all keys
pacman-key --refresh-keys

# Refresh mirrors
pacman -Sy
