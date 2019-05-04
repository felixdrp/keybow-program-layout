# keybow-program-layout

Programing layout for [Pimoroni
Keybow](https://shop.pimoroni.com/products/keybow) macro keyboards.

> Based on work donne by [TheDiveO/multibow](https://github.com/TheDiveO/multibow)

## Experience

It is a good platform for people that like to program ther own keyboard.

## Installation

1. Download the [Pibow
   firmware](https://github.com/pimoroni/keybow-firmware/releases) and copy
   all files inside its `sdcard/` subdirectory onto an empty, FAT32 formatted
   microSD card. Copy only the files **inside** `sdcard/`, but do **not**
   place them into a ~~`sdcard`~~ directory on your microSD card.

2. Download all files from the `sdcard/` subdirectory of this repository and
   then copy them onto the microSD card. This will overwrite but one file
   `key.lua`, all other files are new.
   - download recent stable
     [sdcard.zip](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/TheDiveO/multibow/tree/master/sdcard)
     – courtesy of Minhas Kamal's incredibly useful
     [DownGit](https://github.com/MinhasKamal/DownGit) service which lets
     users directly download GitHub repository directories as .zip files.
     _Please note that we're not responsible for the DownGit service and its
     integrity, so be cautious when downloading files._

## Multiple Keyboard Layouts

To enable one or more multibow keyboard layouts, edit `sdcard/keys.lua`
accordingly in order to "`require`" them. The default configuration looks as
follows:

```lua
require "layouts/shift" -- for cycling between layouts.
require "layouts/programing" -- programing layout.
require "layouts/media-player" -- indispensable media player controls.
```

> You can disable a specific keyboard layout by simply putting two dashes `--`
> in front of the `require "..."`, making it look like `--require "..."`.

## Layouts

The default setup activates the following macro keyboard layouts shown below.

> You can switch (cycle) between them by pressing and holding key #11
> (top-left key in landscape), then tapping key #5 (immediately right to #11),
> and finally releasing both keys.

### Progaming

This layout let you use some of the most used keys on dev.
It is very useful to have one hand with the mouse and other with 'programing layout'

```text
┌╌╌╌╌┐  ┌╌╌╌╌┐  ┌╌╌╌╌┐  ┌╌╌╌╌┐
┊ 11 ┊  ┊  8 ┊  ┊  5 ┊  ┊  2 ┊
└╌╌╌╌┘  └╌╌╌╌┘  └╌╌╌╌┘  └╌╌╌╌┘
         Empty   Undo    Backspace ⟵
┌╌╌╌╌┐  ┌╌╌╌╌┐  ┌╌╌╌╌┐  ┌╌╌╌╌┐
┊ 10 ┊  ┊  7 ┊  ┊  4 ┊  ┊  1 ┊
└╌╌╌╌┘  └╌╌╌╌┘  └╌╌╌╌┘  └╌╌╌╌┘
Shift-L  Cut     Copy    Paste
┌╌╌╌╌┐  ┌╌╌╌╌┐  ┌╌╌╌╌┐  ┌╌╌╌╌┐
┊  9 ┊  ┊  6 ┊  ┊  3 ┊  ┊  0 ┊
└╌╌╌╌┘  └╌╌╌╌┘  └╌╌╌╌┘  └╌╌╌╌┘
 Ctrl-L  Alt-L   Space   Enter
```

#### Save => Crtl + s
First push and maintain key 1 and push key 2.
⎚ ⎚ ⎚ ⎚
⎚ 2 ⎚ ⎚
1 ⎚ ⎚ ⎚

#### Redo => Shift + Crtl + s
First push and maintain key 1 and push key 2.
⎚ ⎚ 2 ⎚
1 ⎚ ⎚ ⎚
⎚ ⎚ ⎚ ⎚

#### Dot => .
First push and maintain key 1 and push key 2.
⎚ ⎚ ⎚ ⎚
⎚ ⎚ ⎚ ⎚
1 ⎚ 2 ⎚

#### Comma => ,
First push and maintain key 1 and push key 2.
⎚ ⎚ ⎚ ⎚
⎚ ⎚ ⎚ ⎚
⎚ 1 2 ⎚

#### Change app => Alt + Tap
First push and maintain key 1 and push key 2.
⎚ ⎚ ⎚ ⎚
2 ⎚ ⎚ ⎚
⎚ 1 ⎚ ⎚

#### Change app of same type => Alt + `
First push and maintain key 1 and push key 2.
⎚ ⎚ ⎚ ⎚
⎚ 2 ⎚ ⎚
⎚ 1 ⎚ ⎚

### Media Player Controls

We start with the probably indispensable media player controls keyboard layout.
'nuff said.

```text
┌╌╌╌╌┐  ┌╌╌╌╌┐  ┌╌╌╌╌┐  ┌╌╌╌╌┐
┊ 11 ┊  ┊  8 ┊  ┊  5 ┊  ┊  2 ┊
└╌╌╌╌┘  └╌╌╌╌┘  └╌╌╌╌┘  └╌╌╌╌┘
          🔇     🔈/🔉     🔊
┌╌╌╌╌┐  ┌╌╌╌╌┐  ┌╌╌╌╌┐  ┌╌╌╌╌┐
┊ 10 ┊  ┊  7 ┊  ┊  4 ┊  ┊  1 ┊
└╌╌╌╌┘  └╌╌╌╌┘  └╌╌╌╌┘  └╌╌╌╌┘
                  ⏹️️
┌╌╌╌╌┐  ┌╌╌╌╌┐  ┌╌╌╌╌┐  ┌╌╌╌╌┐
┊  9 ┊  ┊  6 ┊  ┊  3 ┊  ┊  0 ┊
└╌╌╌╌┘  └╌╌╌╌┘  └╌╌╌╌┘  └╌╌╌╌┘
          ◀️◀️      ▮▶      ▶▶
```