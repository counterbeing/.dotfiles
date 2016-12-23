
`sudo xcodebuild -license accept`

Dir.chdir("/Applications/Xcode.app/Contents/Developer/usr/bin/") do
  `sudo ln -s xcodebuild xcrun`
end
