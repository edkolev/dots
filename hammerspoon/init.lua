keyCodes = { e=14, i=34, u=32, m=46, o=31, d=2, }

appShortcuts = {
  [keyCodes.e] = 'Google Chrome',
  [keyCodes.i] = 'iTerm',
  [keyCodes.u] = 'MacVim',
  [keyCodes.m] = 'Mail',
  [keyCodes.o] = 'Sequel Pro',
  [keyCodes.d] = 'VLC',
}

-- name before launch => name after launch
appDualNames = {
  iTerm = 'iTerm2'
}

for key, appName in pairs(appShortcuts) do
  hs.hotkey.bind({"cmd"}, key, function()
    launch_or_focus(appName)
  end)
end

function launch_or_focus(appName)
  if not is_app_running( appName) then
    hs.alert('Launching ' .. appName)
  end

  hs.application.launchOrFocus(appName)
end

function is_app_running(appName)
  if hs.appfinder.appFromName(appDualNames[appName] or appName) then
    return true
  end
  return false
end

-- local log = hs.logger.new('mymodule','debug')
-- function reloadConfig(files)
--   doReload = false
--   for _,file in pairs(files) do
--     if file:sub(-4) == ".lua" then
--       doReload = true
--     end
--   end
--   if doReload then
--     hs.alert("Config will be reloaded")
--     hs.reload()
--   end
-- end
-- local myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()

