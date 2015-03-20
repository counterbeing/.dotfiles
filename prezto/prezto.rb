#!/usr/bin/env ruby

require 'fileutils'
require 'pry'

home = File.expand_path('~')
# Dir.chdir(home)
`git clone --recursive https://github.com/counterbeing/prezto #{home}/.zprezto`
runcom_folder = home + "/.zprezto/runcoms"
Dir.glob("#{runcom_folder}/z*").each do |source_file|
  link_name = /\/(\w+$)/.match(source_file)[1]
  link_name = home + "/." + link_name
  FileUtils.symlink(source_file, link_name)
end

