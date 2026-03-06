local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "JenniferW Hub",
   LoadingTitle = "JenniferW",
   LoadingSubtitle = "by Shourya",
   ConfigurationSaving = {
      Enabled = false,
   }
})

local MainTab = Window:CreateTab("Main", 4483362458)

MainTab:CreateToggle({
   Name = "Example Toggle",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
      print("Toggle:", Value)
   end,
})
