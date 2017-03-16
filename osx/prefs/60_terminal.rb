  # .
  class PreferencesTerminal
    extend Osx
    include Osx
    MESSAGE = 'Setting dock and dash prefs'.freeze
    DEPENDENCIES = %w(brew_gui).freeze

    def call
      # Don't display the annoying prompt when quitting iTerm
      `defaults write com.googlecode.iterm2 PromptOnQuit -bool false`
    end
  end
