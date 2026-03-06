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
local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.LeftBracket then
		OrionLib:Toggle()
	end
end)
