# Install packages using Mas
class MasInstallApps
  extend Osx
  include Osx
  DEPENDENCIES = %w(brew_cli).freeze
  MESSAGE = 'Installing app store apps...'.freeze
  MAS_LIST = <<-EOS.freeze
470453599 Textify Me (1.74)
1174330003 Fine Chromatic Tuner (1.0)
915542151 Monity (1.4.5)
409183694 Keynote (9.2)
510139938 Uberlayer (1.4.1)
1333542190 1Password 7 (7.3.2)
682658836 GarageBand (10.3.3)
937984704 Amphetamine (4.2)
1030442215 Momentum (3.4)
1323414118 WebP Viewer (1.0)
409203825 Numbers (6.2)
497799835 Xcode (11.1)
527270840 Stock + (3.8.2)
409201541 Pages (8.2)
1346203938 OmniFocus (3.4.2)
408981434 iMovie (10.1.13)
939343785 Icon Set Creator (1.1.11)
715768417 Microsoft Remote Desktop (8.0.30030)
413969927 AudioBookBinder (2.2)
907364780 Tomato One (1.0.6)
507257563 Sip (4.5.2)
EOS

  def call
    args = MAS_LIST
           .split("\n")
           .map { |line| line[/\d+/] }
           .join(' ')

    system("mas install #{args}")
  end
end
