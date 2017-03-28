# .
class LinuxShellExtensions
  extend Bootstrapper
  include LinuxUtilities
  MESSAGE = 'Installing shell extensions...'.freeze
  DEPENDENCIES = %w(linux_install_vim).freeze

  DIFF_SO_FANCY = <<-EOS.freeze
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
    sudo apt-get install nodejs
    sudo npm install -g diff-so-fancy
  EOS

  FZF = <<-EOS.freeze
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --key-bindings --completion --no-update-rc
  EOS

  THEFUCK = 'sudo pip install psutil thefuck'.freeze

  AUTOENV = <<-EOS.freeze
    sudo pip install autoenv
    echo "source `which activate.sh`" >> ~/.local_config
  EOS

  def call
    install_apt_packages(
      %w(ack-grep pick jq git-crypt tmate mosh gnupg-agent)
    )
    system(DIFF_SO_FANCY)
    system(FZF)
    system(THEFUCK)
    system(AUTOENV)
  end
end
