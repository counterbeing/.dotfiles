# .
class LinuxRbenvInstall
  extend Bootstrapper
  include LinuxUtilities
  MESSAGE = 'Installing Rbenv...'.freeze

  def call
    command = <<-EOS
      git clone https://github.com/rbenv/rbenv.git ~/.rbenv
      cd ~/.rbenv && src/configure && make -C src
      echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.local_config
      git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    EOS
    system(command)
  end
end
