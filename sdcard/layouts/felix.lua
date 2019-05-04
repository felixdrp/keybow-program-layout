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
local felix = _G.felix or {} -- module
require "keybow"
local mb = require "snippets/multibow"

felix.RED = { r=1, g=0, b=0 }
felix.YELLOW = { r=1, g=0.7, b=0 }
felix.GREEN = { r=0, g=1, b=0 }
felix.GREENISH = { r=0.5, g=0.8, b=0.5}
felix.BLUE = { r=0, g=0, b=1 }
felix.BLUECYAN = { r=0, g=0.7, b=1 }
felix.BLUEGRAY = { r=0.7, g=0.7, b=1 }
felix.CYAN = { r=0, g=1, b=1 }

felix.COLOR_RUN = felix.COLOR_RUN or felix.GREENISH
felix.COLOR_STOP = felix.COLOR_STOP or felix.RED
felix.COLOR_RELOAD = felix.COLOR_RELOAD or felix.YELLOW
felix.COLOR_TESTPKG = felix.COLOR_TESTPKG or felix.CYAN
felix.COLOR_CONT = felix.COLOR_CONT or felix.GREEN
felix.COLOR_STEPINTO = felix.COLOR_STEPINTO or felix.BLUECYAN
felix.COLOR_STEPOVER = felix.COLOR_STEPOVER or felix.BLUE
felix.COLOR_STEPOUT = felix.COLOR_STEPOUT or felix.BLUEGRAY

felix.COLOR_VIEWOUTPUT = felix.COLOR_VIEWOUTPUT or felix.GREENISH
felix.COLOR_VIEWDEBUG = felix.COLOR_VIEWDEBUG or felix.GREEN
felix.COLOR_CLOSEPANEL = felix.COLOR_CLOSEPANEL or felix.RED

local shiftPressed = false
local controlPressed = false
local altLeftPressed = false

-- function handle_key_00(pressed)
--     keybow.set_key(keybow.ENTER, pressed)
-- end
function felix.key_00_pressed(_)
    mb.tap(keybow.ENTER)
    -- keybow.set_key(keybow.ENTER, true)
end

-- -- function handle_key_01(pressed)
-- --     if pressed then
-- --         keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_DOWN)
-- --         keybow.tap_key("v", pressed)
-- --         keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_UP)
-- --     end
-- -- end

function felix.key_01_pressed(_)
    -- mb.tap("v",keybow.LEFT_CTRL)

    keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_DOWN)
    keybow.tap_key("v", true)
    keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_UP)
end

-- -- function handle_key_02(pressed)
-- --     keybow.set_key(keybow.BACKSPACE, pressed)
-- -- end

function felix.key_02_pressed(_)
    mb.tap(keybow.BACKSPACE)
    -- keybow.set_key(keybow.BACKSPACE, pressed)
end

function felix.handle_key_03(pressed)
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

-- function handle_key_04(pressed)
--     if pressed then
--         keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_DOWN)
--         keybow.tap_key("c", pressed)
--         keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_UP)
--     end
-- end

-- -- function handle_key_05(pressed)
-- --     keybow.set_key("3", pressed)
-- -- end

-- function handle_key_06(pressed)
--     if pressed then
--         if controlPressed then
--             keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_DOWN)
--             keybow.set_modifier(keybow.LEFT_SHIFT, keybow.KEY_DOWN)
--             keybow.tap_key("z", pressed)
--             keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_UP)
--             keybow.set_modifier(keybow.LEFT_SHIFT, keybow.KEY_UP)
--         else
--             keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_DOWN)
--             keybow.tap_key("z", pressed)
--             keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_UP)
--         end
--     end
-- end

-- function handle_key_07(pressed)
--     if pressed then
--         if controlPressed then
--             keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_DOWN)
--             keybow.tap_key("s", pressed)
--             keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_UP)
--         else
--             keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_DOWN)
--             keybow.tap_key("x", pressed)
--             keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_UP)
--         end
--     end
-- end

-- -- function handle_key_08(pressed)
-- --     keybow.set_key("6", pressed)
-- -- end

-- function handle_key_09(pressed)
--     if pressed then
--         keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_DOWN)
--         controlPressed = true
--     else
--         keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_UP)
--         controlPressed = false
--     end
-- end

-- function handle_key_10(pressed)
--     if pressed then
--         keybow.set_modifier(keybow.LEFT_SHIFT, keybow.KEY_DOWN)
--         shiftPressed = true
--     else
--         keybow.set_modifier(keybow.LEFT_SHIFT, keybow.KEY_UP)
--         shiftPressed = false
--     end
-- end

-- -- function handle_key_11(pressed)
-- --     keybow.set_key("9", pressed)
-- -- end

felix.keymap = {
    name="vsc-golang-debug",
    [0] = {c=felix.COLOR_RUN, press=felix.key_00_pressed},
    -- [0] = {c=felix.COLOR_RUN, press=felix.key_00_pressed, release=},
    [1] = {c=felix.COLOR_STOP, press=felix.key_01_pressed},
    [2] = {c=felix.COLOR_STOP, press=felix.key_02_pressed},
    [3] = {
        c=felix.COLOR_TESTPKG,
        -- press=felix.handle_key_03
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
    [4] = {c=felix.COLOR_CONT, press=function(_) mb.tap("c", keybow.LEFT_CTRL) end},
    [5] = {
        c=felix.COLOR_STEPINTO,
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
        c=felix.COLOR_STEPINTO,
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
        c=felix.COLOR_STEPOVER,
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
        --         if controlPressed then
--             keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_DOWN)
--             keybow.tap_key("s", pressed)
--             keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_UP)
--         else
--             keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_DOWN)
--             keybow.tap_key("x", pressed)
--             keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_UP)
    [9] = {
        c=felix.COLOR_STEPOUT,
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
        c=felix.COLOR_STEPOUT,
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

    -- [felix.KEY_VIEWOUTPUT] = {c=felix.COLOR_VIEWOUTPUT, press=function(_) felix.command("view toggle output") end},
    -- [felix.KEY_VIEWDEBUG] = {c=felix.COLOR_VIEWDEBUG, press=function(_) felix.command("view debug console") end},
    -- [felix.KEY_CLOSEPANEL] = {c=felix.COLOR_CLOSEPANEL, press=function(_) felix.command("view close panel") end},
}

mb.register_keymap(felix.keymap)

return felix -- module