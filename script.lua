local gui = Instance.new("ScreenGui")
gui.Name = "JenniferWHub"
gui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,600,0,350)
frame.Position = UDim2.new(0.5,-300,0.5,-175)
frame.BackgroundColor3 = Color3.fromRGB(15,15,20)
frame.BorderSizePixel = 0

frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "JenniferW Hub"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true

local sidebar = Instance.new("Frame")
sidebar.Parent = frame
sidebar.Size = UDim2.new(0,150,1,-40)
sidebar.Position = UDim2.new(0,0,0,40)
sidebar.BackgroundColor3 = Color3.fromRGB(20,20,25)

local mainButton = Instance.new("TextButton")
mainButton.Parent = sidebar
mainButton.Size = UDim2.new(1,0,0,40)
mainButton.Text = "Main"
mainButton.TextColor3 = Color3.new(1,1,1)
mainButton.BackgroundTransparency = 1

local toggle = Instance.new("TextButton")
toggle.Parent = frame
toggle.Size = UDim2.new(0,120,0,40)
toggle.Position = UDim2.new(0,200,0,100)
toggle.Text = "OFF"
toggle.BackgroundColor3 = Color3.fromRGB(50,50,60)
toggle.TextColor3 = Color3.new(1,1,1)

local state = false

toggle.MouseButton1Click:Connect(function()
	state = not state
	
	if state then
		toggle.Text = "ON"
		toggle.BackgroundColor3 = Color3.fromRGB(0,170,255)
	else
		toggle.Text = "OFF"
		toggle.BackgroundColor3 = Color3.fromRGB(50,50,60)
	end
end)
