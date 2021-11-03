# Install packages using Brew
class BrewGui
  include Osx
  extend Osx
  MESSAGE = 'Installing brew GUI applications...'.freeze
  DEPENDENCIES = %w(brew_installer).freeze

  RECIPES = [
    '1password-cli',
    'adapter',         # Media converter
    'airfoil',         # Stream to airplay devices and more
    'alfred',          # App and file launcher
    'arduino',
    'atom',            # A free GUI text editor... sometimes you want a GUI
    'beamer',          # Stream to chromecast
    'brave-browser',  
    'cocoarestclient', # Simple REST client GUI
    'dash',            # Documentation lookup
    'docker',
    'eagle',
    'electron',
    'firefox',         # browser
    'google-chrome',   # Best browser
    'iterm2',          # Better terminal
    'little-snitch',   # Newtwork monitor and firewall
    'ngrok',           # SSH Tunneling
    'numi',
    'omnidisksweeper', # See whats using disk space in a GUI
    'postman',
    'private-internet-access',
    'qlcolorcode',
    'qlmarkdown',
    'qlstephen',       # Quicklook for files without extension
    'quicklook-csv',   # Quicklook for csv files
    'quicklook-json',  # Quicklook for JSON files
    'sequel-pro',      # Postgres DB admin and viewing schema
    'signal',
    'skype',           # Chat and calls
    'slack',           # Business chat client
    'sonos',
    'sourcetree',
    'sourcetree',
    'spectacle',       # Resize windows quickly
    'spotify',
    'steam',
    'steam',
    'torbrowser',      # Anonymous browser
    'transmission',    # Torrent client
    'typora',
    'vagrant',         # Configurations for virtual machines
    'videostream',
    'virtualbox',      # Run VMs for things like vagrant
    'visual-studio-code',
    'vlc',             # Video player
    'webpquicklook',
    'wireshark',
    'xquartz'          # For headless browser testing, and other things
  ].freeze

  def call
    RECIPES.each do |r|
      if installed_cask_recipes.include?(r) ||
         installed_applications.include?(r)
        puts "    skipping #{r}"
      else
        puts "    installing #{r}"
        system("brew install --cask --appdir='/Applications' #{r}")
      end
    end
  end
end
