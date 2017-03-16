# .
class InstallRuby
  extend Osx
  DEPENDENCIES = %w(brew_cli).freeze
  MESSAGE = 'Installing ruby...'.freeze
  INSTALLED_VERSIONS = `rbenv versions`.freeze
  DESIRED_VERSIONS = [
    '2.4.0'
  ].freeze

  def call
    DESIRED_VERSIONS.each do |version|
      unless INSTALLED_VERSIONS.include?(version)
        puts "    Installing version #{version} within rbenv."
        `rbenv install #{version}`
      end
    end
  end
end
