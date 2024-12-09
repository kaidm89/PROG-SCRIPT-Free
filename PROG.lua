local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "404 NOT FOUND", HidePremium = false, SaveConfig = true, ConfigFolder = "404 NOT FOUND"})
local Tab = Window:MakeTab({
	Name = "MAIN",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "POWER"
})


Tab:AddSlider({
	Name = "JUNB POWER",
	Min = 0,
	Max = 300,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "JumpPower",
	Callback = function(Value)
		print(Value)
	end    
})

--[[
Name = <string> - The name of the slider.
Min = <number> - The minimal value of the slider.
Max = <number> - The maxium value of the slider.
Increment = <number> - How much the slider will change value when dragging.
Default = <number> - The default value of the slider.
ValueName = <string> - The text after the value number.
Callback = <function> - The function of the slider.
]]
