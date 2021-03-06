# Install packages using Brew
class ConfigureAtom
  extend Osx
  include Osx
  MESSAGE = 'Installing atom packages'.freeze
  DEPENDENCIES = %w(brew_gui).freeze

  def call
    packages_file = '~/.dotfiles/links/atom.link/packages.txt'

    puts "Installing packages from list #{packages_file}"

    system("apm install --packages-file #{packages_file}")
    system('apm upgrade')
    system("apm list -ib > #{packages_file}")
  end
end
