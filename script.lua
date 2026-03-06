-- load UI library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local player = game.Players.LocalPlayer
local speedValue = 16

-- create window
local Window = Rayfield:CreateWindow({
   Name = "JenniferW Hub",
   LoadingTitle = "JenniferW",
   LoadingSubtitle = "by Shourya",
   ConfigurationSaving = {
      Enabled = false
   }
})

-- tabs
local MainTab = Window:CreateTab("Main", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)

-- notification
Rayfield:Notify({
   Title = "JenniferW Hub",
   Content = "Loaded successfully!",
   Duration = 5,
   Image = 4483362458
})

-- label
MainTab:CreateLabel("JenniferW Hub v1.0")

-- section
MainTab:CreateSection("Player")

-- function that keeps speed applied
local function applySpeed()
   if player.Character and player.Character:FindFirstChild("Humanoid") then
      player.Character.Humanoid.WalkSpeed = speedValue
   end
end

-- apply speed when character respawns
player.CharacterAdded:Connect(function()
   task.wait(1)
   applySpeed()
end)

-- speed slider
MainTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16,100},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
      speedValue = Value
      applySpeed()
   end
})

-- settings tab
SettingsTab:CreateLabel("Settings")

SettingsTab:CreateButton({
   Name = "Unload Hub",
   Callback = function()
      Rayfield:Destroy()
   end
})

-- toggle UI with 0 key
local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(input, gameProcessed)
   if input.KeyCode == Enum.KeyCode.Zero then
      Rayfield:Toggle()
   end
end)
