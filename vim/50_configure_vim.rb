#! /usr/bin/env ruby

puts "Cloning the vim config into ~/.vim"

vim_folder = "#{HOME}/.vim"
git_config = vim_folder + "/.git/config"

def run_clone
  `git clone --recursive https://github.com/counterbeing/Vim-Configuration #{HOME}/.vim`
end

if File.exist?(git_config) && File.read(git_config).scan(/counterbeing\/Vim-Configuration/)
  Dir.chdir(vim_folder) do
    `git pull`
  end
elsif Dir.exist?(vim_folder)
  backup(vim_folder)
  run_clone
else
  run_clone
end

make_link_where_appropriate("#{vim_folder}/.vimrc", "#{HOME}/.vimrc")

