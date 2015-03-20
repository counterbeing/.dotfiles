#! /usr/bin/env ruby

folder = File.expand_path File.dirname(__FILE__)
files = Dir.glob(folder + "/*.link")

files.each do |file|
  filename = /\/([^\/]+).link$/.match(file)[1]
  destination = HOME + "/." + filename
  unless symlink_already_matchs(file, destination)
    backup(destination)
    FileUtils.symlink(file, destination, verbose: true)
  end
end

