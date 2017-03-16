# .
module LinuxUtilities
  def install_apt_packages(packages)
    package_string = packages.join(' ')
    `sudo apt-get update`
    `sudo apt-get install -y #{package_string}`
  end
end
