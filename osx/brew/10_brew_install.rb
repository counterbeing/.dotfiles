unless which("brew")
    puts "Installing homebrew"
    system('ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')
end


`brew tap caskroom/fonts`              # fonts
`brew tap thoughtbot/formulae`         # pick
`brew tap nviennot/tmate`              # for tmate
`brew install caskroom/cask/brew-cask` # mac os x gui apps

