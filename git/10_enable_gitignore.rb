# .
class ConfigureGit
  extend Osx
  DEPENDENCIES = [BrewCli].freeze
  MESSAGE = 'Configuring git...'.freeze

  def call
    `git config --global core.excludesfile ~/.gitignore`
    `git config push.default matching`
  end
end
