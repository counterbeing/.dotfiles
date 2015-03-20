puts "installing fonts..."

recipes = [
  'font-meslo-lg-for-powerline',  # Used in terminal
  'font-m-plus', 
  'font-clear-sans',
  'font-roboto'
]

recipes.each do |r|
  unless INSTALLED_CASK_RECIPES.include?(r) 
    puts "    installing #{r}"
    `brew cask install #{r}`
  else
    puts "    skipping #{r}"
  end
end

