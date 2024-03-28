local hyper  = { "alt", "ctrl", "shift" }
local hyperc = { "cmd", "alt", "ctrl", "shift" }

-- Hammerspoon -- reload the config on change
hs.hotkey.bind(hyperc, "r", function()
  hs.reload()
end)

-- Lock screen trigger
hs.hotkey.bind(hyper, "l", function()
  hs.caffeinate.lockScreen()
end)

-- hs.hotkey.bind(hyper, "f", function()
--   local win = hs.window.frontmostWindow()
--   win:setFullscreen(not win:isFullscreen())
-- end)

local term = 'Warp'

-- Global hot-key apps for fast-app launching and switching
local hotApps = {
  g = { id = 'Google Chrome' },
  a = { id = 'Arc' },
  t = { id = term },
  v = { id = 'Code' },
  p = { id = 'Preview' },
  s = { id = 'Safari' },
  d = { id = 'Discord', singleton = true },
  c = { id = 'Slack', singleton = true },
  m = { id = 'Spotify', singleton = true },
  n = { id = 'Notion', singleton = true },
  p = { id = 'Postman', singleton = true },
}

hs.hotkey.bind(hyperc, 'return', function()
  local app = hs.application.find('Finder')
  hs.eventtap.keyStroke({'cmd'}, 'N', nil, app)
  hs.application.launchOrFocus('Finder')
end)

for key, val in pairs(hotApps) do
  hs.hotkey.bind(hyper, key, function()
    local id = val.id
    local singleton = val.singleton
    local app = hs.application.find(id)

    if app == nil or singleton == true then
      hs.application.launchOrFocus(id)
    else
      local win = app:allWindows()[1]
      if win == nil then
        hs.eventtap.keyStroke({'cmd'}, 'N', nil, app)
        hs.application.launchOrFocus(id)
      else
        win.focus(win) -- hmm sup..?
        -- hs.alert.show('select the win')
        -- TODO: we can even keep hitting it and cycling
        -- there is the window switcher thing..
      end
    end
  end)
end

-- Terminal launcher
hs.hotkey.bind(hyper, "return", function()
  local app = hs.application.find(term)
  if app == nil then
    hs.application.launchOrFocus(term)
  else
    hs.eventtap.keyStroke({'cmd'}, 'N', nil, app)
    hs.application.launchOrFocus(term)
  end
end)

-- yabai integration..
local yabaiCli = '/opt/homebrew/bin/yabai'
local function yabaiExec(cmd)
  local _cmd = yabaiCli .. ' -m ' .. cmd
  return hs.execute(_cmd, false)
end
local function exec(cmd)
  return hs.execute(cmd, false)
end

hs.hotkey.bind(hyper, "left", function()
  yabaiExec('window --focus west')
end)
hs.hotkey.bind(hyper, "right", function()
  yabaiExec('window --focus east')
end)
hs.hotkey.bind(hyper, "up", function()
  yabaiExec('window --focus north')
end)
hs.hotkey.bind(hyper, "down", function()
  yabaiExec('window --focus south')
end)

hs.hotkey.bind(hyperc, "left", function()
  yabaiExec('window --warp west')
end)
hs.hotkey.bind(hyperc, "right", function()
  yabaiExec('window --warp east')
end)
hs.hotkey.bind(hyperc, "up", function()
  yabaiExec('window --warp north')
end)
hs.hotkey.bind(hyperc, "down", function()
  yabaiExec('window --warp south')
end)

hs.hotkey.bind(hyper, "f", function()
  yabaiExec('window --toggle zoom-fullscreen')
end)
hs.hotkey.bind(hyper, "r", function()
  yabaiExec('space --rotate 90')
end)
hs.hotkey.bind(hyper, "space", function()
  yabaiExec('window --toggle float')
end)

-- move windows to other spaces
hs.hotkey.bind(hyperc, "1", function()
  yabaiExec('window --space 1')
end)
hs.hotkey.bind(hyperc, "2", function()
  yabaiExec('window --space 2')
end)
hs.hotkey.bind(hyperc, "3", function()
  yabaiExec('window --space 3')
end)
hs.hotkey.bind(hyperc, "4", function()
  yabaiExec('window --space 4')
end)
hs.hotkey.bind(hyperc, "5", function()
  yabaiExec('window --space 5')
end)
hs.hotkey.bind(hyperc, "6", function()
  yabaiExec('window --space 6')
end)
hs.hotkey.bind(hyperc, "7", function()
  yabaiExec('window --space 7')
end)
hs.hotkey.bind(hyperc, "8", function()
  yabaiExec('window --space 8')
end)
hs.hotkey.bind(hyperc, "9", function()
  yabaiExec('window --space 9')
end)
hs.hotkey.bind(hyperc, "0", function()
  yabaiExec('window --space 10')
end)


hs.hotkey.bind(hyper, "v", function()
  yabaiExec('window --toggle split')
end)

-- hs.hotkey.bind(hyper, "h", function()
--   yabaiExec('window --grid 1:3:0:0:2:1')
-- end)

hs.hotkey.bind(hyper, ";", function()
  exec(yabaiCli .. ' -m window --resize right:-200:0 2> /dev/null || ' .. yabaiCli .. ' -m window --resize left:-200:0 2> /dev/null')
end)
hs.hotkey.bind(hyper, "'", function()
  exec(yabaiCli .. ' -m window --resize right:200:0 2> /dev/null || ' .. yabaiCli .. ' -m window --resize left:200:0 2> /dev/null')
end)

-- Spotify controls -- next/prev/play-pause
hs.hotkey.bind(hyper, ".", function()
  hs.osascript.applescript([[
    tell application "Spotify"
      next track
    end tell  
  ]])
end)
hs.hotkey.bind(hyper, ",", function()
  hs.osascript.applescript([[
    tell application "Spotify"
      previous track
    end tell  
  ]])
end)
hs.hotkey.bind(hyper, "/", function()
  hs.osascript.applescript([[
    if application "Spotify" is running then
      tell application "Spotify" to playpause
    end if
  ]])
end)
