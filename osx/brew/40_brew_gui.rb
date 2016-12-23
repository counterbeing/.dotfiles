puts "#{Tty.blue}Installing brew GUI applications...#{Tty.reset}"

recipes = [
  # "1password",     # Password manager
  # GPGTools seems to halt execution and fail
  # I'm hoping this is fixed some time soon
  # "gpgtools",      # Secure GPG Email through Apple Mail
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
  'monity-helper',
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
]

recipes.each do |r|
  if INSTALLED_CASK_RECIPES.include?(r) || INSTALLED_APPLICATIONS.include?(r)
    puts "    skipping #{r}"
  else
    puts "    installing #{r}"
    system("brew cask install --appdir='/Applications' #{r}")
  end
end
