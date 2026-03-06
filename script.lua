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

SettingsTab:CreateInput({
   Name = "Hex Color",
   PlaceholderText = "#00AAFF",
   RemoveTextAfterFocusLost = false,
   Callback = function(text)

      local hex = text:gsub("#","")

      if #hex ~= 6 then return end

      local r = tonumber(hex:sub(1,2),16)
      local g = tonumber(hex:sub(3,4),16)
      local b = tonumber(hex:sub(5,6),16)

      if r and g and b then

         local color = Color3.fromRGB(r,g,b)

         -- change rayfield theme
         Rayfield.Theme.Accent = color

         -- update UI
         for _,v in pairs(game.CoreGui:GetDescendants()) do
            if v:IsA("Frame") and v.Name == "Accent" then
               v.BackgroundColor3 = color
            end
         end

      end

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
