puts "#{Tty.blue}Installing fonts...#{Tty.reset}"

recipes = [
  'font-meslo-lg-for-powerline', # Used in terminal
  'font-m-plus',
  'font-clear-sans',
  'font-roboto'
]

recipes.each do |r|
  if INSTALLED_CASK_RECIPES.include?(r)
    puts "    skipping #{r}"
  else
    puts "    installing #{r}"
    `brew cask install #{r}`
  end
end
