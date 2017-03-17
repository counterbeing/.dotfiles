# .
class ConfigureGit
  extend Bootstrapper
  DEPENDENCIES = %w(brew_cli).freeze
  MESSAGE = 'Configuring git...'.freeze

  def call
    `git config --global core.excludesfile ~/.gitignore`
    `git config push.default matching`
    `git config --global user.name "Cory Logan"`
    `git config --global user.email he@corylogan.com`
    `git config --global push.default current`
    `git config --global pull.rebase true`
    `git config --global alias.dif '!f() { [ -z "$GIT_PREFIX" ] || cd "$GIT_PREFIX" && git diff --color "$@" | diff-so-fancy  | less --tabs=4 -RFX; }; f'`
    `git config --global alias.amend 'commit -a --amend --no-edit'`
    `git config --global alias.unstage 'reset HEAD --'`
    `git config --global alias.rcm 'commit -c HEAD --reset-author'`
    `git config --global alias.rbm '!git fetch origin master && git rebase origin/master'`
    `git config --global alias.set-origin 'remote set-url origin'`
  end
end
