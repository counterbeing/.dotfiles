Feel free to take my dotfiles for a spin.

## Getting Started
We'll clone the repo locally into your home folder, in a folder called
.dotfiles, and also grab a couple of other repos by doing so recursively. Then
we simply run the bootstrap file.

```
cd ~
git clone --recursive https://github.com/counterbeing/.dotfiles
cd .dotfiles
ruby bootstrap.rb
```

## Don't Forget
There are a few things that these scripts will replace, or make significant
changes to. You just need to be aware of that and act accordingly

- Replaces your iTerm preferences
- Sets Zsh as your default shell (just try it, it's easy to change.)
- A few other things, just read the code.

There are a few odds and ends that are too custom or private for a github repo.
You might think about moving these.

- ~/.ssh
- ~/.gnupg
- ~/.gitconfig


## Documentations of Configuration

### Tmux
I've overwritten some of the tmux defaults to give a more native feel, and
easier to use key bindingings. The first thing to know is that the leader for
tmux is now mapped to `^ + a`. It's worth noting that this overrides it's
default behavior of jumping to the beginning of a line. To get to that behavior
there is an escape sequence `^ + a a`.

| command       | result                                                     |
|---------------|------------------------------------------------------------|
| `^ + a ?`     | Learn to help yourself by accessing the help menu for tmux |
| `^ + a c`     | Create a new tmux window                                   |
| `^ + a %`     | Create a vertical split pane within a window               |
| `^ + a "`     | Create a horizontal split pane within a window             |
| `^ + a h`     | Move to a pane to the left.                                |
| `^ + a j`     | Move a  pane down.                                         |
| `^ + a k`     | Move up a pane.                                            |
| `^ + a l`     | Move right a pane                                          |
| `^ + a ^ + a` | Quickly toggle between most recently used windows          |

### Vim
Refer here for info on vim configuration https://github.com/counterbeing/Vim-Configuration


### Warranty

There is none. If you have custom configurations on our system, you need to
look at all of the code to be sure this doesn't do something you don't like.


### Todo
- Remove 1p mini from menu bar
- enable 1p in alfred
- disable autosubmit in 1p
- Set sync folder
- Add casks dir to alfred search
- Don't make google chrome ask to save passwords... unless HTTP Basic auth
- Look into rbenv plugin to avoid rehash
- Think about installing default gems
- Generate `.local_config` file if it does not exist

### Done
Mar 25, 2015
- Cask installers need to look for the `.app` extension for a match
- Set owner on /usr/local
- Setting global for brew installation should happen after brew installs
