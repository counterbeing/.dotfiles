# .
class RestartApps
  extend Osx
  DEPENDENCIES = %w(
    link_plists preferences_dock_and_dash preferences_system
  ).freeze
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
