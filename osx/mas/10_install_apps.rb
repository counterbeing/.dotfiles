# Install packages using Mas
class MasInstallApps
  extend Osx
  include Osx
  DEPENDENCIES = %w(brew_cli).freeze
  MESSAGE = 'Installing app store apps...'.freeze
  MAS_LIST = <<-EOS.freeze
1494210770  Tomato 2                  (2.2.4)
904280696   Things                    (3.14.4)
915542151   Monity                    (1.4.5)
405399194   Kindle                    (1.33.0)
409183694   Keynote                   (11.2)
1475897096  Jira                      (141.1.0)
1333542190  1Password 7               (7.9)
682658836   GarageBand                (10.4.4)
937984704   Amphetamine               (5.2.2)
1323414118  WebP Viewer               (1.0)
409203825   Numbers                   (11.2)
497799835   Xcode                     (13.0)
409201541   Pages                     (11.2)
1450716465  ImageOptim                (1.4.1)
939343785   Icon Set Creator          (1.1.13)
408981434   iMovie                    (10.3)
413969927   AudioBookBinder           (2.3)
507257563   Sip                       (4.5.2)
EOS

  def call
    args = MAS_LIST
           .split("\n")
           .map { |line| line[/\d+/] }
           .join(' ')

    system("mas install #{args}")
  end
end
