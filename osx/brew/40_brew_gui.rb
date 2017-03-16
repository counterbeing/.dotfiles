# Install packages using Brew
class BrewGui
  extend Osx
  MESSAGE = 'Installing brew GUI applications...'.freeze

  RECIPES = [
    'adafruit-arduino',
    'adapter',         # Media converter
    'airfoil',         # Stream to airplay devices and more
    'alfred',          # App and file launcher
    'atom',            # A free GUI text editor... sometimes you want a GUI
    'beamer',          # Stream to chromecast
    'cocoarestclient', # Simple REST client GUI
    'cscreen',
    'cyberduck',       # FTP Client
    'dash',            # Documentation lookup
    'dropbox',         # Documentation lookup
    'electron',
    'firefox',         # browser
    'google-chrome',   # Best browser
    'helm',
    'iterm2',          # Better terminal
    'little-snitch',   # Newtwork monitor and firewall
    'macdown',         # Markdown editor
    'ngrok',           # SSH Tunneling
    'omnidisksweeper', # See whats using disk space in a GUI
    'omnifocus',       # Task managment
    'qlmarkdown',
    'qlstephen',       # Quicklook for files without extension
    'quicklook-csv',   # Quicklook for csv files
    'quicklook-json',  # Quicklook for JSON files
    'screenhero',
    'sequel-pro',      # Postgres DB admin and viewing schema
    'skype',           # Chat and calls
    'slack',           # Business chat client
    'sonos',
    'spectacle',       # Resize windows quickly
    'spotify',
    'torbrowser',      # Anonymous browser
    'transmission',    # Torrent client
    'unrarx',          # Decompress rar files
    'vagrant',         # Configurations for virtual machines
    'virtualbox',      # Run VMs for things like vagrant
    'vlc',             # Video player
    'xquartz'          # For headless browser testing, and other things
  ].freeze

  def call
    RECIPES.each do |r|
      if installed_cask_recipes.include?(r) ||
         installed_applications.include?(r)
        puts "    skipping #{r}"
      else
        puts "    installing #{r}"
        system("brew cask install --appdir='/Applications' #{r}")
      end
    end
  end
end
