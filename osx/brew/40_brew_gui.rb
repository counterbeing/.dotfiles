puts "#{Tty.blue}Installing brew GUI applications...#{Tty.reset}"

recipes = [
    "1password",       # Password manager
    "adapter",         # Media converter
    "adium",           # Chat client
    "alfred",          # App and file launcher
    "aviator",         # Browser without history
    "caffeine",        # Keep your computer awake
    "cocoarestclient", # Simple REST client GUI
    "colloquy",        # IRC Client
    "cyberduck",       # FTP Client
    "dash",            # Documentation lookup
    "fing",            # Network scanner
    "firefox",         # browser
    "google-chrome",   # Best browser
    "gpgtools",        # Secure GPG Email through Apple Mail
    "hipchat",         # Business chat client
    "iterm2",          # Better terminal
    "little-snitch",   # Newtwork monitor and firewall
    "mou",             # Markdown editor
    "omnidisksweeper", # See whats using disk space in a GUI
    "omnifocus",       # Task managment
    "qlstephen",       # Quicklook for files without extension
    "quicklook-csv",   # Quicklook for csv files
    "quicklook-json",  # Quicklook for JSON files
    "sequel-pro",      # Postgres DB admin and viewing schema
    "skype",           # Chat and calls
    "slack",           # Business chat client
    "spectacle",       # Resize windows quickly
    "torbrowser",      # Anonymous browser
    "transmission",    # Torrent client
    "transmit",        # FTP Client
    "vagrant",         # Configurations for virtual machines
    "vlc"              # Video player
]

recipes.each do |r|
  unless INSTALLED_CASK_RECIPES.include?(r) || INSTALLED_APPLICATIONS.include?(r)
    puts "    installing #{r}"
    `brew cask install --appdir="/Applications" #{r}`
  else
    puts "    skipping #{r}"
  end
end

