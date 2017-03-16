# .
class InstallVim
  extend Bootstrapper
  extend LinuxUtilities
  PLATFORMS = [:linux].freeze
  MESSAGE = 'Installing VIM'.freeze

  def call
    puts 'adding apt repo'
    `sudo add-apt-repository ppa:jonathonf/vim`
    install_apt_packages(['vim'])
  end
end
