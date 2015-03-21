#! /usr/bin/env ruby

puts "Cloning the vim config into ~/.vim"
`git clone --recursive https://github.com/counterbeing/Vim-Configuration #{HOME}/.vim`
make_link_where_appropriate("#{HOME}/.vim/.vimrc", "#{HOME}/.vimrc")

puts "Installing vim bundles with Vundle, this will take a moment"
Dir.chdir("#{HOME}/.vim") do
  %x[vim +PluginInstall +qall]
end
