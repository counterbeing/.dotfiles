# Install packages using Brew
class BrewCli
  include Osx
  extend Osx
  DEPENDENCIES = %w[brew_installer].freeze
  MESSAGE = 'Installing Brew packages...'.freeze

  RECIPES = [
    'ack', # Search inside of files
    'ansible', # System configuration/management
    'asciinema',
    'asdf', # Version manager for many languages
    'autoenv', # Automatically source .env files in any dir
    'awscli',
    'bash', # Updated bash
    'bfg', # Git repo cleaner
    'clang-format', # Code formatting for C
    'cmake', # Compiler
    'cowsay', # Fun
    'ctags', # Tagging for Vim
    'curl', # Updated
    'diff-so-fancy', # Better git diffs
    'direnv', # Automatically source .env files in any dir
    'exiftool',
    'fd',
    'ffmpeg',
    'exa', # ls replacement
    'bat', # cat replacement
    'hyperfine', # Benchmarking
    'fzf', # Fuzzy finder
    'ghostscript', # PDF support for imagemagick
    'git', # Version control
    'gnupg', # For securing messages
    'go',
    'gpg-agent', # For securing messages
    'highlight', # Syntax highlighting
    'htop-osx', # Activity monitor
    'httpie', # HTTP client
    'hub', # Github CLI
    'imagemagick', # Image manipulation
    'jpeg',
    'jq', # Parse json in bash
    'yq',
    'jwt-cli', # JWT token manipulation
    'k9s', # Kubernetes CLI
    'kubectx',
    'lame',
    'libpng',
    'libssh',
    'libssh2',
    'libtiff',
    'mobile-shell', # SSH like client for low quality connections aka mosh
    'mtr', # Debugging network connections
    'openssl', # Patched OpenSSL for latest security releases
    'pgcli', # Postgres CLI
    'pick', # Search multiline strings fuzzily
    'pinentry-mac', # For GPG
    'postgresql', # Database for local servers
    'python', # Recent python
    'reattach-to-user-namespace', # Allows Tmux to interact with the system pasteboard via pbcopy etc
    'redis',
    'ruby-build', # Build ruby versions for rbenv
    'sassc',
    'siege', # Load testing
    'speedtest_cli',
    'starship', # Shell prompt
    'ssh-copy-id', # Copies ssh keys and puts in authorized on remote host
    'terminal-notifier', # Send notifications to notification center
    'terraform',
    'the_silver_searcher', # Fast file searching
    'thefuck', # Automagic command correction
    'tig', # Beautiful git visualization
    'tldr', # Cliff notes for man pages
    'tmate', # Easy remote pair sessions
    'tmux-cssh', # SSH into multiple computers
    'tmux', # Terminal multiplexer, great for pairing
    'tmuxinator', #
    'tree', # Display filesystem as tree in terminal
    'unar', # Unrar, that's all
    'owenthereal/upterm/upterm',
    'vim', # Best text editor ever
    'wget', # Curl alternative, some things use it
    'youtube-dl',
    'yq', # jq for yaml
    'zlib', # Compression, useful for siege
    # 'zsh-completions', # Various zsh completions
    'zsh', # Like bash, but way better
    'zsh-syntax-highlighting', # syntax highlighting as you type
  ].freeze

  def call
    RECIPES.each do |r|
      if installed_recipes.include?(r)
        puts "    skipping #{r}"
      else
        puts "    installing #{r}"
        system("brew install #{r}")
      end
    end
  end
end
