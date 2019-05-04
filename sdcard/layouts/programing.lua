-- A Multibow simple media player keyboard layout.

--[[
Copyright 2019 Felix Rodriguez Perez

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]--

--[[
The Keybow layout is as follows when in landscape orientation, with the USB
cable going off "northwards":

┌╌╌╌╌┐  ┌╌╌╌╌┐  ┌╌╌╌╌┐  ┌╌╌╌╌┐
┊ 11 ┊  ┊  8 ┊  ┊  5 ┊  ┊  2 ┊
└╌╌╌╌┘  └╌╌╌╌┘  └╌╌╌╌┘  └╌╌╌╌┘

┌╌╌╌╌┐  ┌╌╌╌╌┐  ┌╌╌╌╌┐  ┌╌╌╌╌┐
┊ 10 ┊  ┊  7 ┊  ┊  4 ┊  ┊  1 ┊
└╌╌╌╌┘  └╌╌╌╌┘  └╌╌╌╌┘  └╌╌╌╌┘

┌╌╌╌╌┐  ┌╌╌╌╌┐  ┌╌╌╌╌┐  ┌╌╌╌╌┐
┊  9 ┊  ┊  6 ┊  ┊  3 ┊  ┊  0 ┊
└╌╌╌╌┘  └╌╌╌╌┘  └╌╌╌╌┘  └╌╌╌╌┘

]]--

local programing = _G.programing or {} -- module
require "keybow"
local mb = require "snippets/multibow"

programing.RED = { r=1, g=0, b=0 }
programing.YELLOW = { r=1, g=0.7, b=0 }
programing.GREEN = { r=0, g=1, b=0 }
programing.GREENISH = { r=0.5, g=0.8, b=0.5}
programing.BLUE = { r=0, g=0, b=1 }
programing.BLUECYAN = { r=0, g=0.7, b=1 }
programing.BLUEGRAY = { r=0.7, g=0.7, b=1 }
programing.CYAN = { r=0, g=1, b=1 }

programing.COLOR_RUN = programing.COLOR_RUN or programing.GREENISH
programing.COLOR_STOP = programing.COLOR_STOP or programing.RED
programing.COLOR_RELOAD = programing.COLOR_RELOAD or programing.YELLOW
programing.COLOR_TESTPKG = programing.COLOR_TESTPKG or programing.CYAN
programing.COLOR_CONT = programing.COLOR_CONT or programing.GREEN
programing.COLOR_STEPINTO = programing.COLOR_STEPINTO or programing.BLUECYAN
programing.COLOR_STEPOVER = programing.COLOR_STEPOVER or programing.BLUE
programing.COLOR_STEPOUT = programing.COLOR_STEPOUT or programing.BLUEGRAY

programing.COLOR_VIEWOUTPUT = programing.COLOR_VIEWOUTPUT or programing.GREENISH
programing.COLOR_VIEWDEBUG = programing.COLOR_VIEWDEBUG or programing.GREEN
programing.COLOR_CLOSEPANEL = programing.COLOR_CLOSEPANEL or programing.RED

local shiftPressed = false
local controlPressed = false
local altLeftPressed = false

function programing.key_00_pressed(_)
    mb.tap(keybow.ENTER)
end

function programing.key_01_pressed(_)
    -- mb.tap("v",keybow.LEFT_CTRL)

    keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_DOWN)
    keybow.tap_key("v", true)
    keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_UP)
end

function programing.key_02_pressed(_)
    mb.tap(keybow.BACKSPACE)
    -- keybow.set_key(keybow.BACKSPACE, pressed)
end

function programing.handle_key_03(pressed)
    if controlPressed then
        keybow.set_key(",", pressed)
        mb.tap(",")
        mb.tap("k")
    elseif altLeftPressed then
        keybow.set_key(",", pressed)
        mb.tap(",")
        mb.tap("f")
    else
        mb.tap(" ")
    end
end

programing.keymap = {
    name="vsc-golang-debug",
    [0] = {c=programing.COLOR_RUN, press=programing.key_00_pressed},
    -- [0] = {c=programing.COLOR_RUN, press=programing.key_00_pressed, release=},
    [1] = {c=programing.COLOR_STOP, press=programing.key_01_pressed},
    [2] = {c=programing.COLOR_STOP, press=programing.key_02_pressed},
    [3] = {
        c=programing.COLOR_TESTPKG,
        -- press=programing.handle_key_03
        press=function(_)
            if controlPressed then
                keybow.set_modifier(keybow.LEFT_SHIFT, false)
                keybow.set_modifier(keybow.LEFT_CTRL, false)
                mb.tap(".")
            elseif altLeftPressed then
                keybow.set_modifier(keybow.LEFT_SHIFT, false)
                keybow.set_modifier(keybow.LEFT_CTRL, false)
                keybow.set_modifier(keybow.LEFT_ALT, false)
                mb.tap(",")
            else
                mb.tap(" ")
            end
        end,
    },
    [4] = {c=programing.COLOR_CONT, press=function(_) mb.tap("c", keybow.LEFT_CTRL) end},
    [5] = {
        c=programing.COLOR_STEPINTO,
        press=function(_)
            if shiftPressed then
                mb.tap("z", keybow.LEFT_CTRL, keybow.LEFT_SHIFT)
            elseif altLeftPressed then
                -- mb.tap("`")
            else
                mb.tap("z", keybow.LEFT_CTRL)
            end
        end,
    },
    [6] = {
        c=programing.COLOR_STEPINTO,
        press=function(_)
            keybow.set_modifier(keybow.LEFT_ALT, keybow.KEY_DOWN)
            altLeftPressed = true
        end,
        release=function(_)
            keybow.set_modifier(keybow.LEFT_ALT, keybow.KEY_UP)
            altLeftPressed = false
        end,
    },
    [7] = {
        c=programing.COLOR_STEPOVER,
        press=function(_)
            if controlPressed then
                keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_DOWN)
                keybow.tap_key("s", pressed)
                keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_UP)
            elseif altLeftPressed then
                mb.tap("`")
            else
                keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_DOWN)
                keybow.tap_key("x", pressed)
                keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_UP)
            end
        end,
    },

    [9] = {
        c=programing.COLOR_STEPOUT,
        press=function(_)
            keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_DOWN)
            controlPressed = true
        end,
        release=function(_)
            keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_UP)
            controlPressed = false
        end,
    },
    [10] = {
        c=programing.COLOR_STEPOUT,
        press=function(_)
            if altLeftPressed then
                mb.tap(keybow.TAB)
            else
                keybow.set_modifier(keybow.LEFT_SHIFT, keybow.KEY_DOWN)
                shiftPressed = true
            end
        end,
        release=function(_)
            keybow.set_modifier(keybow.LEFT_SHIFT, keybow.KEY_UP)
            shiftPressed = false
        end,
    },

}

mb.register_keymap(programing.keymap)

return programing -- module