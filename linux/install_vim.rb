# .
class InstallVim
  extend Bootstrapper
  extend LinuxUtilities
  PLATFORMS = [:linux].freeze
  MESSAGE = 'Installing VIM'.freeze

  def call
    `sudo add-apt-repository ppa:jonathonf/vim`
    LinuxUtilities.install_apt_packages(['vim'])
  end
end
