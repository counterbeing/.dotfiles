# .
class InstallVim
  extend Bootstrapper
  include LinuxUtilities
  PLATFORMS = [:linux].freeze
  MESSAGE = 'Installing VIM'.freeze

  def call
    puts 'adding apt repo'
    system('sudo add-apt-repository ppa:jonathonf/vim')
    install_apt_packages(['vim'])
  end
end
