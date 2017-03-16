# .
class InstallRuby
  DEPENDENCIES = %w(brew_cli linux_rbenv_install).freeze
  MESSAGE = 'Installing ruby...'.freeze
  DESIRED_VERSIONS = ['2.4.0'].freeze

  def call
    DESIRED_VERSIONS.each do |version|
      unless INSTALLED_VERSIONS.include?(version)
        puts "    Installing version #{version} within rbenv."
        `rbenv install #{version}`
      end
    end
  end

  def installed_versions
    @installed_versions ||= `rbenv versions`
  end
end
