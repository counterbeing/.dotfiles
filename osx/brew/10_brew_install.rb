# Install packages using Brew
class BrewInstaller
  extend Osx
  MESSAGE = 'Installing brew package manager...'.freeze

  def call
    install_brew

    puts 'Setting you as owner on /usr/local'
    `sudo chown -R "$USER":admin /usr/local`

    `brew tap Homebrew/bundle`
    `brew tap caskroom/fonts`              # fonts
    `brew tap thoughtbot/formulae`         # pick
    `brew install caskroom/cask/brew-cask` # mac os x gui apps
  end

  def install_brew
    if which('brew')
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
