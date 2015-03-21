#! /usr/bin/env ruby

puts "Linking preference files..."

prefs_destination = HOME + "/Library/Preferences"
prefs_source = (File.expand_path File.dirname(__FILE__)) + "/plists"
files = Dir.glob(prefs_source + "/*.plist")

files.each do |file|
  filename = /\/([^\/]+.plist)$/.match(file)[1]
  destination = prefs_destination + "/" + filename
  make_link_where_appropriate(file, destination)
end
