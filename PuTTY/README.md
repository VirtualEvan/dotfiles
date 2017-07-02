# PuTTY
Nothing special:
`zsh` + `oh-my-zsh [agnoster theme]` + `zsh-syntax-highlighting` + `DejaVu Sans Mono for Powerline font` + `tmux`

And this result:
![PuTTY](https://user-images.githubusercontent.com/12986551/27772842-88489e06-5f6a-11e7-99fa-9f572d10611d.png?raw=true "Example")

### zsh/oh-my-zsh

    apt-get install zsh
    apt-get install oh-my-zsh

Then configure the `agnoster` theme editing the file `~/.zshrc`

    ZSH_THEME="agnoster"

### Syntax highlighting
Follow [this](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#using-packages) guide.

    apt-get install zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

To enable syntax highlighting in the current interactive shell:

    source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### Putty config

#### Automatically start tmux
PuTTY > SSH > Remote command:

    which tmux >/dev/null 2>&1 && { tmux attach || tmux new -s default; } || bash -l

You can find a beginner guide [here](https://apiumtech.com/blog/tmux-cheat-sheet-tips-tricks/) by @OscarGalindo

#### Configure a Powerline-compatible font
Any of [this](https://github.com/powerline/fonts) fonts can be used. Copy the `.ttf` file to `C:\Windows\Fonts`

PuTTY > Appearance > Font settings > Change:
[Download](https://raw.githubusercontent.com/powerline/fonts/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20for%20Powerline.ttf)

    DejaVu Sans Mono for Powerline
