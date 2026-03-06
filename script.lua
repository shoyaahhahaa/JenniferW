-- load rayfield
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

-- notification
Rayfield:Notify({
   Title = "JenniferW Hub",
   Content = "Loaded!",
   Duration = 4
})

-- player section
MainTab:CreateSection("Player")

-- function that applies speed
local function applySpeed()
   local char = player.Character
   if char and char:FindFirstChild("Humanoid") then
      if speedEnabled then
         char.Humanoid.WalkSpeed = speedValue
      else
         char.Humanoid.WalkSpeed = 16
      end
   end
end

-- keep speed on respawn
player.CharacterAdded:Connect(function()
   task.wait(1)
   applySpeed()
end)

-- speed input
MainTab:CreateInput({
   Name = "WalkSpeed Value",
   PlaceholderText = "Type number (ex: 50)",
   RemoveTextAfterFocusLost = false,
   Callback = function(text)
      local num = tonumber(text)
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
   Callback = function(state)
      speedEnabled = state
      applySpeed()
   end
})

-- SETTINGS UI SECTION
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
   Callback = function(val)
      r = val
      updateColor()
   end
})

SettingsTab:CreateSlider({
   Name = "Green",
   Range = {0,255},
   Increment = 1,
   CurrentValue = g,
   Callback = function(val)
      g = val
      updateColor()
   end
})

SettingsTab:CreateSlider({
   Name = "Blue",
   Range = {0,255},
   Increment = 1,
   CurrentValue = b,
   Callback = function(val)
      b = val
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

-- UI toggle key (0 key top row)
local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(input, gpe)
   if input.KeyCode == Enum.KeyCode.Zero then
      Rayfield:Toggle()
   end
end)
