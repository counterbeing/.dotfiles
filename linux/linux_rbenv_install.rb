# .
class LinuxRbenvInstall
  extend Bootstrapper
  include LinuxUtilities
  MESSAGE = 'Installing Rbenv...'.freeze

  def call
    command = <<-EOS
      git clone https://github.com/rbenv/rbenv.git ~/.rbenv
      cd ~/.rbenv && src/configure && make -C src
    EOS
    system(command)
  end
end
