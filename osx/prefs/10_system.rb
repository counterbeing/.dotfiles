###############################################################################
# Finder #
# ###############################################################################
 
`defaults write com.apple.finder CreateDesktop -bool false`
 
# Finder: show path bar
`defaults write com.apple.finder ShowPathbar -bool true`
 
# Display full POSIX path as Finder window title
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
 
# When performing a search, search the current folder by default
`defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"`
 
# Disable the warning when changing a file extension
`defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false`
 
# Use list view in all Finder windows by default
# # Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
`defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"`

# Install the Solarized Dark theme for iTerm
`open "${HOME}/init/Solarized Dark.itermcolors"`

# Don’t display the annoying prompt when quitting iTerm
`defaults write com.googlecode.iterm2 PromptOnQuit -bool false`

# Turn off "Play feedback when volume is changed"
`defaults write -g "com.apple.sound.beep.feedback" -int 0`


################################################################################
# Time Machine                                                                #
###############################################################################

# Prevent Time Machine from prompting to use new hard drives as backup volume
`defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true`

# Disable local Time Machine backups
`hash tmutil &> /dev/null && sudo tmutil disablelocal`

###############################################################################
# Address Book, Dashboard, iCal, TextEdit, and Disk Utility                   #
###############################################################################

# Enable the debug menu in Address Book
`defaults write com.apple.addressbook ABShowDebugMenu -bool true`

# Enable the debug menu in Disk Utility
`defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true`
`defaults write com.apple.DiskUtility advanced-image-options -bool true`


###############################################################################
# Mac App Store                                                               #
###############################################################################

# Enable the WebKit Developer Tools in the Mac App Store
`defaults write com.apple.appstore WebKitDeveloperExtras -bool true`

# Enable Debug Menu in the Mac App Store
`defaults write com.apple.appstore ShowDebugMenu -bool true`


