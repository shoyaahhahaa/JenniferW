-- load rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer

local speedValue = 16
local speedEnabled = false

local r,g,b = 0,170,255

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



SettingsTab:CreateSection("UI")

local uiHex = "#00AAFF"

SettingsTab:CreateInput({
   Name = "UI Hex Color",
   PlaceholderText = "#FF0000",
   RemoveTextAfterFocusLost = false,
   Callback = function(text)
      uiHex = text
   end
})

SettingsTab:CreateButton({
   Name = "Apply Color",
   Callback = function()

      local hex = uiHex:gsub("#","")

      if #hex ~= 6 then return end

      local r = tonumber(hex:sub(1,2),16)
      local g = tonumber(hex:sub(3,4),16)
      local b = tonumber(hex:sub(5,6),16)

      if not (r and g and b) then return end

      -- destroy UI
      Rayfield:Destroy()

      -- reload rayfield
      local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

      Rayfield:SetTheme({
         AccentColor = Color3.fromRGB(r,g,b)
      })

   end
})
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
