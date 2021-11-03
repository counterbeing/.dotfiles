# Install packages using Brew
class BrewInstaller
  extend Osx
  include Osx
  MESSAGE = 'Installing brew package manager...'.freeze

  def call
    install_brew

    puts 'Setting you as owner on /usr/local'
    `sudo chown -R "$USER":admin /usr/local`

    `brew tap Homebrew/bundle`
    `brew tap homebrew/cask-fonts`         # fonts
    `brew tap thoughtbot/formulae`         # pick
    `brew tap mike-engel/jwt-cli`         
    # If you have a custom sudo, it needs special permissions
    `/usr/bin/sudo chown root:wheel /usr/local/bin/sudo`
    `/usr/bin/sudo chmod 4755 /usr/local/bin/sudo`
  end

  def install_brew
    if Utils.which('brew')
      puts 'Homebrew already installed'
      `brew update`
    else
      puts 'Installing homebrew'
      system(
        'ruby -e "$(curl -fsSL ' \
        'https://raw.githubusercontent.com/Homebrew/install/master/install)"'
      )
    end
  end
end
