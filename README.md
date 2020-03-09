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
			- requires ruby >= 2.4.0, use `rvm` to install if needed
			- `gem install tmuxinator`
		- [fasd](https://github.com/clvv/fasd)
			- `brew install fasd`
		- [fzf-z](https://github.com/andrewferrier/fzf-z)
		- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [pyenv](https://github.com/pyenv/pyenv)
	- (macOS) `brew install pyenv`
	- (linux) `git clone https://github.com/pyenv/pyenv.git ~/.pyenv`
- [rvm](https://github.com/rvm/rvm)
	- `\curl -sSL https://get.rvm.io | bash -s stable`
- [dircolors-solarized](https://github.com/seebi/dircolors-solarized)
	- `git clone https://github.com/seebi/dircolors-solarized.git ~/.dircolors/dircolors-solarized`
- [linuxbrew](https://linuxbrew.sh) (linux)
	- `sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"`
	- `eval $(~/.linuxbrew/bin/brew shellenv)`
- [homebrew](https://brew.sh) (macOS)
	- `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
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
