# Dotfiles

Personal macOS development environment configuration.

## Getting Started

```sh
cd ~
git clone https://github.com/counterbeing/.dotfiles
cd .dotfiles
./install.sh
```

## What it does

1. Installs [Homebrew](https://brew.sh) if missing
2. Installs all CLI tools, GUI apps, fonts, and Mac App Store apps via `Brewfile`
3. Symlinks all `links/*.link` files to `~/` (e.g. `zshrc.link` → `~/.zshrc`)
4. Installs [Oh My Zsh](https://ohmyz.sh) if missing
5. Applies macOS system preferences (`macos/defaults.sh`)
6. Copies iTerm2 preferences
7. Sets up [Neovim](https://neovim.io) config (lazy.nvim + LSP + Treesitter)

## Structure

```
.dotfiles/
├── install.sh          # Main bootstrap script
├── Brewfile            # Homebrew dependencies
├── links/              # Dotfiles symlinked to ~/
├── nvim/               # Neovim config (symlinked to ~/.config/nvim)
├── macos/defaults.sh   # macOS system preferences
└── plists/             # Application preference plists
```

## Tmux

Leader is `Ctrl-a` (overrides default `Ctrl-b`). `Ctrl-a a` sends literal `Ctrl-a`.

| Command         | Result                          |
|-----------------|---------------------------------|
| `^a ?`          | Help menu                       |
| `^a c`          | New window                      |
| `^a %`          | Vertical split                  |
| `^a "`          | Horizontal split                |
| `^a h/j/k/l`   | Navigate panes                  |
| `^a ^a`         | Toggle last window              |

## Neovim

Leader is `,`. Key mappings:

| Mapping         | Action                          |
|-----------------|---------------------------------|
| `,n`            | Toggle file tree (Neo-tree)     |
| `,t`            | Find files (Telescope)          |
| `,fg`           | Live grep (Telescope)           |
| `,fb`           | Buffers (Telescope)             |
| `gd`            | Go to definition (LSP)          |
| `gr`            | Find references (LSP)           |
| `K`             | Hover docs (LSP)                |
| `,rn`           | Rename symbol (LSP)             |
| `,ca`           | Code actions (LSP)              |

## Warranty

None. Read the code before running.
