local Modules = {}

-- [ORGAN: easing.lua]
Modules["Rise.src.libs.easing"] = [[
local easing = {}
local a={In=function(t,b,c,d)t=t/d;return ctt+b end,Out=function(t,b,c,d)t=t/d;return -ct(t-2)+b end,InOut=function(t,b,c,d)t=t/(d/2);if t<1 then return c/2tt+b end;t=t-1;return -c/2*(t*(t-2)-1)+b end}
local b={In=function(t,b,c,d)t=t/d;return cttt+b end,Out=function(t,b,c,d)t=t/d-1;return c(ttt+1)+b end,InOut=function(t,b,c,d)t=t/(d/2);if t<1 then return c/2ttt+b end;t=t-2;return c/2(ttt+2)+b end}
local c={In=function(t,b,c,d)t=t/d;return ctttt+b end,Out=function(t,b,c,d)t=t/d-1;return c*(tttt+1)+b end,InOut=function(t,b,c,d)t=t/(d/2);if t<1 then return c/2tttt+b end;t=t-2;return c/2(tttt+2)+b end}
local d={In=function(t,b,c,d)t=t/d;return cttttt+b end,Out=function(t,b,c,d)t=t/d-1;return c*(ttttt+1)+b end,InOut=function(t,b,c,d)t=t/(d/2);if t<1 then return c/2ttttt+b end;t=t-2;return c/2(ttttt+2)+b end}
local e={In=function(t,b,c,d)return c*(2^(10*(t/d-1)))+b end,Out=function(t,b,c,d)return c*(-(2^(-10t/d))+1)+b end,InOut=function(t,b,c,d)t=t/(d/2);if t<1 then return c/2(2^(10*(t-1)))+b end;t=t-1;return c/2*(-(2^(-10t))+2)+b end}
local f={In=function(t,b,c,d)return -c(math.sqrt(1-(t/d)(t/d))-1)+b end,Out=function(t,b,c,d)t=t/d-1;return cmath.sqrt(1-tt)+b end,InOut=function(t,b,c,d)t=t/(d/2);if t<1 then return -c/2(math.sqrt(1-tt)-1)+b end;t=t-2;return c/2(math.sqrt(1-tt)+1)+b end}
local g={In=function(t,b,c,d)if t==0 then return b end;t=t/d;if t==1 then return b+c end;local p=d.3;local a=c;local s=p/4;t=t-1;return -(a*(2^(10t))math.sin((td-s)(2math.pi)/p))+b end,Out=function(t,b,c,d)if t==0 then return b end;t=t/d;if t==1 then return b+c end;local p=d.3;local a=c;local s=p/4;return(a*(2^(-10t))math.sin((td-s)(2math.pi)/p)+c+b)end,InOut=function(t,b,c,d)if t==0 then return b end;t=t/(d/2);if t==2 then return b+c end;local p=d(.31.5);local a=c;local s=p/4;if t<1 then t=t-1;return -.5(a*(2^(10t))math.sin((td-s)(2math.pi)/p))+b end;t=t-1;return a(2^(-10t))math.sin((td-s)(2math.pi)/p).5+c+b end}
local h={In=function(t,b,c,d,s)if s==nil then s=1.70158 end;t=t/d;return ctt*((s+1)t-s)+b end,Out=function(t,b,c,d,s)if s==nil then s=1.70158 end;t=t/d-1;return c(tt((s+1)t+s)+1)+b end,InOut=function(t,b,c,d,s)if s==nil then s=1.70158 end;t=t/(d/2);s=s1.525;if t<1 then return c/2*(tt((s+1)t-s))+b end;t=t-2;return c/2(tt((s+1)t+s)+2)+b end}
local i={In=function(t,b,c,d)return d-i.Out(d-t,0,d,d)+b;end,Out=function(t,b,c,d)if t==d then return b+c end;return c(-2^(-10t/d)+1)+b;end,InOut=function(t,b,c,d)if t<d/2 then return i.In(t2,0,c,d).5+b;end;return i.Out(t2-d,0,c,d).5+c.5+b;end}
local j={In=function(t,b,c,d)return c-j.Out(d-t,0,c,d)+b end,Out=function(t,b,c,d)t=t/d;if t<(1/2.75)then return c*(7.5625tt)+b elseif t<(2/2.75)then t=t-(1.5/2.75);return c*(7.5625tt+0.75)+b elseif t<(2.5/2.75)then t=t-(2.25/2.75);return c*(7.5625tt+0.9375)+b else t=t-(2.625/2.75);return c*(7.5625tt+0.984375)+b end end,InOut=function(t,b,c,d)if t<d/2 then return j.In(t2,0,c,d)0.5+b end;return j.Out(t2-d,0,c,d)0.5+c0.5+b end}
easing={Linear=function(t,b,c,d)return ct/d+b end,Quad=a,Cubic=b,Quart=c,Quint=d,Sine={In=function(t,b,c,d)return -cmath.cos(t/d(math.pi/2))+c+b end,Out=function(t,b,c,d)return cmath.sin(t/d(math.pi/2))+b end,InOut=function(t,b,c,d)return -c/2*(math.cos(math.pi*t/d)-1)+b end},Expo=e,Circ=f,Elastic=g,Back=h,Bounce=j,Re_Expo=i}
return easing
]]

-- [ORGAN: janitor.lua]
Modules["Rise.src.libs.janitor"] = [[
local Janitor = {}
Janitor.__index = Janitor
function Janitor.new()
	local self = {
		_connections = {}
	}
	return setmetatable(self, Janitor)
end
function Janitor:Add(object)
	local object_type = typeof(object)
	if object_type == "function" or object_type == "thread" or (object_type == "table" and (object.Destroy or object.destroy)) or object_type == "RBXScriptConnection" then
		table.insert(self._connections, object)
		return object
	end
end
function Janitor:Cleanup()
	for i, object in next, self._connections do
		local success, err = pcall(function()
			local object_type = typeof(object)
			if object_type == "function" then
				object()
			elseif object_type == "RBXScriptConnection" then
				object:Disconnect()
			else
				object:Destroy()
			end
		end)
	end
	self._connections = {}
end
function Janitor:Destroy()
	self:Cleanup()
	setmetatable(self, nil)
end
return Janitor
]]

-- [ORGAN: mouse.lua]
Modules["Rise.src.libs.mouse"] = [[
local Mouse = {}
Mouse.hit = CFrame.new()
Mouse.target = nil
Mouse.down = false
local input_service = game:GetService("UserInputService")
local mouse_object = game:GetService("Players").LocalPlayer:GetMouse()
input_service.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
Mouse.down = true
end
end)
input_service.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
Mouse.down = false
end
end)
game:GetService("RunService").RenderStepped:Connect(function()
Mouse.hit = mouse_object.Hit
Mouse.target = mouse_object.Target
end)
return Mouse
]]

-- [ORGAN: Button.lua]
Modules["Rise.src.Button"] = [[
local Rise = getfenv().Rise
local Mouse = Rise.mouse
local Janitor = Rise.janitor
local Easing = Rise.easing
local Button = {}
Button.__index = Button
function Button.new(section, options)
options = options or {}
local name = options.Name or "Button"
local func = options.Func
local clean = Janitor.new()
local main = section.tab.main
local holder = main.holder
local list = holder.list
local button = Instance.new("TextButton")
button.Name = name
button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
button.Size = UDim2.new(1, -20, 0, 25)
button.AutoButtonColor = false
button.Font = Enum.Font.GothamSemibold
button.Text = name
button.TextColor3 = Color3.fromRGB(225, 225, 225)
button.TextSize = 14
button.LayoutOrder = #section.elements + 1
local ui_corner = Instance.new("UICorner")
ui_corner.CornerRadius = UDim.new(0, 4)
ui_corner.Parent = button
local self = {
flags = {
hover = false
},
clean = clean,
Instance = button
}
clean:Add(button.MouseEnter:Connect(function()
self.flags.hover = true
Easing.new(button, .2, {
BackgroundColor3 = Color3.fromRGB(60, 60, 60)
}):Play()
end))
clean:Add(button.MouseLeave:Connect(function()
self.flags.hover = false
Easing.new(button, .2, {
BackgroundColor3 = Color3.fromRGB(50, 50, 50)
}):Play()
end))
clean:Add(button.MouseButton1Click:Connect(function()
pcall(func)
main:Update()
end))
clean:Add(function()
button:Destroy()
end)
return setmetatable(self, Button)
end
function Button:Remove()
self.clean:Cleanup()
end
function Button:AddTooltip(text)
local tooltip = Rise.Tooltip.new(self, text)
self.clean:Add(tooltip)
end
return Button
]]

-- [ORGAN: Checkbox.lua]
Modules["Rise.src.Checkbox"] = [[
local Rise = getfenv().Rise
local Mouse = Rise.mouse
local Janitor = Rise.janitor
local Easing = Rise.easing
local Checkbox = {}
Checkbox.__index = Checkbox
function Checkbox.new(section, options)
options = options or {}
local name = options.Name or "Checkbox"
local callback = options.Callback
local default = options.Default
local clean = Janitor.new()
local main = section.tab.main
local holder = main.holder
local list = holder.list
local checkbox = Instance.new("TextButton")
checkbox.Name = name
checkbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
checkbox.Size = UDim2.new(1, -20, 0, 25)
checkbox.AutoButtonColor = false
checkbox.Font = Enum.Font.GothamSemibold
checkbox.Text = ""
checkbox.TextColor3 = Color3.fromRGB(225, 225, 225)
checkbox.TextSize = 14
checkbox.LayoutOrder = #section.elements + 1
local ui_corner = Instance.new("UICorner")
ui_corner.CornerRadius = UDim.new(0, 4)
ui_corner.Parent = checkbox
local checkbox_name = Instance.new("TextLabel")
checkbox_name.Name = "Name"
checkbox_name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
checkbox_name.BackgroundTransparency = 1
checkbox_name.Position = UDim2.fromOffset(10, 0)
checkbox_name.Size = UDim2.fromOffset(0, 25)
checkbox_name.SizeConstraint = Enum.SizeConstraint.RelativeYY
checkbox_name.Font = Enum.Font.GothamSemibold
checkbox_name.Text = name
checkbox_name.TextColor3 = Color3.fromRGB(225, 225, 225)
checkbox_name.TextSize = 14
checkbox_name.TextXAlignment = Enum.TextXAlignment.Left
checkbox_name.Parent = checkbox
local checkbox_button = Instance.new("TextButton")
checkbox_button.Name = "Checkbox"
checkbox_button.AnchorPoint = Vector2.new(1, 0.5)
checkbox_button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
checkbox_button.Position = UDim2.new(1, -5, 0.5, 0)
checkbox_button.Size = UDim2.new(0, 15, 0, 15)
checkbox_button.AutoButtonColor = false
checkbox_button.Font = Enum.Font.SourceSans
checkbox_button.Text = ""
checkbox_button.TextColor3 = Color3.fromRGB(30, 30, 30)
checkbox_button.TextSize = 14
checkbox_button.Parent = checkbox
local checkbox_button_corner = Instance.new("UICorner")
checkbox_button_corner.CornerRadius = UDim.new(0, 3)
checkbox_button_corner.Parent = checkbox_button
local checkbox_button_inner = Instance.new("Frame")
checkbox_button_inner.Name = "Inner"
checkbox_button_inner.AnchorPoint = Vector2.new(0.5, 0.5)
checkbox_button_inner.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
checkbox_button_inner.BorderSizePixel = 0
checkbox_button_inner.Position = UDim2.fromScale(0.5, 0.5)
checkbox_button_inner.Parent = checkbox_button
local checkbox_button_inner_corner = Instance.new("UICorner")
checkbox_button_inner_corner.CornerRadius = UDim.new(0, 2)
checkbox_button_inner_corner.Parent = checkbox_button_inner
local self = {
flags = {
hover = false,
value = default or false
},
clean = clean,
Instance = checkbox
}
function self:SetValue(bool)
self.flags.value = bool
checkbox_button_inner:TweenSize(self.flags.value and UDim2.fromScale(1, 1) or UDim2.fromScale(0, 0), "Out", "Quad", .2, true)
pcall(callback, self.flags.value)
end
self:SetValue(self.flags.value)
clean:Add(checkbox.MouseEnter:Connect(function()
self.flags.hover = true
Easing.new(checkbox, .2, {
BackgroundColor3 = Color3.fromRGB(60, 60, 60)
}):Play()
end))
clean:Add(checkbox.MouseLeave:Connect(function()
self.flags.hover = false
Easing.new(checkbox, .2, {
BackgroundColor3 = Color3.fromRGB(50, 50, 50)
}):Play()
end))
clean:Add(checkbox.MouseButton1Click:Connect(function()
self:SetValue(not self.flags.value)
main:Update()
end))
clean:Add(function()
checkbox:Destroy()
end)
return setmetatable(self, Checkbox)
end
function Checkbox:Remove()
self.clean:Cleanup()
end
function Checkbox:AddTooltip(text)
local tooltip = Rise.Tooltip.new(self, text)
self.clean:Add(tooltip)
end
return Checkbox
]]

-- [ORGAN: Colorpicker.lua]
Modules["Rise.src.Colorpicker"] = [[
local Rise = getfenv().Rise
local Mouse = Rise.mouse
local Janitor = Rise.janitor
local Easing = Rise.easing
local Colorpicker = {}
Colorpicker.__index = Colorpicker
function Colorpicker.new(section, options)
options = options or {}
local name = options.Name or "Colorpicker"
local default = options.Default or Color3.new(1, 1, 1)
local callback = options.Callback
local clean = Janitor.new()
local main = section.tab.main
local holder = main.holder
local list = holder.list
local colorpicker = Instance.new("TextButton")
colorpicker.Name = name
colorpicker.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
colorpicker.Size = UDim2.new(1, -20, 0, 25)
colorpicker.AutoButtonColor = false
colorpicker.Font = Enum.Font.GothamSemibold
colorpicker.Text = ""
colorpicker.TextColor3 = Color3.fromRGB(225, 225, 225)
colorpicker.TextSize = 14
colorpicker.LayoutOrder = #section.elements + 1
local ui_corner = Instance.new("UICorner")
ui_corner.CornerRadius = UDim.new(0, 4)
ui_corner.Parent = colorpicker
local colorpicker_name = Instance.new("TextLabel")
colorpicker_name.Name = "Name"
colorpicker_name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
colorpicker_name.BackgroundTransparency = 1
colorpicker_name.Position = UDim2.fromOffset(10, 0)
colorpicker_name.Size = UDim2.fromOffset(0, 25)
colorpicker_name.SizeConstraint = Enum.SizeConstraint.RelativeYY
colorpicker_name.Font = Enum.Font.GothamSemibold
colorpicker_name.Text = name
colorpicker_name.TextColor3 = Color3.fromRGB(225, 225, 225)
colorpicker_name.TextSize = 14
colorpicker_name.TextXAlignment = Enum.TextXAlignment.Left
colorpicker_name.Parent = colorpicker
local colorpicker_button = Instance.new("TextButton")
colorpicker_button.Name = "Colorpicker"
colorpicker_button.AnchorPoint = Vector2.new(1, 0.5)
colorpicker_button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
colorpicker_button.Position = UDim2.new(1, -5, 0.5, 0)
colorpicker_button.Size = UDim2.new(0, 15, 0, 15)
colorpicker_button.AutoButtonColor = false
colorpicker_button.Font = Enum.Font.SourceSans
colorpicker_button.Text = ""
colorpicker_button.TextColor3 = Color3.fromRGB(30, 30, 30)
colorpicker_button.TextSize = 14
colorpicker_button.Parent = colorpicker
local colorpicker_button_corner = Instance.new("UICorner")
colorpicker_button_corner.CornerRadius = UDim.new(0, 3)
colorpicker_button_corner.Parent = colorpicker_button
local colorpicker_button_inner = Instance.new("Frame")
colorpicker_button_inner.Name = "Inner"
colorpicker_button_inner.BackgroundColor3 = default
colorpicker_button_inner.BorderSizePixel = 0
colorpicker_button_inner.Size = UDim2.fromScale(1, 1)
colorpicker_button_inner.Parent = colorpicker_button
local colorpicker_button_inner_corner = Instance.new("UICorner")
colorpicker_button_inner_corner.CornerRadius = UDim.new(0, 2)
colorpicker_button_inner_corner.Parent = colorpicker_button_inner
local self = {
flags = {
hover = false,
value = default,
open = false
},
clean = clean,
Instance = colorpicker
}
function self:SetValue(color)
self.flags.value = color
colorpicker_button_inner.BackgroundColor3 = color
pcall(callback, color)
end
self:SetValue(self.flags.value)
function self:Toggle()
self.flags.open = not self.flags.open
main:TogglePicker(self)
end
clean:Add(colorpicker.MouseEnter:Connect(function()
self.flags.hover = true
Easing.new(colorpicker, .2, {
BackgroundColor3 = Color3.fromRGB(60, 60, 60)
}):Play()
end))
clean:Add(colorpicker.MouseLeave:Connect(function()
self.flags.hover = false
Easing.new(colorpicker, .2, {
BackgroundColor3 = Color3.fromRGB(50, 50, 50)
}):Play()
end))
clean:Add(colorpicker.MouseButton1Click:Connect(function()
self:Toggle()
end))
clean:Add(function()
colorpicker:Destroy()
end)
return setmetatable(self, Colorpicker)
end
function Colorpicker:Remove()
self.clean:Cleanup()
end
function Colorpicker:AddTooltip(text)
local tooltip = Rise.Tooltip.new(self, text)
self.clean:Add(tooltip)
end
return Colorpicker
]]

-- [ORGAN: Dropdown.lua]
Modules["Rise.src.Dropdown"] = [[
local Rise = getfenv().Rise
local Mouse = Rise.mouse
local Janitor = Rise.janitor
local Easing = Rise.easing
local Dropdown = {}
Dropdown.__index = Dropdown
function Dropdown.new(section, options)
options = options or {}
local name = options.Name or "Dropdown"
local default = options.Default or options.Options
local callback = options.Callback
local clean = Janitor.new()
local main = section.tab.main
local holder = main.holder
local list = holder.list
local dropdown = Instance.new("TextButton")
dropdown.Name = name
dropdown.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
dropdown.Size = UDim2.new(1, -20, 0, 25)
dropdown.AutoButtonColor = false
dropdown.Font = Enum.Font.GothamSemibold
dropdown.Text = ""
dropdown.TextColor3 = Color3.fromRGB(225, 225, 225)
dropdown.TextSize = 14
dropdown.LayoutOrder = #section.elements + 1
local ui_corner = Instance.new("UICorner")
ui_corner.CornerRadius = UDim.new(0, 4)
ui_corner.Parent = dropdown
local dropdown_name = Instance.new("TextLabel")
dropdown_name.Name = "Name"
dropdown_name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dropdown_name.BackgroundTransparency = 1
dropdown_name.Position = UDim2.fromOffset(10, 0)
dropdown_name.Size = UDim2.fromOffset(0, 25)
dropdown_name.SizeConstraint = Enum.SizeConstraint.RelativeYY
dropdown_name.Font = Enum.Font.GothamSemibold
dropdown_name.Text = name
dropdown_name.TextColor3 = Color3.fromRGB(225, 225, 225)
dropdown_name.TextSize = 14
dropdown_name.TextXAlignment = Enum.TextXAlignment.Left
dropdown_name.Parent = dropdown
local dropdown_button = Instance.new("TextButton")
dropdown_button.Name = "Dropdown"
dropdown_button.AnchorPoint = Vector2.new(1, 0.5)
dropdown_button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
dropdown_button.Position = UDim2.new(1, -5, 0.5, 0)
dropdown_button.Size = UDim2.new(0, 100, 0, 15)
dropdown_button.AutoButtonColor = false
dropdown_button.Font = Enum.Font.GothamSemibold
dropdown_button.Text = ""
dropdown_button.TextColor3 = Color3.fromRGB(225, 225, 225)
dropdown_button.TextSize = 14
dropdown_button.Parent = dropdown
local dropdown_button_name = Instance.new("TextLabel")
dropdown_button_name.Name = "Name"
dropdown_button_name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dropdown_button_name.BackgroundTransparency = 1
dropdown_button_name.Position = UDim2.fromOffset(5, 0)
dropdown_button_name.Size = UDim2.new(1, -20, 1, 0)
dropdown_button_name.Font = Enum.Font.GothamSemibold
dropdown_button_name.Text = default
dropdown_button_name.TextColor3 = Color3.fromRGB(200, 200, 200)
dropdown_button_name.TextSize = 14
dropdown_button_name.TextXAlignment = Enum.TextXAlignment.Left
dropdown_button_name.Parent = dropdown_button
local dropdown_button_corner = Instance.new("UICorner")
dropdown_button_corner.CornerRadius = UDim.new(0, 3)
dropdown_button_corner.Parent = dropdown_button
local dropdown_button_arrow = Instance.new("ImageLabel")
dropdown_button_arrow.Name = "Arrow"
dropdown_button_arrow.AnchorPoint = Vector2.new(1, 0.5)
dropdown_button_arrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dropdown_button_arrow.BackgroundTransparency = 1
dropdown_button_arrow.Image = "rbxassetid://6031069257"
dropdown_button_arrow.ImageColor3 = Color3.fromRGB(200, 200, 200)
dropdown_button_arrow.Position = UDim2.new(1, -5, 0.5, 0)
dropdown_button_arrow.Size = UDim2.new(0, 10, 0, 10)
dropdown_button_arrow.Parent = dropdown_button
local self = {
flags = {
hover = false,
value = default,
open = false
},
clean = clean,
Instance = dropdown,
Value = default
}
function self:SetValue(val)
self.flags.value = val
self.Value = val
dropdown_button_name.Text = val
pcall(callback, val)
end
self:SetValue(self.flags.value)
function self:Toggle()
self.flags.open = not self.flags.open
main:ToggleDropdown(self)
end
clean:Add(dropdown.MouseEnter:Connect(function()
self.flags.hover = true
Easing.new(dropdown, .2, {
BackgroundColor3 = Color3.fromRGB(60, 60, 60)
}):Play()
end))
clean:Add(dropdown.MouseLeave:Connect(function()
self.flags.hover = false
Easing.new(dropdown, .2, {
BackgroundColor3 = Color3.fromRGB(50, 50, 50)
}):Play()
end))
clean:Add(dropdown.MouseButton1Click:Connect(function()
self:Toggle()
end))
clean:Add(function()
dropdown:Destroy()
end)
return setmetatable(self, Dropdown)
end
function Dropdown:Remove()
self.clean:Cleanup()
end
function Dropdown:AddTooltip(text)
local tooltip = Rise.Tooltip.new(self, text)
self.clean:Add(tooltip)
end
return Dropdown
]]

-- [ORGAN: Keybind.lua]
Modules["Rise.src.Keybind"] = [[
local Rise = getfenv().Rise
local Mouse = Rise.mouse
local Janitor = Rise.janitor
local Easing = Rise.easing
local InputService = game:GetService("UserInputService")
local Keybind = {}
Keybind.__index = Keybind
function Keybind.new(section, options)
options = options or {}
local name = options.Name or "Keybind"
local default = options.Default or "..."
local callback = options.Callback
local clean = Janitor.new()
local main = section.tab.main
local holder = main.holder
local list = holder.list
local keybind = Instance.new("TextButton")
keybind.Name = name
keybind.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
keybind.Size = UDim2.new(1, -20, 0, 25)
keybind.AutoButtonColor = false
keybind.Font = Enum.Font.GothamSemibold
keybind.Text = ""
keybind.TextColor3 = Color3.fromRGB(225, 225, 225)
keybind.TextSize = 14
keybind.LayoutOrder = #section.elements + 1
local ui_corner = Instance.new("UICorner")
ui_corner.CornerRadius = UDim.new(0, 4)
ui_corner.Parent = keybind
local keybind_name = Instance.new("TextLabel")
keybind_name.Name = "Name"
keybind_name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
keybind_name.BackgroundTransparency = 1
keybind_name.Position = UDim2.fromOffset(10, 0)
keybind_name.Size = UDim2.fromOffset(0, 25)
keybind_name.SizeConstraint = Enum.SizeConstraint.RelativeYY
keybind_name.Font = Enum.Font.GothamSemibold
keybind_name.Text = name
keybind_name.TextColor3 = Color3.fromRGB(225, 225, 225)
keybind_name.TextSize = 14
keybind_name.TextXAlignment = Enum.TextXAlignment.Left
keybind_name.Parent = keybind
local keybind_button = Instance.new("TextButton")
keybind_button.Name = "Keybind"
keybind_button.AnchorPoint = Vector2.new(1, 0.5)
keybind_button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
keybind_button.Position = UDim2.new(1, -5, 0.5, 0)
keybind_button.Size = UDim2.new(0, 100, 0, 15)
keybind_button.AutoButtonColor = false
keybind_button.Font = Enum.Font.GothamSemibold
keybind_button.Text = "[" .. default .. "]"
keybind_button.TextColor3 = Color3.fromRGB(225, 225, 225)
keybind_button.TextSize = 14
keybind_button.Parent = keybind
local keybind_button_corner = Instance.new("UICorner")
keybind_button_corner.CornerRadius = UDim.new(0, 3)
keybind_button_corner.Parent = keybind_button
local self = {
flags = {
hover = false,
value = default,
listening = false
},
clean = clean,
Instance = keybind
}
function self:SetValue(key)
self.flags.value = key
keybind_button.Text = "[" .. key .. "]"
pcall(callback, key)
end
self:SetValue(self.flags.value)
clean:Add(keybind.MouseEnter:Connect(function()
self.flags.hover = true
Easing.new(keybind, .2, {
BackgroundColor3 = Color3.fromRGB(60, 60, 60)
}):Play()
end))
clean:Add(keybind.MouseLeave:Connect(function()
self.flags.hover = false
Easing.new(keybind, .2, {
BackgroundColor3 = Color3.fromRGB(50, 50, 50)
}):Play()
end))
clean:Add(keybind_button.MouseButton1Click:Connect(function()
self.flags.listening = true
keybind_button.Text = "[...]"
local connection
connection = InputService.InputBegan:Connect(function(input, game_processed)
if game_processed then return end
if input.UserInputType == Enum.UserInputType.Keyboard then
local key = input.KeyCode.Name
self:SetValue(key)
elseif input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
local key = "Mouse" .. input.UserInputType.Name:sub(12)
self:SetValue(key)
end
self.flags.listening = false
connection:Disconnect()
end)
end))
clean:Add(InputService.InputBegan:Connect(function(input, game_processed)
if game_processed or self.flags.listening then return end
local key
if input.UserInputType == Enum.UserInputType.Keyboard then
key = input.KeyCode.Name
elseif input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
key = "Mouse" .. input.UserInputType.Name:sub(12)
end
if key == self.flags.value then
pcall(callback, key)
end
end))
clean:Add(function()
keybind:Destroy()
end)
return setmetatable(self, Keybind)
end
function Keybind:Remove()
self.clean:Cleanup()
end
function Keybind:AddTooltip(text)
local tooltip = Rise.Tooltip.new(self, text)
self.clean:Add(tooltip)
end
return Keybind
]]

-- [ORGAN: Label.lua]
Modules["Rise.src.Label"] = [[
local Rise = getfenv().Rise
local Mouse = Rise.mouse
local Janitor = Rise.janitor
local Easing = Rise.easing
local Label = {}
Label.__index = Label
function Label.new(section, options)
options = options or {}
local name = options.Name or "Label"
local centered = options.Centered
local clean = Janitor.new()
local main = section.tab.main
local holder = main.holder
local list = holder.list
local label = Instance.new("TextLabel")
label.Name = name
label.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
label.Size = UDim2.new(1, -20, 0, 25)
label.Font = Enum.Font.GothamSemibold
label.Text = name
label.TextColor3 = Color3.fromRGB(225, 225, 225)
label.TextSize = 14
label.LayoutOrder = #section.elements + 1
label.TextXAlignment = centered and Enum.TextXAlignment.Center or Enum.TextXAlignment.Left
local ui_padding = Instance.new("UIPadding")
ui_padding.PaddingLeft = UDim.new(0, 10)
ui_padding.PaddingRight = UDim.new(0, 10)
ui_padding.Parent = label
local self = {
flags = {
hover = false
},
clean = clean,
Instance = label
}
clean:Add(label.MouseEnter:Connect(function()
self.flags.hover = true
Easing.new(label, .2, {
BackgroundColor3 = Color3.fromRGB(60, 60, 60)
}):Play()
end))
clean:Add(label.MouseLeave:Connect(function()
self.flags.hover = false
Easing.new(label, .2, {
BackgroundColor3 = Color3.fromRGB(50, 50, 50)
}):Play()
end))
clean:Add(function()
label:Destroy()
end)
return setmetatable(self, Label)
end
function Label:Remove()
self.clean:Cleanup()
end
function Label:AddTooltip(text)
local tooltip = Rise.Tooltip.new(self, text)
self.clean:Add(tooltip)
end
return Label
]]

-- [ORGAN: Notify.lua]
Modules["Rise.src.Notify"] = [[
local Rise = getfenv().Rise
local Mouse = Rise.mouse
local Janitor = Rise.janitor
local Easing = Rise.easing
local Notify = {}
Notify.__index = Notify
local holder = Rise.GetFolder("Notifications", Rise.GetFolder("Rise"))
local list = Instance.new("UIListLayout")
list.FillDirection = Enum.FillDirection.Vertical
list.HorizontalAlignment = Enum.HorizontalAlignment.Right
list.SortOrder = Enum.SortOrder.LayoutOrder
list.Padding = UDim.new(0, 10)
list.Parent = holder
holder.AnchorPoint = Vector2.new(1, 1)
holder.Position = UDim2.new(1, -10, 1, -10)
holder.Size = UDim2.fromScale(0.2, 1)
holder.BackgroundTransparency = 1
function Notify.new(options)
options = options or {}
local title = options.Name or "Rise"
local text = options.Text or "Notification"
local duration = options.Duration or 5
local clean = Janitor.new()
local main = section.tab.main
local holder = main.holder
local list = holder.list
local notification = Instance.new("Frame")
notification.Name = title
notification.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
notification.Size = UDim2.new(1, 0, 0, 60)
notification.LayoutOrder = #holder:GetChildren()
local ui_corner = Instance.new("UICorner")
ui_corner.CornerRadius = UDim.new(0, 4)
ui_corner.Parent = notification
local ui_padding = Instance.new("UIPadding")
ui_padding.PaddingLeft = UDim.new(0, 10)
ui_padding.PaddingRight = UDim.new(0, 10)
ui_padding.Parent = notification
local left = Instance.new("Frame")
left.Name = "Left"
left.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
left.BorderSizePixel = 0
left.Size = UDim2.new(0, 2, 0.7, 0)
left.Parent = notification
local left_ui_corner = Instance.new("UICorner")
left_ui_corner.Parent = left
local title_label = Instance.new("TextLabel")
title_label.Name = "Title"
title_label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title_label.BackgroundTransparency = 1
title_label.Position = UDim2.new(0, 22, 0, 10)
title_label.Size = UDim2.new(1, -32, 0, 15)
title_label.Font = Enum.Font.GothamSemibold
title_label.Text = title
title_label.TextColor3 = Color3.fromRGB(225, 225, 225)
title_label.TextSize = 14
title_label.TextXAlignment = Enum.TextXAlignment.Left
title_label.Parent = notification
local text_label = Instance.new("TextLabel")
text_label.Name = "Text"
text_label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
text_label.BackgroundTransparency = 1
text_label.Position = UDim2.new(0, 22, 0, 30)
text_label.Size = UDim2.new(1, -32, 0, 15)
text_label.Font = Enum.Font.Gotham
text_label.Text = text
text_label.TextColor3 = Color3.fromRGB(200, 200, 200)
text_label.TextSize = 14
text_label.TextXAlignment = Enum.TextXAlignment.Left
text_label.Parent = notification
local self = {
flags = {},
clean = clean,
Instance = notification
}
notification.Parent = holder
wait(duration)
Easing.new(notification, .2, {
Size = UDim2.new(1, 0, 0, 0)
}):Play()
wait(.2)
self:Remove()
return setmetatable(self, Notify)
end
function Notify:Remove()
self.clean:Cleanup()
end
return Notify
]]

-- [ORGAN: Section.lua]
Modules["Rise.src.Section"] = [[
local Rise = getfenv().Rise
local Mouse = Rise.mouse
local Janitor = Rise.janitor
local Easing = Rise.easing
local Section = {}
Section.__index = Section
function Section.new(tab, options)
options = options or {}
local name = options.Name or "Section"
local clean = Janitor.new()
local main = tab.main
local holder = main.holder
local list = holder.list
local section = Instance.new("Frame")
section.Name = name
section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
section.BackgroundTransparency = 1
section.Size = UDim2.new(1, 0, 0, 0)
section.LayoutOrder = #tab.sections + 1
section.ClipsDescendants = true
local list_layout = Instance.new("UIListLayout")
list_layout.SortOrder = Enum.SortOrder.LayoutOrder
list_layout.Padding = UDim.new(0, 5)
list_layout.Parent = section
local section_name = Instance.new("TextLabel")
section_name.Name = "Name"
section_name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
section_name.BackgroundTransparency = 1
section_name.Position = UDim2.fromOffset(10, 0)
section_name.Size = UDim2.new(1, -20, 0, 25)
section_name.Font = Enum.Font.GothamSemibold
section_name.Text = name
section_name.TextColor3 = Color3.fromRGB(225, 225, 225)
section_name.TextSize = 14
section_name.TextXAlignment = Enum.TextXAlignment.Left
section_name.LayoutOrder = 0
section_name.Parent = section
local self = {
flags = {
hover = false
},
clean = clean,
Instance = section,
tab = tab,
options = options,
elements = {}
}
function self:AddElement(element)
table.insert(self.elements, element)
self:Update()
return element
end
function self:Update()
section.Size = UDim2.new(1, 0, 0, 30 + #self.elements * 30)
end
clean:Add(function()
section:Destroy()
end)
self.CreateButton = function(options)
return self:AddElement(Rise.Button.new(self, options))
end
self.CreateCheckbox = function(options)
return self:AddElement(Rise.Checkbox.new(self, options))
end
self.CreateColorpicker = function(options)
return self:AddElement(Rise.Colorpicker.new(self, options))
end
self.CreateDropdown = function(options)
return self:AddElement(Rise.Dropdown.new(self, options))
end
self.CreateKeybind = function(options)
return self:AddElement(Rise.Keybind.new(self, options))
end
self.CreateLabel = function(options)
return self:AddElement(Rise.Label.new(self, options))
end
self.CreateSlider = function(options)
return self:AddElement(Rise.Slider.new(self, options))
end
self.CreateTextbox = function(options)
return self:AddElement(Rise.Textbox.new(self, options))
end
self:Update()
return setmetatable(self, Section)
end
function Section:Remove()
self.clean:Cleanup()
end
return Section
]]

-- [ORGAN: Slider.lua]
Modules["Rise.src.Slider"] = [[
local Rise = getfenv().Rise
local Mouse = Rise.mouse
local Janitor = Rise.janitor
local Easing = Rise.easing
local Slider = {}
Slider.__index = Slider
function Slider.new(section, options)
options = options or {}
local name = options.Name or "Slider"
local o = options.Options or {}
local min = o.Min or 0
local max = o.Max or 100
local def = o.Default or min
local callback = options.Callback
local clean = Janitor.new()
local main = section.tab.main
local holder = main.holder
local list = holder.list
local slider = Instance.new("Frame")
slider.Name = name
slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
slider.Size = UDim2.new(1, -20, 0, 35)
slider.LayoutOrder = #section.elements + 1
local ui_corner = Instance.new("UICorner")
ui_corner.CornerRadius = UDim.new(0, 4)
ui_corner.Parent = slider
local slider_name = Instance.new("TextLabel")
slider_name.Name = "Name"
slider_name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
slider_name.BackgroundTransparency = 1
slider_name.Position = UDim2.fromOffset(10, 5)
slider_name.Size = UDim2.new(0.5, 0, 0, 15)
slider_name.Font = Enum.Font.GothamSemibold
slider_name.Text = name
slider_name.TextColor3 = Color3.fromRGB(225, 225, 225)
slider_name.TextSize = 14
slider_name.TextXAlignment = Enum.TextXAlignment.Left
slider_name.Parent = slider
local slider_value = Instance.new("TextLabel")
slider_value.Name = "Value"
slider_value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
slider_value.BackgroundTransparency = 1
slider_value.Position = UDim2.new(1, -10, 0, 5)
slider_value.Size = UDim2.new(0.5, 0, 0, 15)
slider_value.Font = Enum.Font.Gotham
slider_value.Text = def
slider_value.TextColor3 = Color3.fromRGB(200, 200, 200)
slider_value.TextSize = 14
slider_value.TextXAlignment = Enum.TextXAlignment.Right
slider_value.Parent = slider
local slider_holder = Instance.new("Frame")
slider_holder.Name = "Holder"
slider_holder.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
slider_holder.Position = UDim2.new(0.5, 0, 0, 25)
slider_holder.Size = UDim2.new(1, -20, 0, 5)
slider_holder.AnchorPoint = Vector2.new(0.5, 0)
slider_holder.Parent = slider
local slider_holder_corner = Instance.new("UICorner")
slider_holder_corner.Parent = slider_holder
local slider_bar = Instance.new("Frame")
slider_bar.Name = "Bar"
slider_bar.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
slider_bar.BorderSizePixel = 0
slider_bar.Parent = slider_holder
local slider_bar_corner = Instance.new("UICorner")
slider_bar_corner.Parent = slider_bar
local self = {
flags = {hover=false,value=def,sliding=false},
clean = clean,
Instance = slider
}
function self:SetValue(val, no_callback)
val = math.clamp(val, min, max)
self.flags.value = val
slider_value.Text = val
local percentage = (val - min) / (max - min)
slider_bar.Size = UDim2.new(percentage, 0, 1, 0)
if not no_callback then
pcall(callback, val)
end
end
self:SetValue(self.flags.value, true)
local function slide(input)
local pos = input.Position.X - slider_holder.AbsolutePosition.X
local percentage = math.clamp(pos / slider_holder.AbsoluteSize.X, 0, 1)
local val = math.floor(min + (max - min) * percentage)
self:SetValue(val)
end
clean:Add(slider_holder.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
self.flags.sliding = true
slide(input)
end
end))
clean:Add(slider_holder.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
self.flags.sliding = false
end
end))
clean:Add(game:GetService("UserInputService").InputChanged:Connect(function(input)
if self.flags.sliding and input.UserInputType == Enum.UserInputType.MouseMovement then
slide(input)
end
end))
clean:Add(function()
slider:Destroy()
end)
return setmetatable(self, Slider)
end
function Slider:Remove()
self.clean:Cleanup()
end
return Slider
]]

-- [ORGAN: Tab.lua]
Modules["Rise.src.Tab"] = [[
local Rise = getfenv().Rise
local Mouse = Rise.mouse
local Janitor = Rise.janitor
local Easing = Rise.easing
local Tab = {}
Tab.__index = Tab
function Tab.new(name, version)
local clean = Janitor.new()
local tab_button = Instance.new("TextButton")
tab_button.Name = name
tab_button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
tab_button.Size = UDim2.new(1, 0, 0, 30)
tab_button.AutoButtonColor = false
tab_button.Font = Enum.Font.GothamSemibold
tab_button.Text = name
tab_button.TextColor3 = Color3.fromRGB(225, 225, 225)
tab_button.TextSize = 14
local main_frame = Instance.new("Frame")
main_frame.Name = name
main_frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main_frame.BorderSizePixel = 0
main_frame.Position = UDim2.fromScale(0.5, 0.5)
main_frame.Size = UDim2.new(0, 500, 0, 400)
main_frame.AnchorPoint = Vector2.new(0.5, 0.5)
main_frame.ClipsDescendants = true
local holder = Instance.new("ScrollingFrame", main_frame)
holder.Size = UDim2.new(1, 0, 1, -40)
holder.Position = UDim2.new(0, 0, 0, 40)
holder.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
holder.BorderSizePixel = 0
holder.CanvasSize = UDim2.new(0, 0, 0, 0)
holder.ScrollBarThickness = 4
local list = Instance.new("UIListLayout", holder)
list.SortOrder = Enum.SortOrder.LayoutOrder
list.Padding = UDim.new(0, 10)
local self = {
flags = {},
clean = clean,
Instance = main_frame,
button = tab_button,
holder = holder,
sections = {}
}
function self:Update()
local size = 0
for _,s in pairs(self.sections) do
size = size + s.Instance.AbsoluteSize.Y + list.Padding.Offset
end
holder.CanvasSize = UDim2.fromOffset(0, size)
end
function self:CreateSection(name)
local section = Rise.Section.new(self, {Name = name})
section.Instance.Parent = holder
table.insert(self.sections, section)
self:Update()
return section
end
clean:Add(function()
main_frame:Destroy()
tab_button:Destroy()
end)
return setmetatable(self, Tab)
end
return Tab
]]

-- [ORGAN: Textbox.lua]
Modules["Rise.src.Textbox"] = [[
local Rise = getfenv().Rise
local Mouse = Rise.mouse
local Janitor = Rise.janitor
local Easing = Rise.easing
local Textbox = {}
Textbox.__index = Textbox
function Textbox.new(section, options)
options = options or {}
local name = options.Name or "Textbox"
local default = options.Default or ""
local callback = options.Callback
local clean = Janitor.new()
local main = section.tab.main
local holder = main.holder
local list = holder.list
local textbox_frame = Instance.new("Frame")
textbox_frame.Name = name
textbox_frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textbox_frame.Size = UDim2.new(1, -20, 0, 25)
textbox_frame.LayoutOrder = #section.elements + 1
local ui_corner = Instance.new("UICorner")
ui_corner.CornerRadius = UDim.new(0, 4)
ui_corner.Parent = textbox_frame
local textbox_name = Instance.new("TextLabel")
textbox_name.Name = "Name"
textbox_name.BackgroundTransparency = 1
textbox_name.Position = UDim2.fromOffset(10, 0)
textbox_name.Size = UDim2.new(0.5, 0, 1, 0)
textbox_name.Font = Enum.Font.GothamSemibold
textbox_name.Text = name
textbox_name.TextColor3 = Color3.fromRGB(225, 225, 225)
textbox_name.TextSize = 14
textbox_name.TextXAlignment = Enum.TextXAlignment.Left
textbox_name.Parent = textbox_frame
local textbox_input = Instance.new("TextBox")
textbox_input.Name = "Input"
textbox_input.AnchorPoint = Vector2.new(1, 0.5)
textbox_input.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
textbox_input.Position = UDim2.new(1, -5, 0.5, 0)
textbox_input.Size = UDim2.new(0, 100, 0, 15)
textbox_input.Font = Enum.Font.Gotham
textbox_input.Text = default
textbox_input.TextColor3 = Color3.fromRGB(200, 200, 200)
textbox_input.TextSize = 14
textbox_input.ClearTextOnFocus = false
textbox_input.Parent = textbox_frame
local textbox_input_corner = Instance.new("UICorner")
textbox_input_corner.CornerRadius = UDim.new(0, 3)
textbox_input_corner.Parent = textbox_input
local self = {
flags = {
hover = false,
value = default
},
clean = clean,
Instance = textbox_frame
}
function self:SetValue(txt)
self.flags.value = txt
textbox_input.Text = txt
pcall(callback, txt)
end
self:SetValue(self.flags.value)
clean:Add(textbox_frame.MouseEnter:Connect(function()
self.flags.hover = true
Easing.new(textbox_frame, .2, {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
end))
clean:Add(textbox_frame.MouseLeave:Connect(function()
self.flags.hover = false
Easing.new(textbox_frame, .2, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
end))
clean:Add(textbox_input.FocusLost:Connect(function(enter)
if enter then
self:SetValue(textbox_input.Text)
main:Update()
end
end))
clean:Add(function()
textbox_frame:Destroy()
end)
return setmetatable(self, Textbox)
end
function Textbox:Remove()
self.clean:Cleanup()
end
return Textbox
]]

-- [THE HEART CHAMBER (DO NOT MODIFY)]
local function require(path)
    local path_parts = {}
    for part in path:gmatch("[^%.]+") do
        table.insert(path_parts, part)
    end
    if path_parts == "script" and path_parts == "Parent" then
        table.remove(path_parts, 1); table.remove(path_parts, 1)
    end
    local final_path = "Rise." .. table.concat(path_parts, ".")
    if Modules[final_path] then
        local success, module = pcall(loadstring(Modules[final_path]))
        if success and module then
            return module()
        else
            error("Unified Module Failure: " .. tostring(module))
        end
    end
    error("Attempted to require non-existent unified module: " .. tostring(path))
end

-- [THE SKELETON: main.lua]
local Rise = {
Version = 3,
Credit = "Linoria"
}
local rise_registry = {}
debug.setregistry(rise_registry)
local rise_folders = {}
function Rise.GetFolder(name, parent)
local name_path = table.concat({parent and parent.Name or "", name}, "/")
if rise_folders[name_path] then
return rise_folders[name_path]
end
local folder = Instance.new("Folder")
folder.Name = name_path
folder.Parent = parent or rise_registry
rise_folders[name_path] = folder
return folder
end
Rise.GetFolder("Rise")
Rise.Instances = Rise.GetFolder("Instances", Rise.GetFolder("Rise"))
local rise_libs = {
"easing", "mouse", "janitor"
}
for i,v in next, rise_libs do
Rise[v] = require(script.Parent.src.libs[v])
end
local rise_classes = {
"Button", "Checkbox", "Colorpicker", "Dropdown", "Keybind", "Label", "Notify", "Section", "Slider", "Tab", "Textbox"
}
for i,v in next, rise_classes do
Rise[v] = require(script.Parent.src[v])
end
function Rise:CreateWindow(options)
options = options or {}
local name = options.Name or "Rise"
local version = options.Version
local main = Rise.Tab.new(name, version)
main.Type = "Window"
local holder = main.holder
holder.Size = UDim2.new(1, 0, 1, -40)
holder.Position = UDim2.new(0, 0, 0, 40)
holder.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
holder.BorderSizePixel = 0
holder.CanvasSize = UDim2.new(0, 0, 0, 0)
holder.ScrollBarThickness = 4
local list = Instance.new("UIListLayout", holder)
list.SortOrder = Enum.SortOrder.LayoutOrder
list.Padding = UDim.new(0, 10)
main.CreateTab = main.CreateSection
function main:SelectTab(tab)
for _,t in pairs(self.sections) do
t.Instance.Visible = (t == tab)
end
self:Update()
end
function main:Toggle()
self.Instance.Visible = not self.Instance.Visible
end
return main
end
return Rise
