# .
class LinkDotfiles
  extend Bootstrapper
  MESSAGE = 'Linking plists...'.freeze
  FOLDER = File.expand_path File.dirname(__FILE__)
  FILES = Dir.glob(FOLDER + '/*.link')

  def call
    FILES.each do |file|
      filename = %r{//([^/]+).link$/}.match(file)[1]
      # filename = /\/([^\/]+).link$/.match(file)[1]
      destination = Utils::HOME + '/.' + filename
      make_link_where_appropriate(file, destination)
    end
  end
end
