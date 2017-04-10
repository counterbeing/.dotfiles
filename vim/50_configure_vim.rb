# .
class ConfigureVim
  extend Bootstrapper
  DEPENDENCIES = %w(brew_cli linux_install_vim).freeze
  MESSAGE = 'Cloning the vim config into ~/.vim'.freeze
  REPOSITORY = 'https://github.com/counterbeing/Vim-Configuration'.freeze
  VIM_FOLDER = "#{Utils::HOME}/.vim".freeze
  GIT_CONFIG = VIM_FOLDER + '/.git/config'

  def call
    update_repo && return if corys_vim_config?
    Utils.backup(VIM_FOLDER) if Dir.exist?(VIM_FOLDER)
    run_clone
    make_link
    install_plugins
  end

  private

  def install_plugins
    puts 'Installing vim plugins'
    system('vim +PlugInstall +qall')
  end

  def update_repo
    Dir.chdir(VIM_FOLDER) do
      `git pull`
    end
  end

  def make_link
    Utils.make_link_where_appropriate(
      "#{VIM_FOLDER}/.vimrc",
      "#{Utils::HOME}/.vimrc"
    )
  end

  def run_clone
    `git clone --recursive #{REPOSITORY} #{Utils::HOME}/.vim`
  end

  def corys_vim_config?
    state = File.exist?(GIT_CONFIG) &&
            File.read(GIT_CONFIG)[%r{counterbeing\/Vim-Configuration}]
    make_link
    state
  end
end
