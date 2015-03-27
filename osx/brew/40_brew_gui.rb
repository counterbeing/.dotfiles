puts "#{Tty.blue}Installing brew GUI applications...#{Tty.reset}"

recipes = [
    "1password",       # Password manager
    "adapter",         # Media converter
    "adium",           # Chat client
    "alfred",          # App and file launcher
    "cocoarestclient", # Simple REST client GUI
    "colloquy",        # IRC Client
    "cyberduck",       # FTP Client
    # "dash",            # Documentation lookup
    "dropbox",         # Documentation lookup
    "firefox",         # browser
    "google-chrome",   # Best browser
    # GPGTools seems to halt execution and fail
    # I'm hoping this is fixed some time soon
    # "gpgtools",        # Secure GPG Email through Apple Mail
    "iterm2",          # Better terminal
    "little-snitch",   # Newtwork monitor and firewall
    "macdown",         # Markdown editor
    "omnidisksweeper", # See whats using disk space in a GUI
    "omnifocus",       # Task managment
    "propane",         # Chat client
    "qlstephen",       # Quicklook for files without extension
    "quicklook-csv",   # Quicklook for csv files
    "quicklook-json",  # Quicklook for JSON files
    "sequel-pro",      # Postgres DB admin and viewing schema
    "skype",           # Chat and calls
    "slack",           # Business chat client
    "spectacle",       # Resize windows quickly
    "torbrowser",      # Anonymous browser
    "transmission",    # Torrent client
    "vagrant",         # Configurations for virtual machines
    "virtualbox",      # Run VMs for things like vagrant
    "vlc",             # Video player
    "xquartz"          # For headless browser testing, and other things
]

recipes.each do |r|
  unless INSTALLED_CASK_RECIPES.include?(r) || INSTALLED_APPLICATIONS.include?(r)
    puts "    installing #{r}"
    `brew cask install --appdir="/Applications" #{r}`
  else
    puts "    skipping #{r}"
  end
end

