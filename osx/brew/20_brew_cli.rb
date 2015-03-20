puts "Installing Brew packages"

recipes = [
    "ack",                     # Search inside of files
    "ansible",                 # System configuration/management
    "bash",                    # Updated bash
    "boris",                   # PHP shell
    "clamav",                  # Antivirus
    "cmake",                   # Compiler
    "ctags",                   # Tagging for Vim
    "curl",                    # Updated
    "ffmpeg",                  # Media encoding
    "ghostscript",             # PDF support for imagemagick
    "git",                     # Version control
    "gnupg",                   # For securing messages
    "htop-osx",                # Activity monitor
    "imagemagick",             # Image manipulation
    "mosh",                    # SSH like client for low quality connections
    "ngrok",                   # Port forwarder
    "node",                    # Node.js
    "openssl",                 # Patched OpenSSL for latest security releases
    "pick",                    # Search multiline strings fuzzily
    "postgresql",              # Database for local servers
    "qt",                      # used in headless browser testing 
    "rbenv",                   # A ruby version manager
    "ssh-copy-id",             # Copies ssh keys and puts in authorized on remote host
    "the_silver_searcher",     # Fast file searching
    "tmate",                   # Easy remote pair sessions
    "tmux",                    # Terminal multiplexer, great for pairing
    "tmux-cssh",               # SSH into multiple computers
    "tree",                    # Display filesystem as tree in terminal
    "unrar",                   # Unrar, that's all 
    "vim",                     # Best text editor ever
    "wget",                    # Curl alternative, some things use it 
    "zsh",                     # Like bash, but way better
    "zsh-syntax-highlighting"  # syntax highlighting as you type
]

recipes.each do |r|
  unless INSTALLED_RECIPES.include?(r) 
    puts "    installing #{r}"
    `brew install #{r}`
  else
    puts "    skipping #{r}"
  end
end
