-- load rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer

local speedValue = 16
local speedEnabled = false

local r,g,b = 68, 40, 68

-- window
local Window = Rayfield:CreateWindow({
   Name = "JenniferW v1.2",
   LoadingTitle = "JenniferW v1.2",
   LoadingSubtitle = "by Shoya",
   ConfigurationSaving = {Enabled = false}
})

-- tabs
local MainTab = Window:CreateTab("Main", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)

-- notification
Rayfield:Notify({
   Title = "JenniferW V1.2",
   Content = "Loaded!",
   Duration = 4
})

------------------------------------------------
-- MAIN TAB
------------------------------------------------

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

-- enforce speed
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

------------------------------------------------
-- SETTINGS TAB
------------------------------------------------




SettingsTab:CreateButton({
   Name = "Unload Hub",
   Callback = function()
      Rayfield:Destroy()
   end
})

------------------------------------------------
-- UI TOGGLE
------------------------------------------------

UIS.InputBegan:Connect(function(input, gp)
   if input.KeyCode == Enum.KeyCode.Zero then
      Rayfield:Toggle()
   end
end)
