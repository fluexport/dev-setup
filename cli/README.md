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
    iTerm → Preferences → Profiles → Colors → Color Presets → Import
    Then again, Color presets → you-color-scheme-name
    ```

  - [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

    I used **12pt** `font-hack-nerd-font` and **13pt** `font-liberationmono-nerd-font` for Non-ASCII Font.

    ```bash
    $ brew tap caskroom/fonts
    $ brew cask install font-hack-nerd-font font-liberationmono-nerd-font
    ```
