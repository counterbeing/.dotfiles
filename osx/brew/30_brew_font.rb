# Install fonts using Brew
class BrewFont
  include Osx
  extend Osx
  DEPENDENCIES = %w(brew_installer).freeze
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
        `brew install --cask #{r}`
      end
    end
  end
end
