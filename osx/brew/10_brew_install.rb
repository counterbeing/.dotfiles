unless which("brew")
  puts "Installing homebrew"
  system('ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')
else
  `brew update`
end


`brew tap caskroom/fonts`              # fonts
`brew tap thoughtbot/formulae`         # pick
`brew tap nviennot/tmate`              # for tmate
`brew install caskroom/cask/brew-cask` # mac os x gui apps

INSTALLED_CASK_RECIPES =  `brew cask list`
INSTALLED_RECIPES =  `brew list`
INSTALLED_TAPS = `brew taps`
INSTALLED_APPLICATIONS = Dir.entries("/Applications").join('').gsub(' ', '-').downcase


