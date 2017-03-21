# .
class InstallGems
  extend Bootstrapper
  DEPENDENCIES = %w(install_ruby).freeze
  MESSAGE = 'Installing gems...'.freeze
  DESIRED_VERSIONS = ['2.4.0'].freeze

  def call
    `
      rbenv global 2.4.0
      gem install bundler rubocop scss-lint pry
    `
  end
end
