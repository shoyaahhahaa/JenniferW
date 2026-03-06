-- load rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer

local speedValue = 16
local speedEnabled = false

-- create window
local Window = Rayfield:CreateWindow({
   Name = "JenniferW Hub",
   LoadingTitle = "JenniferW",
   LoadingSubtitle = "by Shourya",
   ConfigurationSaving = {Enabled = false}
})

-- tabs
local MainTab = Window:CreateTab("Main", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)

-- notification
Rayfield:Notify({
   Title = "JenniferW Hub",
   Content = "Loaded!",
   Duration = 4
})

-- PLAYER SECTION
MainTab:CreateSection("Player")

-- speed input
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

-- speed toggle
MainTab:CreateToggle({
   Name = "Enable WalkSpeed",
   CurrentValue = false,
   Callback = function(state)
      speedEnabled = state
   end
})

-- enforce speed loop
task.spawn(function()
   while true do
      task.wait(0.1)
      if speedEnabled then
         local char = player.Character
         if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = speedValue
         end
      end
   end
end)

-- SETTINGS
SettingsTab:CreateSection("UI")

local r,g,b = 0,170,255

local function updateColor()
   Rayfield:SetTheme({
      AccentColor = Color3.fromRGB(r,g,b)
   })
end

SettingsTab:CreateSlider({
   Name = "Red",
   Range = {0,255},
   Increment = 1,
   CurrentValue = r,
   Callback = function(v)
      r = v
      updateColor()
   end
})

SettingsTab:CreateSlider({
   Name = "Green",
   Range = {0,255},
   Increment = 1,
   CurrentValue = g,
   Callback = function(v)
      g = v
      updateColor()
   end
})

SettingsTab:CreateSlider({
   Name = "Blue",
   Range = {0,255},
   Increment = 1,
   CurrentValue = b,
   Callback = function(v)
      b = v
      updateColor()
   end
})

-- unload button
SettingsTab:CreateButton({
   Name = "Unload Hub",
   Callback = function()
      Rayfield:Destroy()
   end
})

-- UI toggle key
UIS.InputBegan:Connect(function(input, gp)
   if input.KeyCode == Enum.KeyCode.Zero then
      Rayfield:Toggle()
   end
end)
