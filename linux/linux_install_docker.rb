class LinuxInstallDocker
  extend Bootstrapper
  include LinuxUtilities
  MESSAGE =  'Installing Docker...'.freeze

  def call
    command = <<-EOS
      sudo wget -qO- https://get.docker.com/ | sh
      sudo usermod -aG docker $(whoami)
      sudo apt-get -y install python-pip
      pip install --upgrade pip
      sudo pip install docker-compose
    EOS
    system(command)
  end
end
