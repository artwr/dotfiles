-- List of Spoons
hspoon_list = {
        --"ClipShow",
        --"TextClipboardHistory",
        "WindowHalfsAndThirds",
        --"WinWin",
    }

-- Load those Spoons
for _, v in pairs(hspoon_list) do
    hs.loadSpoon(v)
end

-- Load the default hotkeys
spoon.WindowHalfsAndThirds:bindHotkeys(spoon.WindowHalfsAndThirds.defaultHotkeys)
--


-- hs.loadSpoon(WindowHalfsAndThirds)

-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()

--   f.x = max.x
--   f.y = max.y
--   f.w = max.w / 3
--   f.h = max.h
--   win:setFrame(f)
-- end)

-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()

--   f.x = max.x + (2 * max.w / 3)
--   f.y = max.y
--   f.w = max.w / 3
--   f.h = max.h
--   win:setFrame(f)
-- end)

-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Up", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()

--   f.x = max.x + (max.w / 3)
--   f.y = max.y
--   f.w = max.w / 3
--   f.h = max.h
--   win:setFrame(f)
-- end)


