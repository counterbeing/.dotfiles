# .
class RestartApps
  extend Osx
  DEPENDENCIES = [LinkPlists, PreferencesDockAndDash, PreferencesSystem].freeze
  MESSAGE = 'Restarting apps...'.freeze
  APPS = [
    'Activity Monitor',
    'Address Book',
    'Calendar',
    'Contacts',
    'Dock',
    'Finder',
    'Mail',
    'Messages',
    'Safari',
    'Spectacle',
    'SystemUIServer',
    'Transmission',
    'Twitter'
  ].freeze

  def call
    APPS.each do |app|
      `killall #{app} > /dev/null 2>&1`
    end
  end
end
