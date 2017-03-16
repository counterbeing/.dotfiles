# .
module LinuxUtilities
  def install_apt_packages(packages)
    package_string = packages.join(' ')
    puts 'updating apt'
    `sudo apt-get update`
    puts 'installing packages'
    `sudo apt-get install -y #{package_string}`
  end
end
