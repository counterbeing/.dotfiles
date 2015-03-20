#!/usr/bin/env ruby
require 'fileutils'

`git clone --recursive https://github.com/counterbeing/prezto #{HOME}/.zprezto`
runcom_folder = HOME + "/.zprezto/runcoms"
Dir.glob("#{runcom_folder}/z*").each do |source_file|
  link_name = /\/(\w+$)/.match(source_file)[1]
  link_name = HOME + "/." + link_name
  # If the config file already exists we back it up
  if File.exist?(link_name)
    File.mv(link_name, "#{link_name}_backup")
  end
  FileUtils.symlink(source_file, link_name)
end

