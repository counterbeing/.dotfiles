#!/usr/bin/env bash
 
if [ "$(uname)" != "Darwin" ]; then
    exit
fi
 
if ! which brew &> /dev/null; then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

echo "Installing Brew packages"
brew install \
    ack \                     # Search inside of files
    ansible \                 # System configuration/management
    bash \                    # Updated bash
    boris \                   # PHP shell
    clamav \                  # Antivirus
    cmake \                   # Compiler
    coreutils \
    ctags \
    curl \
    ffmpeg \                  # Media encoding
    ghostscript \             # PDF support for imagemagick
    git \                     # Version control
    gnupg \                   # For securing messages
    htop-osx \                # Activity monitor
    imagemagick \             # Image manipulation
    lynx \
    mosh \                    # SSH like client for low quality connections
    ngrok \                   # Port forwarder
    node \                    # Node.js
    openssl \                 # Patched OpenSSL for latest security releases
    pick \                    # Search multiline strings fuzzily
    postgresql  \
    qt \
    rbenv \                   # A ruby version manager
    sox \                     # Audio conversion tool
    ssh-copy-id \             # Copies ssh keys and puts in authorized on remote host
    the_silver_searcher \     # Fast file searching
    tmate \                   # Easy remote pair sessions
    tmux \                    # Terminal multiplexer, great for pairing
    tmux-cssh \               # SSH into multiple computers
    tree \                    # Display filesystem as tree in terminal
    unrar \
    vim \                     # Best text editor ever
    watch \
    wget \
    zsh \                     # Like bash, but way better
    zsh-syntax-highlighting \
    caskroom/cask/brew-cask \

# GUI applications
 
brew cask install --appdir="/Applications" \
    adapter \         # Media converter
    adium \           # Chat client
    alfred \          # App and file launcher
    aviator \         # Browser without history
    caffiene \        # Keep your computer awake
    colloquy \        # IRC Client
    cyberduck \       # FTP Client
    dash \            # Documentation lookup
    fing \            # Network scanner
    firefox \         # browser
    google-chrome \   # Best browser
    gpgtools \        # Secure GPG Email through Apple Mail
    hipchat \         # Business chat client
    iterm2 \          # Better terminal
    little-snitch \   # Newtwork monitor and firewall
    omnifocus \       # Task managment
    onepassword \     # Password manager
    qlstephen \       # Quicklook for files without extension
    quicklook-csv \   # Quicklook for csv files
    quicklook-json \  # Quicklook for JSON files
    sequel-pro \      # Postgres DB admin and viewing schema
    omnidisksweeper \ # See whats using disk space in a GUI
    skype \           # Chat and calls
    slack \           # Business chat client
    spectacle \       # Resize windows quickly
    torbrowser \      # Anonymous browser
    transmission \    # Torrent client
    transmit \        # FTP Client
    vlc \             # Video player

# Fonts
echo "installing fonts..."
brew tap caskroom/fonts
brew cask install \
  font-meslo-lg-for-powerline \ # Used in terminal
  font-m-plus \
  font-clear-sans \
  font-roboto \


# Turn off "Play feedback when volume is changed"
defaults write -g "com.apple.sound.beep.feedback" -int 0
 
###############################################################################
# Dock, Dashboard, and hot corners #
# ###############################################################################
 
# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Don’t group windows by application in Mission Control
# (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool false

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true
 
###############################################################################
# Finder #
# ###############################################################################
 
defaults write com.apple.finder CreateDesktop -bool false
 
# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true
 
# Display full POSIX path as Finder window title
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
 
# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
 
# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
 
# Use list view in all Finder windows by default
# # Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Install the Solarized Dark theme for iTerm
open "${HOME}/init/Solarized Dark.itermcolors"

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

###############################################################################
# Time Machine                                                                #
###############################################################################

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
hash tmutil &> /dev/null && sudo tmutil disablelocal
 

###############################################################################
# Address Book, Dashboard, iCal, TextEdit, and Disk Utility                   #
###############################################################################

# Enable the debug menu in Address Book
defaults write com.apple.addressbook ABShowDebugMenu -bool true

# Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

###############################################################################
# Mac App Store                                                               #
###############################################################################

# Enable the WebKit Developer Tools in the Mac App Store
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# Enable Debug Menu in the Mac App Store
defaults write com.apple.appstore ShowDebugMenu -bool true


###############################################################################
# Messages                                                                    #
###############################################################################

# Disable automatic emoji substitution (i.e. use plain text smileys)
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

# Disable smart quotes as it’s annoying for messages that contain code
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# Disable continuous spell checking
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false

###############################################################################
# GPGMail 2                                                                   #
###############################################################################

# Disable signing emails by default
defaults write ~/Library/Preferences/org.gpgtools.gpgmail SignNewEmailsByDefault -bool false


###############################################################################
# Transmission.app                                                            #
###############################################################################

# Use `~/Documents/Torrents` to store incomplete downloads
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Documents/Torrents"

# Don’t prompt for confirmation before downloading
defaults write org.m0k.transmission DownloadAsk -bool false

# Trash original torrent files
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# Hide the donate message
defaults write org.m0k.transmission WarningDonate -bool false
# Hide the legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false


###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
  "Dock" "Finder" "Mail" "Messages" "Safari" "SizeUp" "Spectacle" \
  "SystemUIServer" "Terminal" "Transmission" "Twitter"; do
  killall "${app}" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."

