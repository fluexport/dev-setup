## Editor/ Terminal
Personal editor/terminal setup. Mostly zsh theme tools. For `.zshrc` see [configs](configs/.zshrc).

1. [Atom](https://atom.io/)

  ```bash
  $ brew cask install atom
  ```

2. [iTerm2](https://www.iterm2.com/)

  ```bash
  $ brew cask install iterm2
  ```

  - [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)

    ```bash
    $ brew install zsh
    ```

  - [Powerlevel9k](https://github.com/bhilburn/powerlevel9k)

    ```bash
    $ brew tap sambadevi/powerlevel9kf
    $ brew install powerlevel9k
    $ echo "source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme" >> ~/.zshrc
    ```

  - [color schemes](https://iterm2colorschemes.com/)

    The above link is for color schemes. For this setup I used [iTerm2 Material Design](https://github.com/MartinSeeler/iterm2-material-design). It's included in the `assets/colors` dir.

    ```
    iTerm → Preferences → Profiles → your-profile → Colors → Color Presets → Import
    Then again, Color presets → you-color-scheme-name
    ```

  - [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

    I used **12pt** `font-hack-nerd-font` and **13pt** `font-liberationmono-nerd-font` for Non-ASCII Font.

    ```bash
    $ brew tap caskroom/fonts
    $ brew cask install font-hack-nerd-font font-liberationmono-nerd-font
    ```
    ```
    iTerm → Preferences → Profiles → your-profile → Text → Font
    ```

  - [tiny-care-terminal](https://github.com/notwaldorf/tiny-care-terminal)

    ```bash
    # install nvm
    $ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
    # install npm v11.10.0. node-gyp v3.8.0 breaks with node v12.1.0.
    $ nvm install 11.10.0
    # install tcc
    $ npm install -g tiny-care-terminal
    ```

3. zsh plugins

  - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
  ```bash
  $ brew install zsh-autosuggestions
  $ echo "source usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
  ```

  - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
  ```bash
  $ brew install zsh-syntax-highlighting
  $ echo "source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
  ```
