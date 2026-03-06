local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Window = OrionLib:MakeWindow({
	Name = "JenniferW Hub",
	HidePremium = false,
	SaveConfig = false,
	ConfigFolder = "JenniferWHub"
})

local MainTab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

MainTab:AddToggle({
	Name = "Example Toggle",
	Default = false,
	Callback = function(Value)
		print("Toggle state:", Value)
	end
})

OrionLib:Init()
