-- load library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local player = game.Players.LocalPlayer

local speedValue = 16
local speedEnabled = false

-- window
local Window = Rayfield:CreateWindow({
   Name = "JenniferW Hub",
   LoadingTitle = "JenniferW",
   LoadingSubtitle = "by Shourya",
   ConfigurationSaving = {Enabled = false}
})

-- tabs
local MainTab = Window:CreateTab("Main", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)

-- notify
Rayfield:Notify({
   Title = "JenniferW Hub",
   Content = "Loaded successfully!",
   Duration = 4
})

-- section
MainTab:CreateSection("Player")

-- function to apply speed
local function applySpeed()
   if player.Character and player.Character:FindFirstChild("Humanoid") then
      if speedEnabled then
         player.Character.Humanoid.WalkSpeed = speedValue
      else
         player.Character.Humanoid.WalkSpeed = 16
      end
   end
end

-- respawn fix
player.CharacterAdded:Connect(function()
   task.wait(1)
   applySpeed()
end)

-- speed input
MainTab:CreateInput({
   Name = "WalkSpeed Value",
   PlaceholderText = "Enter speed",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      local num = tonumber(Text)
      if num then
         speedValue = num
         applySpeed()
      end
   end
})

-- speed toggle
MainTab:CreateToggle({
   Name = "Enable WalkSpeed",
   CurrentValue = false,
   Callback = function(Value)
      speedEnabled = Value
      applySpeed()
   end
})

-- SETTINGS TAB
SettingsTab:CreateSection("UI")

local r = 0
local g = 170
local b = 255

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
   Callback = function(Value)
      r = Value
      updateColor()
   end
})

SettingsTab:CreateSlider({
   Name = "Green",
   Range = {0,255},
   Increment = 1,
   CurrentValue = g,
   Callback = function(Value)
      g = Value
      updateColor()
   end
})

SettingsTab:CreateSlider({
   Name = "Blue",
   Range = {0,255},
   Increment = 1,
   CurrentValue = b,
   Callback = function(Value)
      b = Value
      updateColor()
   end
})

-- unload
SettingsTab:CreateButton({
   Name = "Unload Hub",
   Callback = function()
      Rayfield:Destroy()
   end
})

-- toggle UI with 0 key
local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(input, gp)
   if input.KeyCode == Enum.KeyCode.Zero then
      Rayfield:Toggle()
   end
end)
