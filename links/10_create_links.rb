#! /usr/bin/env ruby
require 'fileutils'

folder = File.expand_path File.dirname(__FILE__)
files = Dir.glob(folder + "/*.link")

files.each do |file|
  filename = /\/([^\/]+).link$/.match(file)[1]
  destination = HOME + "/." + filename
  # If the config file already exists we back it up
  backup(destination)
  FileUtils.symlink(file, destination, verbose: true)
end

