# .
class LinkPlists
  extend Osx
  include Osx
  MESSAGE = 'Linking plists...'.freeze

  def call
    puts self.class::PLATFORMS
    prefs_destination = Utils::HOME + '/Library/Preferences'
    prefs_source = (File.expand_path File.dirname(__FILE__)) + '/plists'
    files = Dir.glob(prefs_source + '/*.plist')

    files.each do |file|
      filename = %r{/([^/]+.plist)$}.match(file)[1]
      # filename = /\/([^\/]+.plist)$/.match(file)[1]
      destination = prefs_destination + '/' + filename
      Utils.copy_file_with_backup(file, destination)
    end
  end
end
