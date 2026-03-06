-- load UI library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

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
local Tab6 = Window:CreateTab("6", 4483362458)
local Tab7 = Window:CreateTab("7", 4483362458)

-- load notification
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

-- slider
MainTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16,100},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.WalkSpeed = Value
      end
   end
})

-- dropdown
MainTab:CreateDropdown({
   Name = "Choose Mode",
   Options = {"Mode 1","Mode 2","Mode 3"},
   CurrentOption = {"Mode 1"},
   Callback = function(Option)
      print("Selected:", Option)
   end
})

-- button
MainTab:CreateButton({
   Name = "Send Notification",
   Callback = function()
      Rayfield:Notify({
         Title = "JenniferW",
         Content = "Button pressed!",
         Duration = 4
      })
   end
})

-- unload button
MainTab:CreateButton({
   Name = "Unload Hub",
   Callback = function()
      Rayfield:Destroy()
   end
})

-- tab 6 content
Tab6:CreateLabel("Tab 6 Content")

Tab6:CreateButton({
   Name = "Test Button",
   Callback = function()
      print("Button from Tab 6")
   end
})

-- tab 7 content
Tab7:CreateLabel("Settings")

Tab7:CreateButton({
   Name = "Test Settings Button",
   Callback = function()
      print("Settings button clicked")
   end
})

-- toggle UI with 0 key (top row)
local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(input, gameProcessed)
   if input.KeyCode == Enum.KeyCode.Zero then
      Rayfield:Toggle()
   end
end)
