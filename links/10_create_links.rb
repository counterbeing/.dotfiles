#! /usr/bin/env ruby

folder = File.expand_path File.dirname(__FILE__)
files = Dir.glob(folder + "/*.link")

files.each do |file|
  filename = /\/([^\/]+).link$/.match(file)[1]
  destination = HOME + "/." + filename
  make_link_where_appropriate(file, destination)
end
