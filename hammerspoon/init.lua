keyCodes = { e=14, i=34, u=32, m=46, o=31, d=2, s=1 } -- hs.keycodes.map

appShortcuts = {
  [keyCodes.e] = 'Google Chrome',
  [keyCodes.i] = 'iTerm',
  [keyCodes.u] = 'Emacs',
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
  if not is_app_running(appName) then
    hs.alert('Launching ' .. appName)
  end

  hs.application.open(appName)
end

function is_app_running(appName)
  if hs.appfinder.appFromName(appDualNames[appName] or appName) then
    return true
  end
  return false
end
