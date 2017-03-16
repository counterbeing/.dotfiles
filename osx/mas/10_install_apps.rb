# Install packages using Mas
class MasInstallApps
  extend Osx
  include Osx
  DEPENDENCIES = %w(brew_cli).freeze
  MESSAGE = 'Installing app store apps...'.freeze
  MAS_LIST = <<-EOS.freeze
497799835 Xcode (8.2.1)
413969927 AudioBookBinder (2.1)
408981434 iMovie (10.1.4)
409183694 Keynote (7.0.5)
907364780 Tomato One (1.0.6)
443987910 1Password (6.5.3)
510139938 Uberlayer (1.4.1)
470453599 Textify Me (1.61)
1174330003 Fine Chromatic Tuner (1.0)
507257563 Sip (4.4.2)
409201541 Pages (6.0.5)
409203825 Numbers (4.0.5)
1030442215 Momentum (3.4)
915542151 Monity (1.4.1)
EOS

  def call
    args = MAS_LIST
           .split("\n")
           .map { |line| line[/\d+/] }
           .join(' ')

    system("mas install #{args}")
  end
end
