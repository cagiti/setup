# Setup

![CI](https://github.com/cagiti/setup/workflows/CI/badge.svg?branch=main&event=push)

## Geting Started

If you have an existing setup where you've installed some packages manually, it's recommend you execute the following in order to detect issues you may encounter during `setup`:

```sh
❯ make detect-issues
```

**Example output:**

```sh
❯ make detect-issues
VirtualBox has been installed manually and therefore might cause brew to fail.
We recommend removing 'VirtualBox' before continuing with setup, thank you!
```

### Prerequisites

Install the following via the `Self Service` app:
- [iterm2](selfservice://open) - [Documentation](https://iterm2.com/documentation.html)
- [Homebrew](selfservice://open) - [Documentation](https://docs.brew.sh/Installation)

Also, please checkout the [Getting Started](#getting-started) section if you've previously configured your system manually!

### Default Setup

**NOTE: The `make setup` command _should_ be safe to execute multiple times.**

The easiest way to get started is to execute the following target, however that does install the following shell customisation modules:
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) - see [oh-my-zsh configuration](#oh-my-zsh) for more info.
- [powerlevel10k](https://github.com/romkatv/powerlevel10k) - see [powerlevel10k configuration](#powerlevel10k) for more info.

```sh
# Ensure you're in <some-path-on-your-laptop>/cagiti/setup directory
❯ make setup
```

The intention of the `setup` target is to be idempotent.

### Basic Setup

If you're not interested in messing about with any of your dotfiles and shell configuration, and only install the brew formulas and python dependencies then use the following makefile target:

```sh
# Ensure you're in <some-path-on-your-laptop>/cagiti/setup directory
❯ make configure
```

### Shell Customisation Setup

The customisation of the shell and the prompt are performed using [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) & [powerlevel10k](https://github.com/romkatv/powerlevel10k) as mentioned above. This customisation is applied by default when selecting the `setup` makefile target. However, if you wish to apply this configuration separately then you can call the following makefile target:

```sh
# Ensure you're in <some-path-on-your-laptop>/cagiti/setup directory
❯ make configure-shell
```

#### oh-my-zsh

In this setup we're using `oh-my-zsh` as a default way of managing our `zsh` configuration, there are some really useful plugins... see [here]() for a more comprehensive list. Within the `.zshrc` it specifically installs a number of plugins and sources `oh-my-zsh` so that it's available within your shell. If you wish to enable further plugins then either submit a PR, or manage this separately yourself.

#### powerlevel10k

For the terminal customisation we're using `powerlevel10k` as a theme for `zsh`, which nicely hooks into `oh-my-zsh`. Once installed you'd probably need to restart your terminal (_hopefully iterm2_) and you should automatically enter into the [p10k configuration wizard](https://github.com/romkatv/powerlevel10k#configuration-wizard), if not then execute:

```sh
❯ p10k configure
```

You can setup the terminal to how you like using the menu system, this configuration is stored in `~/.p10k.zsh` and not committed back to git.

#### tmux

Another configuration item which is integral to the shell customisation is the use of [tmux](https://github.com/tmux/tmux/wiki), which is a terminal multiplexer and enables you to separate work within the same window into multiple panes. The standard tmux window hotkeys can be a pain, so the default tmux dotfiles have been updated to provide an easier mechanism on navigating around your terminal with hotkeys. There are many commands for tmux that enable you to toggle various behaviours, but I've only included the relevant commands to begin with:

`Ctrl-a` : This is the key combination to active the terminal to listen for a `tmux` command. **Required** each time you wish to perform a `tmux` related action!

| Command | Action | Example |
|:-------:|:------:| ------- |
| `-` | Split Window Horizontally | `Ctrl + a` _then_ `-` |
| `\` | Split Window Vertically | `Ctrl + a` _then_ `\` |
| `c` | Create New Window | `Ctrl + a` _then_ `c` |
| `1` | Navigate to window 1 | `Ctrl + a` _then_ `1` - the number represents the window number on the lower toolbar |
| `m` | Toggles Mouse Mode | `Ctrl + a` _then_ `m` - when enabled allows you to select panes and scroll |
| `j` | Navigate to a lower pane | `Ctrl + a` _then_ `j` |
| `k` | Navigate to an upper pane | `Ctrl + a` _then_ `k` |
| `h` | Navigate to a left pane | `Ctrl + a` _then_ `h` |
| `l` | Navigate to a right pane | `Ctrl + a` _then_ `l` |
| `z` | Toggles full screen mode for a pane | `Ctrl + a` _then_ `z` |

#### vi mode

The dotfiles used in this setup also enable `vi mode` on the command line using `set -o vi`, if you wish to disable this try `set +o vi`. To see a full list of terminal modes use `set -o`.

#### Kubernetes Context

The kubernetes context is now visible within the right terminal status bar, to toggle this behaviour, use the `kube-toggle` function:

```sh
❯ kube-toggle
```

#### Customisation

We currently support two forms of customisation for the dotfiles provided:
- `~/.custom_aliases`: add or unset any aliases
- `~/.custom_exports`: add or unset any exports

## Install SpaceVim

The is a makefile target which installs and configures [SpaceVim](https://spacevim.org/). To install, execute the following:

```sh
❯ make spacevim
```

### Useful shortcuts for SpaceVim
- `fn` + `F3` - toggles filetree panel `nerdtree`
- `fn` + `F2` - toggles tagbar
- `Ctrl` + `j` - move to below split
- `Ctrl` + `k` - move to upper split
- `Ctrl` + `h` - move to left split
- `Ctrl` + `l` - move to right split

See [use vim as an IDE](https://spacevim.org/use-vim-as-ide/) for more information.

## Install golang

There is a makefile target which installs [golang](https://golang.org/), to install:

```sh
❯ make golang
---> downloading golang 1.15.5
---> setting golang 1.15.5 as default
---> please restart your terminal for the changes to take effect.
```
_These exports are set within the .path file which is part of the standard dotfiles. however grab them here if you them_
```
export GOROOT=$(realpath ~)/Development/golang/go
export GOPATH = $(realpath ~)/Development/go-workspace
```

## Setup Helm

It's useful to have a straightforward approach to use the latest version where possible. [asdf](https://asdf-vm.com/) can be used to manage multiple versions of our runtime software.

### Installing a version

To install a version you require:

1. Add the component plugin

```
❯ asdf plugin-add helm
```

2. Install a specific version

```
❯ asdf install helm 2.17.0
```

**OR**

Execute the following makefile target:

```
❯ make helm
```
`asdf` **is configured to install the latest version of helm v2 and v3.**

### List Versions

To list versions of helm installed:

```
❯ asdf list helm
  2.17.0
  3.4.2
  3.5.0
```

### Select a version to use

#### Global

`global` writes the version to `$HOME/.tool-versions`.

```
❯ asdf global helm 2.17.0
```

#### Local

`local` writes the version to `$PWD/.tool-versions`, creating it if needed.

```
❯ asdf local helm 2.17.0
```

For more information see [asdf set current version](https://asdf-vm.com/#/core-manage-versions?id=set-current-version).
