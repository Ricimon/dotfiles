**Place computer-specific shell initialization logic in `~/.config.bash`**

## Dependencies
- vim
	- use `vim-gtk` for Windows copy-paste support on WSL
- [vim-plug](https://github.com/junegunn/vim-plug)
	- auto-installed in `.vimrc`
	- manual install/update: `:PlugInstall`/`:PlugUpdate`
- [powerline-fonts](https://github.com/powerline/fonts)
	- Requires custom installation in iTerm2 (macOS) and all Windows terminals

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
		- [tmuxinator](https://github.com/tmuxinator/tmuxinator)
			- `brew install tmuxinator`
		- [fasd](https://github.com/clvv/fasd)
			- `brew install fasd`
		- [fzf-z](https://github.com/andrewferrier/fzf-z)
		- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [linuxbrew](https://linuxbrew.sh) (linux)
	- `sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"`
	- `eval $(~/.linuxbrew/bin/brew shellenv)`
- [homebrew](https://brew.sh) (macOS)
	- `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
- [pyenv](https://github.com/pyenv/pyenv) + [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)
	- `brew install pyenv`
	- `brew install pyenv-virtualenv`
- [rvm](https://github.com/rvm/rvm)
	- `\curl -sSL https://get.rvm.io | bash -s stable`
- [neovim](https://github.com/neovim/neovim)
	- `brew install neovim`
	- plugins with additional install steps:
		- [deoplete](https://github.com/Shougo/deoplete.nvim)
			- `pyenv virtualenv 3.x py3nvim` (replace x with desired python version, eg. `3.8.2`)
			- `pyenv activate py3nvim`
			- `pip install pynvim`
- [dircolors-solarized](https://github.com/seebi/dircolors-solarized)
	- `git clone https://github.com/seebi/dircolors-solarized.git ~/.dircolors/dircolors-solarized`
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
