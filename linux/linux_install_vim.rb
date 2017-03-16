# .
class LinuxInstallVim
  extend Bootstrapper
  include LinuxUtilities
  PLATFORMS = [:linux].freeze
  MESSAGE = 'Installing VIM'.freeze



  def call
    install_apt_packages(
      %w(build-essential python-dev python3-dev cmake vim-gtk)
    )
  end

end







