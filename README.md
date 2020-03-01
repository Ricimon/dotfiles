**Place computer-specific shell initialization logic in `~/.config.bash`**

## Dependencies
- vim
	- use `vim-gtk` for Windows copy-paste support
- Vundle
	- auto-installed in `.vimrc`
- vim-plug
	- auto-installed in `.vimrc`
- powerline-fonts
	- https://github.com/powerline/fonts
	- Requires custom installation in iTerm2 (macOS) and all Windows terminals

## Supported packages
- oh-my-zsh
	- `sudo apt-get install zsh`
	- `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- tmux
	- `sudo apt-get install tmux`
- pyenv
	- (macOS) `brew install pyenv`
	- (linux) `git clone https://github.com/pyenv/pyenv.git ~/.pyenv`
- dircolors-solarized
	- `git clone https://github.com/seebi/dircolors-solarized.git ~/.dircolors/dircolors-solarized`
- linuxbrew (linux)
	- `sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"`
	- `eval $(~/.linuxbrew/bin/brew shellenv)`
- homebrew (macOS)
- fzf
	- `brew install fzf`
	- `$(brew --prefix)/opt/fzf/install`
- zsh-syntax-highlighting
	- `sudo apt-get install zsh-syntax-highlighting`

## To use these configs
- clone and enter repo
	- `git clone https://github.com/Ricimon/shell-config.git`
	- `cd shell-config`
- run setup
	- `source ./setup`
- cleanup (optional)
	- `cd ..`
	- `rm -rf shell-config`
