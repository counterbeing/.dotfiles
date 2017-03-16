# .
class PreferencesSystem
  extend Osx
  MESSAGE = 'Setting system prefs'.freeze

  def call
    # Disable accents on holding
    `defaults write com.github.atom ApplePressAndHoldEnabled -bool false`
    # `defaults write -g ApplePressAndHoldEnabled -bool false`

    # Menu bar: show battery percentage
    `defaults write com.apple.menuextra.battery ShowPercent -string "YES"`

    # Expand print panel by default
    `defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true`

    # Save to disk (not to iCloud) by default
    `defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false`

    `defaults write com.apple.finder CreateDesktop -bool false`

    # Finder: show path bar
    `defaults write com.apple.finder ShowPathbar -bool true`

    # Display full POSIX path as Finder window title
    # defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

    # When performing a search, search the current folder by default
    `defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"`

    # Disable the warning when changing a file extension
    `defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false`

    # Finder: show all filename extensions
    `defaults write NSGlobalDomain AppleShowAllExtensions -bool true`

    # Use list view in all Finder windows by default
    # # Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
    `defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"`

    # Turn off "Play feedback when volume is changed"
    `defaults write -g "com.apple.sound.beep.feedback" -int 0`

    # Menu bar: hide the Time Machine and User icons
    `defaults write ~/Library/Preferences/ByHost/com.apple.systemuiserver.* dontAutoLoad -array \
       "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
       "/System/Library/CoreServices/Menu Extras/User.menu" `

    # Developer CrashReport dialog type
    `defaults write com.apple.CrashReporter DialogType developer`

    # Trackpad: enable tap to click for this user and for the login screen
    `defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true`
    `defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1`
    `defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1`

    # Enable snap-to-grid for icons on the desktop and in other icon views
    `/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist`
    `/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist`
    `/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist`

    # Show the ~/Library folder
    `chflags nohidden ~/Library`

    # Enable full keyboard access for all controls
    # # (e.g. enable Tab in modal dialogs)
    `defaults write NSGlobalDomain AppleKeyboardUIMode -int 3`

    # Prevent Time Machine from prompting to use new hard drives as backup volume
    `defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true`

    # Disable local Time Machine backups
    `hash tmutil &> /dev/null && sudo tmutil disablelocal`

    # Enable the debug menu in Address Book
    `defaults write com.apple.addressbook ABShowDebugMenu -bool true`

    # Enable the debug menu in Disk Utility
    `defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true`
    `defaults write com.apple.DiskUtility advanced-image-options -bool true`

    # Enable the WebKit Developer Tools in the Mac App Store
    `defaults write com.apple.appstore WebKitDeveloperExtras -bool true`

    # Enable Debug Menu in the Mac App Store
    `defaults write com.apple.appstore ShowDebugMenu -bool true`
  end
end
