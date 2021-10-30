# .
class InstallGems
  extend Bootstrapper
  DEPENDENCIES = %w(install_ruby).freeze
  MESSAGE = 'Installing gems...'.freeze
  DESIRED_VERSIONS = ['2.4.1'].freeze

  def call
    # `
    #   export PATH="$HOME/.rbenv/bin:$PATH"
    #   rbenv global 2.4.1
    #   gem install bundler rubocop scss-lint pry kontena-cli
    # `
  end
end
