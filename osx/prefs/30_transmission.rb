# .
class PreferencesTransmission
  extend Osx
  MESSAGE = 'Setting transmission prefs'.freeze
  def call
    # Use `~/Documents/Torrents` to store incomplete downloads
    `defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true`
    `defaults write org.m0k.transmission IncompleteDownloadFolder -string "#{Utils::HOME}/Documents/Torrents"`

    # Don't prompt for confirmation before downloading
    `defaults write org.m0k.transmission DownloadAsk -bool false`

    # Trash original torrent files
    `defaults write org.m0k.transmission DeleteOriginalTorrent -bool true`

    # Hide the donate message
    `defaults write org.m0k.transmission WarningDonate -bool false`
    # Hide the legal disclaimer
    `defaults write org.m0k.transmission WarningLegal -bool false`

    # automatically load torrent files available
    `defaults write org.m0k.transmission AutoImport -bool true`
    `defaults write org.m0k.transmission AutoImportDirectory -string "somewhere"`
  end
end
