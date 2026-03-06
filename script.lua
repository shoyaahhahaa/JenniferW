-- Load Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer

local speedValue = 16
local speedEnabled = false

---

## -- WINDOW

local Window = Rayfield:CreateWindow({
Name = "JenniferW v1.2",
LoadingTitle = "JenniferW v1.2",
LoadingSubtitle = "by Shoya",
ConfigurationSaving = {Enabled = false}
})

---

## -- TABS

local MainTab = Window:CreateTab("Main", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)
local InfoTab = Window:CreateTab("Info", 4483362458)

---

## -- NOTIFICATION

Rayfield:Notify({
Title = "JenniferW v1.2",
Content = "Loaded!",
Duration = 4
})

---

## -- MAIN TAB

MainTab:CreateSection("Player")

MainTab:CreateInput({
Name = "WalkSpeed Value",
PlaceholderText = "Example: 50",
RemoveTextAfterFocusLost = false,
Callback = function(text)
local num = tonumber(text)
if num then
speedValue = num
end
end
})

MainTab:CreateToggle({
Name = "Enable WalkSpeed",
CurrentValue = false,
Callback = function(state)
speedEnabled = state
end
})

-- Keep speed applied
task.spawn(function()
while true do
task.wait(0.1)

```
  if speedEnabled then
     local char = player.Character

     if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = speedValue
     end
  end
```

end
end)

---

## -- SETTINGS TAB

SettingsTab:CreateButton({
Name = "Unload Hub",
Callback = function()
Rayfield:Destroy()
end
})

---

## -- INFO TAB

-- Username
InfoTab:CreateLabel("Username: " .. player.Name)

-- Avatar
local userId = player.UserId

InfoTab:CreateImage({
Name = "User Avatar",
Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"
})

-- Runtime Stopwatch
local startTime = tick()

local runtimeLabel = InfoTab:CreateLabel("Running Time: 0s")

task.spawn(function()
while true do
task.wait(1)

```
  local elapsed = math.floor(tick() - startTime)

  runtimeLabel:Set("Running Time: " .. elapsed .. "s")
```

end
end)

---

## -- UI TOGGLE KEY

UIS.InputBegan:Connect(function(input, gp)
if input.KeyCode == Enum.KeyCode.Zero then
Rayfield:Toggle()
end
end)

