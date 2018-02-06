# Prerequisities

| name | url | description |
|:-----|-----|--------|
|anyenv | https://github.com/riywo/anyenv | local environment customization |
|direnv | https://github.com/direnv/direnv | directory specific environment variable configuration |
|neovim | https://neovim.io/ | right weight vi editor|
|python3| https://www.python.org/ | python! |

## Installation with Brew (Linux Brew)

### Brew installation
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

- haskell related plugin libraries
  ```
  $ pip3 install neovim
  ```

## Haskell
- [Haskell IDE Engine](https://github.com/haskell/haskell-ide-engine)

- [Stack](https://docs.haskellstack.org/en/stable/README/)
  ```
  curl -sSL https://get.haskellstack.org/ | sh
  ```
