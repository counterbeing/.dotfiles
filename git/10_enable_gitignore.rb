# .
class ConfigureGit
  extend Osx
  DEPENDENCIES = %w(brew_cli).freeze
  MESSAGE = 'Configuring git...'.freeze

  def call
    `git config --global core.excludesfile ~/.gitignore`
    `git config push.default matching`
    `git config --global user.name "Cory Logan"`
    `git config --global user.email he@corylogan.com`
    `git config --global push.default simple`
  end
end
