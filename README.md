# xmonad-configuration

Local xmonad configuration. This configuration has been archived - for up to date configuration see [nixos-config](https://github.com/blakekjohnson/nixos-config).

# Setup

1. Install dependencies listed on
[XMonad Install Page](https://xmonad.org/INSTALL.html)
2. Clone this repository using the following commands:
- `$ cd ~/.config && git clone https://github.com/blakekjohnson/xmonad-configuration xmonad`
3. If `stack` isn't already installed install it using package manager
4. Clone `xmonad` and `xmonad-contrib` repositories into the xmonad config
- `$ cd ~/.config/xmonad`
- `$ git clone https://github.com/xmonad/xmonad`
- `$ git clone https://github.com/xmonad/xmonad-contrib`
5. Install using: `stack install`
6. Install xmobar following instructions on [Xmobar installation page](https://codeberg.org/xmobar/xmobar#installation)
6. Add the built binary to the path using
(the binary is located in `~/.local/bin`)

