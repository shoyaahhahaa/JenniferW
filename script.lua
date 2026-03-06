print("script working")
local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui

local text = Instance.new("TextLabel")
text.Parent = gui
text.Size = UDim2.new(0,200,0,50)
text.Position = UDim2.new(0.5,-100,0.5,-25)
text.Text = "Hi 👋"
text.TextScaled = true
frame.Active = true
frame.Draggable = true
