apps = {
   e = 'Google Chrome',
   i = 'iTerm',
   u = 'Emacs',
   o = 'TablePlus',
   d = 'Amazon Music',
}

for key, app in pairs(apps) do
   hs.hotkey.bind({"cmd"}, key, function()
         if not hs.application.find(app) then
            hs.alert('Launching ' .. app)
         end

         hs.application.launchOrFocus(app)
   end)
end

hs.hotkey.bind({"cmd", "shift"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "shift"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)
