if which('brew')
  `brew update`
else
  puts 'Installing homebrew'
  system('ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')
end

# Set permissions on the brew folder
puts 'Setting you as owner on /usr/local'
`sudo chown -R "$USER":admin /usr/local`

`brew tap Homebrew/bundle`
`brew tap caskroom/fonts`              # fonts
`brew tap thoughtbot/formulae`         # pick
`brew install caskroom/cask/brew-cask` # mac os x gui apps

INSTALLED_CASK_RECIPES = `brew cask list`.freeze
INSTALLED_RECIPES = `brew list`.freeze
INSTALLED_TAPS = `brew tap`.freeze
