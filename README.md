# Welcome to .dotfiles

Feel free to take my dotfiles for a spin.

## Getting Started
We'll clone the repo locally into your home folder, in a folder called .dotfiles, and also grab a couple of other repos by doing so recursively. Then we simply run the bootstrap file.

```
cd ~
git clone --recursive https://github.com/counterbeing/.dotfiles
cd .dotfiles
ruby bootstrap.rb
```

## Don't Forget

There are a few odds and ends that are too custom or private for a github repo. You might think about moving these.

- ~/.ssh
- ~/.gnupg
- ~/.gitconfig

### Warranty

There is none. If you have custom configurations on our system, you need to look at all of the code to be sure this doesn't do something you don't like.
