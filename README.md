**Place computer-specific shell initialization logic in `~/.config.bash`**

## Supported packages
- zsh
	- `sudo apt-get install zsh`
	- `chsh -s $(which zsh)` (optional, sets default shell to zsh)
- [zgen](https://github.com/tarjoilija/zgen) *(required for zsh)*
	- `git clone https://github.com/tarjoilija/zgen.git ~/.zgen` (done by `install` script)
	- plugins:
		- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
		- [tmux](https://github.com/tmux/tmux)
			- `sudo apt-get install tmux`
        - [tpm](https://github.com/tmux-plugins/tpm)
            - `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm` (auto-installed on tmux start)
		- [tmuxinator](https://github.com/tmuxinator/tmuxinator)
			- `brew install tmuxinator`
		- [fasd](https://github.com/clvv/fasd)
			- `brew install fasd`
		- [fzf-z](https://github.com/andrewferrier/fzf-z)
		- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
    - [nerd fonts](https://www.nerdfonts.com/font-downloads)
- [linuxbrew](https://linuxbrew.sh) (linux)
	- `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
	- `eval $(~/.linuxbrew/bin/brew shellenv)`
- [homebrew](https://brew.sh) (macOS)
	- `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
- vim
	- use `vim-gtk` for Windows copy-paste support on WSL
- [neovim](https://github.com/neovim/neovim)
	- `brew install neovim` ([macOS](https://github.com/neovim/neovim/wiki/Installing-Neovim#macos--os-x))
    - `sudo apt install neovim` ([Debian](https://github.com/neovim/neovim/wiki/Installing-Neovim#debian))
    - [vim-plug](https://github.com/junegunn/vim-plug)
        - auto-installed in `.nvimrc`, manal install/update: `:PlugInstall`/`:PlugUpdate`
    - [coc.nvim](https://github.com/neoclide/coc.nvim) requires [node.js](https://nodejs.org/en/download/package-manager/)
- [pyenv](https://github.com/pyenv/pyenv) + [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)
	- `brew install pyenv pyenv-virtualenv`
- [rvm](https://github.com/rvm/rvm)
	- `\curl -sSL https://get.rvm.io | bash -s stable`
- [dircolors-solarized](https://github.com/seebi/dircolors-solarized)
	- `git clone https://github.com/seebi/dircolors-solarized.git ~/.dircolors/dircolors-solarized` (done by `install` script)
- [fzf](https://github.com/junegunn/fzf)
	- `brew install fzf`
	- `$(brew --prefix)/opt/fzf/install`

## Installation
These dotfiles are installed using [Dotbot](https://github.com/anishathalye/dotbot)
```bash
git clone https://github.com/Ricimon/dotfiles.git
cd dotfiles
./install
```

## Extra
`zsh` is the shell of choice, however note that `zsh` does not source `~/.profile` but instead sources `~/.zprofile`. A quick workaround is to run `ln -s ~/.profile ~/.zprofile` (mileage may vary)
