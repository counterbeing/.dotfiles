# .
module Osx
  include Bootstrapper
  PLATFORMS = [:macos].freeze

  def installed_cask_recipes
    @icr ||= `brew cask list`.freeze
  end

  def installed_recipes
    @ir ||= `brew list`.freeze
  end

  def installed_taps
    @it ||= `brew tap`.freeze
  end

  def installed_applications
    @ia ||= Dir
            .entries('/Applications')
            .join('')
            .tr(' ', '-')
            .downcase
  end
end
