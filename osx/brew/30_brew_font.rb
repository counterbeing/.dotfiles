# Install fonts using Brew
class BrewFont
  extend Osx
  MESSAGE = 'Installing fonts...'.freeze
  RECIPES = [
    'font-meslo-lg-for-powerline', # Used in terminal
    'font-m-plus',
    'font-clear-sans',
    'font-roboto'
  ].freeze

  def call
    RECIPES.each do |r|
      if installed_cask_recipes.include?(r)
        puts "    skipping #{r}"
      else
        puts "    installing #{r}"
        `brew cask install #{r}`
      end
    end
  end
end
