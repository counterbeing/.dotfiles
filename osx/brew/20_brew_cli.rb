# Install packages using Brew
class BrewCli
  include Osx
  extend Osx
  DEPENDENCIES = %w(brew_installer).freeze
  MESSAGE = 'Installing Brew packages...'.freeze

  RECIPES = [
    'ack',                        # Search inside of files
    'ansible',                    # System configuration/management
    'asciinema',
    'asdf',
    'autoenv',                    # Automatically source .env files in any dir
    'awscli',
    'bash',                       # Updated bash
    'bfg',
    'cfssl',
    'clamav',                     # Antivirus
    'clang-format',
    'cmake',                      # Compiler
    'cowsay',
    'ctags',                      # Tagging for Vim
    'curl',                       # Updated
    'diff-so-fancy',
    'direnv',
    'docker-clean',
    'duplicity',
    'exiftool',
    'fd',
    'ffmpeg',
    'hyperfine',
    'fzf',
    'ghostscript',                # PDF support for imagemagick
    'git-crypt',
    'git',                        # Version control
    'gnupg',                      # For securing messages
    'go',
    'gpg-agent',
    'heroku',
    'highlight',
    'htop-osx',                   # Activity monitor
    'httpie',
    'hub',
    'hugo',
    'imagemagick',                # Image manipulation
    'jpeg',
    'jq',                         # Parse json in bash
    'jwt-cli',
    'k9s',
    'kafkacat',
    'kubectx',
    'lame',
    'libpng',
    'libssh',
    'libssh2',
    'libtiff',
    'mobile-shell',               # SSH like client for low quality connections aka mosh
    'mtr',                        # Debugging network connections
    'openssl',                    # Patched OpenSSL for latest security releases
    'pgcli',
    'pick',                       # Search multiline strings fuzzily
    'pinentry-mac',
    'postgresql',                 # Database for local servers
    'python',                     # Recent python
    'reattach-to-user-namespace', # Allows Tmux to interact with the system pasteboard via pbcopy etc
    'redis',
    'ruby-build',                 # Build ruby versions for rbenv
    'sassc',
    'siege',                      # Load testing
    'speedtest_cli',
    'ssh-copy-id',                # Copies ssh keys and puts in authorized on remote host
    'terminal-notifier',          # Send notifications to notification center
    'terraform',
    'the_silver_searcher',        # Fast file searching
    'thefuck',                    # Automagic command correction
    'tig',                        # Beautiful git visualization
    'tmate',                      # Easy remote pair sessions
    'tmux-cssh',                  # SSH into multiple computers
    'tmux',                       # Terminal multiplexer, great for pairing
    'tmuxinator',
    'tor',
    'tree',                       # Display filesystem as tree in terminal
    'unar',                       # Unrar, that's all
    'owenthereal/upterm/upterm',
    'vim',                        # Best text editor ever
    'wget',                       # Curl alternative, some things use it
    'youtube-dl',
    'zlib',                       # Compression, useful for siege
    'zsh-completions',            # Various zsh completions
    'zsh',                        # Like bash, but way better
    'zsh-syntax-highlighting'     # syntax highlighting as you type
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
