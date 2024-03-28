# macOS Configs
This repository contains a collection of configuration files that leverage a few different tools to convert my macOS setup into a more Linux-like developer tool that provides:

- Automated tiling window management
- Better Spaces support
- A leaner and more configurable status bar
- Fully configurable action keys with custom shortcuts

The following tools are leveraged to achieve this:

- [yabai](https://github.com/koekeishiya/yabai)
- [sketchybar](https://github.com/FelixKratz/SketchyBar)
- [Karabiner-Elements](https://karabiner-elements.pqrs.org/)
- [Hammerspoon](https://www.hammerspoon.org/)

Credits to @pkieltyka and his work on [macrice](https://github.com/pkieltyka/macrice), a lot of this is based on his setup.

## yabai
yabai is a tiling window manager that offers tons of customization options. Installation is simple with homebrew:

```bash
brew install koekeishiya/formulae/yabai
```

Afterwards just symlink the config file and start the service:

```bash
ln -s `pwd`/yabai ~/.config/yabai
yabai --start-service
```

## sketchybar
sketchybar is a configurable status bar replacement tool. It's not required for this build however it can work very nicely with yabai using the configuration included in this repo.

Installation is again simple with homebrew:

```bash
brew install sketchybar
brew install --cask font-hack-nerd-font
brew install --cask sf-symbols
```

Then symnlink the config folder and restart the service:

```bash
ln -s `pwd`/sketchybar ~/.config/sketchybar
brew services restart sketchybar
```

## Karabiner-Elements
[Karabiner-Elements](https://karabiner-elements.pqrs.org/) allows custom key shortcut configuration natively in macOS. It can be installed as an app directly from their site.

Once installed, you can use the `fn_config.json` file to convert your fn key to trigger alt + control + shift, which then acts as a trigger for Hammerspoon shortcuts.

## Hammerspoon
[Hammerspoon](https://www.hammerspoon.org/) is an automation tool for macOS that leverages Lua scripts so it's very configurable. It's installed as an app from their site.

After installation, symlink to the config file:

```bash
ln -s `pwd`/hammerspoon ~/.hammerspoon
```

You might have to launch Hammerspoon afterwards and run `hs.reload()` in the script console to have it load the settings.

Once Hammerspoon is running, the following shortcuts will be good to go:

| Shortcut        | Action                     |
|-----------------|----------------------------|
| fn + r          | Reload Hammerspoon config  |
| fn + l          | Lock screen                |
| fn + g          | Launch Google Chrome       |
| fn + a          | Launch Arc Browser         |
| fn + t          | Launch Terminal (Warp)     |
| fn + v          | Launch VS Code             |
| fn + p          | Launch Preview             |
| fn + s          | Launch Safari              |
| fn + d          | Launch Discord             |
| fn + c          | Launch Slack               |
| fn + m          | Launch Spotify             |
| fn + n          | Launch Notion              |
| fn + p          | Launch Postman             |
| fn + ⌘ + ⏎      | Launch new Finder window   |
| fn + ⌘ + ⏎      | Launch new Terminal window |
| fn + arrows     | Focus window in direction  |
| fn + ⌘ + arrows | Swap window in direction   |
| fn + f          | Full screen active window  |
| fn + r          | Cycle panels around        |
| fn + space      | Float active window        |
| fn + ⌘ + number | Move window to space       |
| fn + v          | Switch split mode          |
| fn + ;          | Increase window size       |
| fn + "          | Decrease window size       |

## macOS System Settings
There are two additional settings in macOS that will improve the setup:

1. Control Center > Automatically hide the menu bar
2. Keyboard > Keyboard Shortcuts > Mission Control > Assign `alt + ctrl + shift + number` to each space
