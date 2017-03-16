# Install packages using Brew
class BrewCli
  extend Osx
  MESSAGE = 'Installing Brew packages...'.freeze

  # rubocop:disable Metrics/LineLength
  RECIPES = [
    'Caskroom/cask/osxfuse',      # For mounting filesystems, use this alternate source because of kexts
    'ack',                        # Search inside of files
    'ansible',                    # System configuration/management
    'asciinema',
    'autoenv',                    # Automatically source .env files in any dir
    'awscli',
    'bash',                       # Updated bash
    'cfssl',
    'clamav',                     # Antivirus
    'cmake',                      # Compiler
    'ctags',                      # Tagging for Vim
    'curl',                       # Updated
    'diff-so-fancy',
    'docker-clean',
    'duplicity',
    'fzf',
    'ghostscript',                # PDF support for imagemagick
    'git',                        # Version control
    'git-crypt',
    'git-flow',                   #
    'gnupg',                      # For securing messages
    'go',
    'gpg-agent',
    'graphviz',
    'heroku',
    'htop-osx',                   # Activity monitor
    'httpie',
    'hub',
    'hugo',
    'imagemagick',                # Image manipulation
    'jpeg',
    'jq',                         # Parse json in bash
    'keybase',
    'mobile-shell',               # SSH like client for low quality connections aka mosh
    'mtr',                        # Debugging network connections
    'node',                       # Node.js
    'nvm',                        # Node Version Manager
    'openssl',                    # Patched OpenSSL for latest security releases
    'pgcli',
    'pick',                       # Search multiline strings fuzzily
    'postgrsql',                  # Database for local servers
    'python',                     # Recent python
    'qt5',                        # used in headless browser testing
    'rbenv',                      # A ruby version manager
    'reattach-to-user-namespace', # Allows Tmux to interact with the system pasteboard via pbcopy etc
    'redis',
    'ruby-build',                 # Build ruby versions for rbenv
    'siege',                      # Load testing
    'speedtest_cli',
    'ssh-copy-id',                # Copies ssh keys and puts in authorized on remote host
    'sshfs',                      # Mount a filesystem over ssh using osxfuse
    'terminal-notifier',          # Send notifications to notification center
    'terraform',
    'the_silver_searcher',        # Fast file searching
    'thefuck',                    # Automagic command correction
    'tig',                        # Beautiful git visualization
    'tmate',                      # Easy remote pair sessions
    'tmux',                       # Terminal multiplexer, great for pairing
    'tmux-cssh',                  # SSH into multiple computers
    'tree',                       # Display filesystem as tree in terminal
    'unrar',                      # Unrar, that's all
    'vim',                        # Best text editor ever
    'wget',                       # Curl alternative, some things use it
    'zlib',                       # Compression, useful for siege
    'zsh',                        # Like bash, but way better
    'zsh-completions',            # Various zsh completions
    'zsh-syntax-highlighting'     # syntax highlighting as you type
  ].freeze
  # rubocop:enable Metrics/LineLength

  def self.call
    recipes.each do |r|
      if installed_recipes.include?(r)
        puts "    skipping #{r}"
      else
        puts "    installing #{r}"
        system("brew install #{r}")
      end
    end
  end
end
