## Dependencies
- vim
- oh-my-zsh
	- `sudo apt-get install zsh`
	- `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- tmux
	- `sudo apt-get install tmux`
- dircolors-solarized (if on Windows/WSL)
	- `git clone https://github.com/seebi/dircolors-solarized.git ~/.dircolors/`
- linuxbrew (if on linux)
	- `sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"`
	- `eval $(~/.linuxbrew/bin/brew shellenv)`
- homebrew (if on mac)
- fzf
	- `brew install fzf`
	- `$(brew --prefix)/opt/fzf/install`
- zsh-syntax-highlighting
	- `sudo apt-get install zsh-syntax-highlighting`
- powerline-fonts

## To use these configs
- clone and enter repo
	- `git clone https://github.com/Ricimon/shell-config.git`
	- `cd shell-config`
- run setup
	- `source ./setup`
- cleanup (optional)
	- `cd ..`
	- `rm -rf shell-config`
