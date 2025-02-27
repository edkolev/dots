local apps = {
   e = 'Google Chrome',
   i = 'Ghostty',
   u = 'Emacs',
   o = 'TablePlus',
   d = 'Youtube Music',
}

for key, app in pairs(apps) do
   hs.hotkey.bind({"cmd"}, key, function()
         if not hs.application.find(app) then
            hs.alert('Launching ' .. app)
         end

         hs.application.launchOrFocus(app)
   end)
end

local function equalUnitRect(f1, f2)
   return f1.x == f2.x and f1.y == f2.y and string.format("%.1f", f1.w) == string.format("%.1f", f2.w)
end

local function nextUnitRect(r, rs)
   for i,v in pairs(rs) do
      if equalUnitRect(v, r) and i ~= #rs then
         return rs[i+1]
      end
   end
   return rs[1]
end

local function moveWindowToUnit(win, rs)
   local currentR = hs.geometry.toUnitRect(win:frame(), win:screen():frame())
   local r = nextUnitRect(currentR, rs)
   win:moveToUnit(r)
end

hs.hotkey.bind({"cmd", "shift"}, "H", function()
      moveWindowToUnit(hs.window.focusedWindow(), {hs.layout.left70, hs.layout.left50, hs.layout.left30})
end)

hs.hotkey.bind({"cmd", "shift"}, "L", function()
      moveWindowToUnit(hs.window.focusedWindow(), {hs.layout.right70, hs.layout.right50, hs.layout.right30})
end)

hs.hotkey.bind({"cmd", "shift"}, "f", function()
  hs.window.focusedWindow():maximize()
end)

-- uncomment to reload config on file change
-- myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/init.lua", hs.reload):start()
-- hs.alert.show("Config loaded")
