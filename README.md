# Prerequisities

| name | url | description |
|:-----|-----|--------|
|anyenv | https://github.com/riywo/anyenv | local environment customization |
|direnv | https://github.com/direnv/direnv | directory specific environment variable configuration |
|neovim | https://neovim.io/ | light weight vi editor|
|python3| https://www.python.org/ | python! |
|nixpkgs| https://nixos.org/nix/ | Nix package manager |
|starship| https://starship.rs/ | shell prompt |
|zsh| |zsh|

## Installation with Brew (Linux Brew)

### Brew installation
On using nixpkgs, brew may not necessary in most cases.
- Mac [Homebew](https://docs.brew.sh/Installation.html)
  ```
  $ mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
  ```

- [LinuxBrew](http://linuxbrew.sh/)
  ```
  $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
  ```
  After complete above command, set LinuxBrew path to `.profile` for use in bash or zsh.
  ```
  test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
  test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
  test -r ~/.bash_profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.bash_profile
  echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile
  ```

### Install required software
- anyenv
  ```
  $ git clone https://github.com/riywo/anyenv ~/.anyenv
  $ echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.your_profile
  $ echo 'eval "$(anyenv init -)"' >> ~/.your_profile
  $ exec $SHELL -l
  ```

- direnv, neovim
  ```
  $ brew install direnv neovim
  ```
  or
  ```
  $ nix-env -i direnv neovim
  ```

- to use various plug-ins in neovim we need following python library.
  ```
  $ pip3 install neovim
  ```

- [vim-plug](https://github.com/junegunn/vim-plug)
  ```
  $ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ```

- [starship](https://starship.rs/)
  ```
  $ curl -fsSL https://starship.rs/install.sh | bash
  ```
  or
  ```
  $ nix-env -i starship
  ```

- zsh, [zplug](https://github.com/zplug/zplug)
  zsh is default shell on latest MacOS. You may not need to install zsh in brew.
  ```
  $ brew install zplug
  ```
- zsh-completions
  ```
  - nix-env -i zsh-completions
  ```
## Go
- install by nix
```
$ nix-env -i go
```
- install using goenv
```
goenv install ${go version}
```

## Haskell
- [Haskell IDE Engine](https://github.com/haskell/haskell-ide-engine)

- [Stack](https://docs.haskellstack.org/en/stable/README/)
  ```
  curl -sSL https://get.haskellstack.org/ | sh
  ```
# Other useful packages

| name | url | description |
|:-----|-----|--------|
| xsv | https://github.com/BurntSushi/xsv | CSV parser |
| ranger | https://github.com/ranger/ranger | file manager with terminal UI |
| lazydocker | https://github.com/jesseduffield/lazydocker | docker utility in terminal |

# Install zsh functions if required
Put custom zsh functions under `$HOME/.config/zsh/funcs` .
- GCP
  - gconf
    gcloud configuration selector. you can change GCP project configuration with fzf.
  - gssh
    GCP vm ssh using fzf.
- AWS
  - ainst: show instance information
  - avpc: show vpc information
  - asubnet: show subnet information
