puts "#{Tty.blue}Installing Brew packages...#{Tty.reset}"

recipes = [
    "Caskroom/cask/osxfuse",      # For mounting filesystems, use this alternate source because of kexts
    "ack",                        # Search inside of files
    "ansible",                    # System configuration/management
    "bash",                       # Updated bash
    "clamav",                     # Antivirus
    "cmake",                      # Compiler
    "ctags",                      # Tagging for Vim
    "curl",                       # Updated
    "ffmpeg",                     # Media encoding
    "ghostscript",                # PDF support for imagemagick
    "git",                        # Version control
    "git-flow",                   #
    "gnupg",                      # For securing messages
    "htop-osx",                   # Activity monitor
    "imagemagick",                # Image manipulation
    "memcached",
    "mobile-shell",               # SSH like client for low quality connections aka mosh
    "ngrok",                      # Port forwarder
    "node",                       # Node.js
    "openssl",                    # Patched OpenSSL for latest security releases
    "pick",                       # Search multiline strings fuzzily
    "postgresql",                 # Database for local servers
    "python",                     # Recent python
    "qt",                         # used in headless browser testing
    "rbenv",                      # A ruby version manager
    "reattach-to-user-namespace", # Allows Tmux to interact with the system pasteboard via pbcopy etc
    "ruby-build",                 # Build ruby versions for rbenv
    "ssh-copy-id",                # Copies ssh keys and puts in authorized on remote host
    "sshfs",                      # Mount a filesystem over ssh using osxfuse
    "the_silver_searcher",        # Fast file searching
    "tmate",                      # Easy remote pair sessions
    "tmux",                       # Terminal multiplexer, great for pairing
    "tmux-cssh",                  # SSH into multiple computers
    "tree",                       # Display filesystem as tree in terminal
    "unrar",                      # Unrar, that's all
    "vim",                        # Best text editor ever
    "wget",                       # Curl alternative, some things use it
    "zsh",                        # Like bash, but way better
    "zsh-completions",            # Various zsh completions
    "zsh-syntax-highlighting"     # syntax highlighting as you type
]

recipes.each do |r|
  unless INSTALLED_RECIPES.include?(r)
    puts "    installing #{r}"
    `brew install #{r}`
  else
    puts "    skipping #{r}"
  end
end
