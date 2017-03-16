  # .
  class PreferencesTerminal
    extend Osx
    MESSAGE = 'Setting dock and dash prefs'.freeze

    def call
      # Don't display the annoying prompt when quitting iTerm
      `defaults write com.googlecode.iterm2 PromptOnQuit -bool false`
    end
  end
