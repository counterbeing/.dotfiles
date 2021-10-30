# .
class InstallRuby
  extend Bootstrapper
  DEPENDENCIES = %w(brew_cli linux_rbenv_install).freeze
  MESSAGE = 'Installing ruby...'.freeze
  DESIRED_VERSIONS = ['3.0.2'].freeze

  def call
    # `sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev`
    # DESIRED_VERSIONS.each do |version|
    #   puts "    Installing version #{version} within rbenv."
    #   `export PATH="$HOME/.rbenv/bin:$PATH"; rbenv install -s #{version}`
    # end
    # `export PATH="$HOME/.rbenv/bin:$PATH"; rbenv rehash`
  end

  def installed_versions
    @installed_versions ||= `rbenv versions`
  end
end
