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
            - plugins:
                - [tmux-network-bandwidth](https://github.com/xamut/tmux-network-bandwith) (additional dependencies listed here)
                - [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)
                - [tmux-onedark-theme](https://github.com/odedlaz/tmux-onedark-theme)
        - [tmuxinator](https://github.com/tmuxinator/tmuxinator)
            - `brew install tmuxinator`
        - [fasd](https://github.com/clvv/fasd)
            - `brew install fasd` ([macOS](https://github.com/clvv/fasd/wiki/Installing-via-Package-Managers#mac-os-x))
            - `sudo apt-get install fasd` ([Debian](https://github.com/clvv/fasd/wiki/Installing-via-Package-Managers#debian--ubuntu))
        - [fzf-z](https://github.com/andrewferrier/fzf-z)
        - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
    - [nerd fonts](https://www.nerdfonts.com/font-downloads)
- [homebrew](https://brew.sh) (macOS)
    - `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
- vim
    - use `vim-gtk` for Windows copy-paste support on WSL
- [neovim](https://github.com/neovim/neovim)
    - `brew install neovim` ([macOS](https://github.com/neovim/neovim/wiki/Installing-Neovim#macos--os-x))
    - [AppImage (Linux)](https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package)
    - [vim-plug](https://github.com/junegunn/vim-plug)
        - auto-installed in `.nvimrc`, manal install/update: `:PlugInstall`/`:PlugUpdate`
    - `sudo apt install xclip` for Windows copy-paste support on WSL
- [pyenv](https://github.com/pyenv/pyenv) + [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)
    - `brew install pyenv pyenv-virtualenv`
- [dircolors-solarized](https://github.com/seebi/dircolors-solarized)
    - `git clone https://github.com/seebi/dircolors-solarized.git ~/.dircolors/dircolors-solarized` (done by `install` script)
- [fzf](https://github.com/junegunn/fzf)
    - `brew install fzf` ([macOS](https://github.com/junegunn/fzf#using-homebrew))
        - `$(brew --prefix)/opt/fzf/install`
    - `sudo apt install fzf` ([Debian](https://github.com/junegunn/fzf#using-linux-package-managers))

## Installation
These dotfiles are installed using [Dotbot](https://github.com/anishathalye/dotbot)
```bash
git clone https://github.com/Ricimon/dotfiles.git
cd dotfiles
./install
```

## Extra
`zsh` is the shell of choice, however note that `zsh` does not source `~/.profile` but instead sources `~/.zprofile`. A quick workaround is to run `ln -s ~/.profile ~/.zprofile` (mileage may vary)
