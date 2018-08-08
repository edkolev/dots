
# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# use C-w to delete word and C-u to delete to beginning of line
mkdir -p ~/Library/Keybindings/
echo '
{
    "^w" = deleteWordBackward:;
    "^u" = deleteToBeginningOfLine:;
}
' > ~/Library/Keybindings/DefaultKeyBinding.dict
