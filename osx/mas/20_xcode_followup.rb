# .
class MasXcodeFollowup
  extend Osx
  MESSAGE = 'Accepting ToS from Xcode...'.freeze

  def call
    `sudo xcodebuild -license accept`

    Dir.chdir('/Applications/Xcode.app/Contents/Developer/usr/bin/') do
      `sudo ln -s xcodebuild xcrun`
    end
  end
end
