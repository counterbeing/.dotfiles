#! /usr/bin/env ruby

puts "Cloning the vim config into ~/.vim"
`git clone https://github.com/counterbeing/Vim-Configuration #{HOME}/.vim`
make_link_where_appropriate("#{HOME}.vim/.vimrc", "#{HOME}/.vimrc")

puts "Installing vim bundles with Vundle"
Dir.chdir("#{HOME}/.vim") do
  `vim +PluginInstall +qall`
end
