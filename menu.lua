local ScreenGui = Instance.new("ScreenGui")
local ScreenGui2 = Instance.new("ScreenGui")
local Menu = Instance.new("Frame")
local Tabs = Instance.new("Frame")
local Selectline = Instance.new("Frame")
local SelectBg = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local PosChange = Instance.new("Frame")
local Up = Instance.new("Frame")
local Unload = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local Frame = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local UICorner_4 = Instance.new("UICorner")
local RainHub = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local Frame_2 = Instance.new("Frame")
local outline = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local outline_2 = Instance.new("Frame")
local Rain = Instance.new("TextLabel")
local Hub = Instance.new("TextLabel")
local RRain = Instance.new("TextLabel")
local BRain = Instance.new("TextLabel")
local outline_3 = Instance.new("Folder")
local outline_4 = Instance.new("Frame")
local outline_5 = Instance.new("Frame")
local outline_6 = Instance.new("Frame")
local Outline_func = Instance.new("Frame")
local UICorner_7 = Instance.new("UICorner")
local outline_7 = Instance.new("Frame")
local Function = Instance.new("ScrollingFrame")
local Cornser_func = Instance.new("Frame")
local UICorner_24 = Instance.new("UICorner")

local LastActiveTab = ""
local activeTab = 0
local CurTabIndex = 0
local LastTabIndex = 0
local Index = {1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0}
local FunctionTab = {}
local FuncTabs = {}
local RenderStepped = game:GetService("RunService").RenderStepped
local sec = nil
local FPS = {}
local CurFPS = 0
local DropDownOpen = false
local DropDownOpenIdx = -1

--ScreenGui.Parent = script.Parent
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "RainHub"

ScreenGui2.Parent = game.CoreGui
ScreenGui2.Name = "Button"

Menu.Parent = ScreenGui
Menu.Name = "RainHub"
Menu.Active = true
Menu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Menu.BorderSizePixel = 0
Menu.LayoutOrder = 7
Menu.Position = UDim2.new(0, (game.Players.LocalPlayer:GetMouse().ViewSizeX/2) - (600/2), 0, (game.Players.LocalPlayer:GetMouse().ViewSizeY/2) - (450/2))
Menu.Size = UDim2.new(0, 600, 0, 450)
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Menu

-----------------------------------------------

local button = Instance.new("TextButton")
button.Parent = ScreenGui2
button.Name = "RightSideButton"
button.Size = UDim2.new(0.1, 0, 0.05, 0)
button.Position = UDim2.new(0.9, 0, 0.5, 0)
button.AnchorPoint = Vector2.new(1, 0.5) 
button.Text = "Open"
button.TextScaled = true 
button.BackgroundColor3 = Color3.new(0.2, 0.6, 1) 
button.BorderSizePixel = 0 

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0.2, 0)
corner.Parent = button

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), -- Синий в начале
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 100, 200))  -- Тёмно-синий в конце
}
gradient.Rotation = 90
gradient.Parent = button

button.MouseEnter:Connect(function()
    button.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
end)

button.MouseLeave:Connect(function()
    button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
end)

button.MouseButton1Click:Connect(function()
    Menu.Visible = not Menu.Visible
end)

----------------------------------------------------------

Menu.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
		if input.Position.Y - Menu.AbsolutePosition.Y < 50 then
			Menu.Draggable = true
		end
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				if input.Position.Y - Menu.AbsolutePosition.Y < 50 then
					Menu.Draggable = true
				else
					Menu.Draggable = false
				end
			end
		end)
	end
end)

game:service("UserInputService").InputBegan:connect(function(inputObject, gameProcessedEvent)
	if inputObject.KeyCode == Enum.KeyCode.RightShift or inputObject.KeyCode == Enum.KeyCode.RightControl then
		Menu.Visible = not Menu.Visible
	end
end)

Up.Name = "Up"
Up.Parent = Menu
Up.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Up.BorderColor3 = Color3.fromRGB(96, 135, 171)
Up.Position = UDim2.new(0.251666665, 0, 0, 0)
Up.Size = UDim2.new(0, 449, 0, 36)
Up.ZIndex = 2
UICorner_4.CornerRadius = UDim.new(0, 10)
UICorner_4.Parent = Up

Tabs.Name = "Tabs"
Tabs.Parent = Menu
Tabs.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Tabs.BorderColor3 = Color3.fromRGB(96, 135, 171)
Tabs.BorderSizePixel = 0
Tabs.Position = UDim2.new(0, 0, 0.15976806, 0)
Tabs.Size = UDim2.new(0, 158, 0, 368)

Selectline.Name = "Select line"
Selectline.Parent = Tabs
Selectline.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
Selectline.BorderSizePixel = 0
Selectline.Size = UDim2.new(0, 5, 0, 50)
Selectline.ZIndex = 3

SelectBg.Name = "Select Bg"
SelectBg.Parent = Tabs
SelectBg.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
SelectBg.BackgroundTransparency = 0.900
SelectBg.BorderSizePixel = 0
SelectBg.Size = UDim2.new(0, 157, 0, 50)
SelectBg.ZIndex = 2

local function fre()
	local fr = tick()
	for index = #FPS,1,-1 do
		FPS[index + 1] = (FPS[index] >= fr - 1) and FPS[index] or nil
	end
	FPS[1] = fr
	local fps = (tick() - sec >= 1 and #FPS) or (#FPS / (tick() - sec))
	CurFPS = math.floor(fps)
end

sec = tick()
RenderStepped:Connect(fre)

function Animation(Value)
	return (Value*60) / math.clamp(CurFPS, 15, 60)
end

function RenderTab(Name)

	FunctionTab[CurTabIndex] = Instance.new("Frame")
	FunctionTab[CurTabIndex].Name = Name
	FunctionTab[CurTabIndex].Parent = Function
	FunctionTab[CurTabIndex].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	FunctionTab[CurTabIndex].BackgroundTransparency = 1
	FunctionTab[CurTabIndex].Position = UDim2.new(0, 5, 0, 0)
	FunctionTab[CurTabIndex].Size = UDim2.new(0, 400, 0, 300)
	FunctionTab[CurTabIndex].ZIndex = 0
	if CurTabIndex == activeTab then
		FunctionTab[CurTabIndex].Visible = true
	else
		FunctionTab[CurTabIndex].Visible = false
	end

	FuncTabs[CurTabIndex] = Instance.new("TextLabel")
	FuncTabs[CurTabIndex].Name = Name
	FuncTabs[CurTabIndex].Parent = Tabs
	FuncTabs[CurTabIndex].Position = UDim2.new(0, 0, 0, 0 + 50 * CurTabIndex)
	FuncTabs[CurTabIndex].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	FuncTabs[CurTabIndex].BackgroundTransparency = 1.000
	FuncTabs[CurTabIndex].Size = UDim2.new(0, 157, 0, 50)
	FuncTabs[CurTabIndex].ZIndex = 3
	FuncTabs[CurTabIndex].Font = Enum.Font.FredokaOne
	FuncTabs[CurTabIndex].Text = Name
	FuncTabs[CurTabIndex].TextSize = 25.000

	if activeTab == CurTabIndex then
		FuncTabs[CurTabIndex].TextColor3 = Color3.fromRGB(206, 206, 206)
	else
		FuncTabs[CurTabIndex].TextColor3 = Color3.fromRGB(150, 150, 150)
	end

	local ActiveTabIndex = CurTabIndex
	local add = 7
	local move = 50
	FuncTabs[ActiveTabIndex].InputBegan:Connect(function (inputObject)
		if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
			activeTab = ActiveTabIndex

			for i = 0, 10 do
				if FunctionTab[i] and FuncTabs[i] and i ~= activeTab then
					FunctionTab[i].Visible = false
					FuncTabs[i].TextColor3 = Color3.fromRGB(150, 150, 150)
				end
			end

			FunctionTab[activeTab].Visible = true
			FuncTabs[activeTab].TextColor3 = Color3.fromRGB(206, 206, 206)

			DropDownOpen = false
			DropDownOpenIdx = -1

			while LastTabIndex ~= ActiveTabIndex do
				if LastTabIndex > ActiveTabIndex then
					SelectBg.Position = UDim2.new(0, 0, 0, LastTabIndex * move)
					Selectline.Position = UDim2.new(0, 0, 0, LastTabIndex * move)
					LastTabIndex -= Animation(add) / move
				else
					SelectBg.Position = UDim2.new(0, 0, 0, LastTabIndex * move)
					Selectline.Position = UDim2.new(0, 0, 0, LastTabIndex * move)
					LastTabIndex += Animation(add) / move
				end

				if math.abs(LastTabIndex - ActiveTabIndex) < (Animation(add)-1) / move then
					LastTabIndex = math.floor(ActiveTabIndex)
					SelectBg.Position = UDim2.new(0, 0, 0, LastTabIndex * move)
					Selectline.Position = UDim2.new(0, 0, 0, LastTabIndex * move)
				end

				game:GetService("RunService").RenderStepped:wait()
			end
		end
	end)

	CurTabIndex += 1

	return FunctionTab[CurTabIndex-1]
end

function RenderCheckBox(CheckBoxSettings)
	CheckBoxSettings = CheckBoxSettings or {}
	CheckBoxSettings.Parent = CheckBoxSettings.Parent
	CheckBoxSettings.Name = CheckBoxSettings.Name or "Test label"
	CheckBoxSettings.Comment = CheckBoxSettings.Comment or "Comment"
	CheckBoxSettings.Value = CheckBoxSettings.Value or false
	CheckBoxSettings.callback = CheckBoxSettings.callback or function() end

	if LastActiveTab ~= CheckBoxSettings.Parent.Name then Index[activeTab+1] = 0 end

	CheckBoxSettings.Parent.Size = UDim2.new(0, 400, 0, (Index[activeTab+1] + 1) * 50 + 10)
	CheckBoxSettings.Position = CheckBoxSettings.Position or UDim2.new(0, 10, 0, 10 + Index[activeTab+1] * 50)

	local CheckBox = Instance.new("Frame")
	local CheckBoxCor = Instance.new("UICorner")
	local CheckboxBox = Instance.new("Frame")
	local CheckboxBoxCor = Instance.new("UICorner")
	local CheckboxBoxStroke = Instance.new("UIStroke")
	local CheckboxActive = Instance.new("Frame")
	local CheckboxActiveCor = Instance.new("UICorner")
	local CheckBoxName = Instance.new("TextLabel")
	local CheckBoxComment = Instance.new("TextLabel")
	local OutLine = Instance.new("Frame")
	local OutLineCorner = Instance.new("UICorner")

	local idx = Index[activeTab+1]

	CheckBox.Name = "CheckBox"
	CheckBox.Parent = CheckBoxSettings.Parent
	CheckBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	CheckBox.Position = CheckBoxSettings.Position
	CheckBox.Size = UDim2.new(0, 387, 0, 40)
	CheckBox.ZIndex = 4
	CheckBoxCor.CornerRadius = UDim.new(0, 10)
	CheckBoxCor.Parent = CheckBox

	CheckboxBox.Name = "Checkbox"
	CheckboxBox.Parent = CheckBox
	CheckboxBox.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
	CheckboxBox.BackgroundTransparency = 1.000
	CheckboxBox.BorderColor3 = Color3.fromRGB(96, 135, 171)
	CheckboxBox.BorderSizePixel = 0
	CheckboxBox.Position = UDim2.new(0, 10, 0, 11)
	CheckboxBox.Size = UDim2.new(0, 16, 0, 16)
	CheckboxBox.ZIndex = 4
	CheckboxBoxCor.Parent = CheckboxBox
	CheckboxBoxCor.CornerRadius = UDim.new(0, 3)
	CheckboxBoxStroke.Parent = CheckboxBox
	CheckboxBoxStroke.ApplyStrokeMode = 1
	CheckboxBoxStroke.Color = Color3.fromRGB(96, 135, 171)
	CheckboxBoxStroke.Thickness = 2.5

	CheckboxActive.Name = "Active"
	CheckboxActive.Parent = CheckBox
	CheckboxActive.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
	CheckboxActive.BorderColor3 = Color3.fromRGB(96, 135, 171)
	CheckboxActive.BorderSizePixel = 0
	CheckboxActive.Position = UDim2.new(0, CheckboxBox.Position.X.Offset + 2, 0, CheckboxBox.Position.Y.Offset + 2)
	CheckboxActive.Size = UDim2.new(0, 12, 0, 12)
	CheckboxActive.Visible = CheckBoxSettings.Value
	CheckboxActive.ZIndex = 4
	CheckboxActiveCor.CornerRadius = UDim.new(0, 3)
	CheckboxActiveCor.Parent = CheckboxActive

	CheckBoxName.Name = "Main text"
	CheckBoxName.Parent = CheckBox
	CheckBoxName.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
	CheckBoxName.BackgroundTransparency = 1.000
	CheckBoxName.BorderColor3 = Color3.fromRGB(27, 42, 53)
	CheckBoxName.Position = UDim2.new(0, 35, 0, 3)
	CheckBoxName.Size = UDim2.new(0, 362, 0, 21)
	CheckBoxName.ZIndex = 4
	CheckBoxName.Font = Enum.Font.FredokaOne
	CheckBoxName.Text = CheckBoxSettings.Name
	CheckBoxName.TextColor3 = Color3.fromRGB(222, 222, 222)
	CheckBoxName.TextSize = 18.000
	CheckBoxName.TextXAlignment = Enum.TextXAlignment.Left
	CheckBoxName.TextYAlignment = Enum.TextYAlignment.Top

	CheckBoxComment.Name = "Comments"
	CheckBoxComment.Parent = CheckBox
	CheckBoxComment.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CheckBoxComment.BackgroundTransparency = 1.000
	CheckBoxComment.Position = UDim2.new(0, 35, 0, 23)
	CheckBoxComment.Size = UDim2.new(0, 362, 0, 12)
	CheckBoxComment.ZIndex = 4
	CheckBoxComment.Font = Enum.Font.FredokaOne
	CheckBoxComment.Text = CheckBoxSettings.Comment
	CheckBoxComment.TextColor3 = Color3.fromRGB(150, 150, 150)
	CheckBoxComment.TextSize = 14.000
	CheckBoxComment.TextXAlignment = Enum.TextXAlignment.Left

	OutLine.Name = "OutLine"
	OutLine.Parent = CheckBox
	OutLine.Active = true
	OutLine.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
	OutLine.BackgroundTransparency = 0.500
	OutLine.Position = UDim2.new(0, -1, 0, -1)
	OutLine.Size = UDim2.new(0, 389, 0, 42)
	OutLine.ZIndex = 3
	OutLineCorner.CornerRadius = UDim.new(0, 10)
	OutLineCorner.Parent = OutLine

	local active = CheckBoxSettings.Value
	local size = 12
	local NeedSize = 12
	local pos = CheckboxActive.Position

	if active then
		size = 12
	else
		size = 0
	end

	CheckBox.InputBegan:Connect(function (inputObject)
		if DropDownOpen == true and idx > DropDownOpenIdx then return end

		if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
			active = not active
			if active then
				NeedSize = 12
			else
				NeedSize = 0
			end

			while NeedSize ~= size do

				if NeedSize ~= size then
					if NeedSize > size then
						size += Animation(1)
					else
						size -= Animation(1)
					end

					CheckboxActive.Size = UDim2.new(0, size, 0, size)
					CheckboxActive.Position = UDim2.new(0, pos.X.Offset + ((12 - size) / 2), 0, pos.X.Offset + ((12 - size) / 2) + 1)
				end

				if size == 0 then
					CheckboxActive.Visible = false
				else
					CheckboxActive.Visible = true
				end

				if math.abs(NeedSize - size) < Animation(1) then
					size = NeedSize

					CheckboxActive.Size = UDim2.new(0, size, 0, size)
					CheckboxActive.Position = UDim2.new(0, pos.X.Offset + ((12 - size) / 2), 0, pos.X.Offset + ((12 - size) / 2) + 1)
				end

				game:GetService("RunService").RenderStepped:wait()
			end
			CheckBoxSettings.Value = active
		end

		CheckBoxSettings.callback(CheckBoxSettings.Value)
		return CheckBox
	end)

	Index[activeTab+1] += 1 
	LastActiveTab = CheckBoxSettings.Parent.Name
end

function RenderSlider(SliderSettings)
	SliderSettings = SliderSettings or {}
	SliderSettings.Parent = SliderSettings.Parent
	SliderSettings.Name = SliderSettings.Name or "Test label"
	SliderSettings.Comment = SliderSettings.Comment or "Comment"
	SliderSettings.Value = SliderSettings.Value or 0
	SliderSettings.Min = SliderSettings.Min or 0
	SliderSettings.Max = SliderSettings.Max or 100
	SliderSettings.callback = SliderSettings.callback or function() end

	if LastActiveTab ~= SliderSettings.Parent.Name then Index[activeTab+1] = 0 end

	SliderSettings.Parent.Size = UDim2.new(0, 400, 0, (Index[activeTab+1] + 1) * 50 + 10)
	SliderSettings.Position = SliderSettings.Position or UDim2.new(0, 10, 0, 10 + Index[activeTab+1] * 50)

	local Slider = Instance.new("Frame")
	local SliderCor = Instance.new("UICorner")
	local SliderLineBox = Instance.new("Frame")
	local SliderLineBoxCor = Instance.new("UICorner")
	local SliderLineBoxStr = Instance.new("UIStroke")
	local SliderLine = Instance.new("Frame")
	local SliderLineCor = Instance.new("UICorner")
	local SliderName = Instance.new("TextLabel")
	local SliderOutLine = Instance.new("Frame")
	local SliderOutLineCor = Instance.new("UICorner")
	local SliderComment = Instance.new("TextLabel")
	local SliderCurCount = Instance.new("TextBox")

	local idx = Index[activeTab+1]

	local Scale = math.floor(math.clamp((SliderSettings.Max - SliderSettings.Min) - (tonumber(SliderSettings.Value) + 0), SliderSettings.Min, SliderSettings.Max))
	local value = SliderSettings.Min + Scale
	local value2 =  UDim2.fromScale((value - SliderSettings.Min) / (SliderSettings.Max - SliderSettings.Min)).X.Scale * 267
	local SizeX = math.clamp(267 - value2 + 1, 1, 267)

	Slider.Name = SliderSettings.Name
	Slider.Parent = SliderSettings.Parent
	Slider.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Slider.Position = SliderSettings.Position
	Slider.Size = UDim2.new(0, 387, 0, 40)
	Slider.ZIndex = 4
	SliderCor.Parent = Slider
	SliderCor.CornerRadius = UDim.new(0, 10)

	SliderLineBox.Name = "SliderLine"
	SliderLineBox.Parent = Slider
	SliderLineBox.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
	SliderLineBox.BackgroundTransparency = 1.000
	SliderLineBox.BorderColor3 = Color3.fromRGB(96, 135, 171)
	SliderLineBox.BorderSizePixel = 0
	SliderLineBox.Position = UDim2.new(0, 10, 0, 20)
	SliderLineBox.Size = UDim2.new(0, 271, 0, 15)
	SliderLineBox.ZIndex = 4
	SliderLineBoxCor.Parent = SliderLineBox
	SliderLineBoxCor.CornerRadius = UDim.new(0, 3)
	SliderLineBoxStr.Parent = SliderLineBox
	SliderLineBoxStr.ApplyStrokeMode = 1
	SliderLineBoxStr.Color = Color3.fromRGB(96, 135, 171)
	SliderLineBoxStr.Thickness = 2.5

	SliderLine.Name = "SliderLineBox"
	SliderLine.Parent = Slider
	SliderLine.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
	SliderLine.BorderColor3 = Color3.fromRGB(96, 135, 171)
	SliderLine.BorderSizePixel = 0
	SliderLine.Position = UDim2.new(0, 12, 0, 22)
	SliderLine.Size = UDim2.new(0, SizeX, 0, 11)
	SliderLine.ZIndex = 4
	SliderLineCor.Parent = SliderLine
	SliderLineCor.CornerRadius = UDim.new(0, 3)

	SliderName.Name = "SliderName"
	SliderName.Parent = Slider
	SliderName.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
	SliderName.BackgroundTransparency = 1.000
	SliderName.BorderColor3 = Color3.fromRGB(27, 42, 53)
	SliderName.Position = UDim2.new(0.805426359, 0, 0.0209999084, 0)
	SliderName.Size = UDim2.new(0, 66, 0, 21)
	SliderName.ZIndex = 4
	SliderName.Font = Enum.Font.FredokaOne
	SliderName.TextColor3 = Color3.fromRGB(222, 222, 222)
	SliderName.TextSize = 18.000
	SliderName.Text = SliderSettings.Name
	SliderName.TextXAlignment = Enum.TextXAlignment.Right
	SliderName.TextYAlignment = Enum.TextYAlignment.Top

	SliderOutLine.Name = "OutLine"
	SliderOutLine.Parent = Slider
	SliderOutLine.Active = true
	SliderOutLine.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
	SliderOutLine.BackgroundTransparency = 0.500
	SliderOutLine.Position = UDim2.new(0, -1, 0, -1)
	SliderOutLine.Size = UDim2.new(0, 389, 0, 42)
	SliderOutLine.ZIndex = 3
	SliderOutLineCor.Parent = SliderOutLine
	SliderOutLineCor.CornerRadius = UDim.new(0, 10)

	SliderComment.Name = "Comments"
	SliderComment.Parent = Slider
	SliderComment.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SliderComment.BackgroundTransparency = 1.000
	SliderComment.Position = UDim2.new(0.805426359, 0, 0.600000024, 0)
	SliderComment.Size = UDim2.new(0, 66, 0, 12)
	SliderComment.ZIndex = 4
	SliderComment.Font = Enum.Font.FredokaOne
	SliderComment.Text = SliderSettings.Comment
	SliderComment.TextColor3 = Color3.fromRGB(200, 200, 200)
	SliderComment.TextSize = 14.000
	SliderComment.TextXAlignment = Enum.TextXAlignment.Right

	SliderCurCount.Name = "CurCount"
	SliderCurCount.Parent = Slider
	SliderCurCount.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SliderCurCount.BackgroundTransparency = 1.000
	SliderCurCount.Position = UDim2.new(0, SizeX, 0, 5)
	SliderCurCount.Size = UDim2.new(0, 20, 0, 12)
	SliderCurCount.Visible = true
	SliderCurCount.ZIndex = 4
	SliderCurCount.Font = Enum.Font.FredokaOne
	SliderCurCount.Text = SliderSettings.Value
	SliderCurCount.TextColor3 = Color3.fromRGB(200, 200, 200)
	SliderCurCount.TextSize = 14.000

	local wasActive = false
	local max_size = 267
	local lastSizeX = SliderLine.Size.X.Offset
	--	local SizeX = SliderLine.Size.X.Offset

	local lastText = SliderCurCount.Text

	SliderCurCount.FocusLost:Connect(function ()

		SliderCurCount.TextEditable = not DropDownOpen

		if not SliderCurCount.Text or not SliderCurCount.Text:match("^%d+$") or not tonumber(SliderCurCount.Text) or SliderCurCount.Text == "" then 
			SliderCurCount.Text = lastText
			return SliderSettings.callback(tonumber(SliderCurCount.Text)) 
		end

		Scale = math.floor(math.clamp((SliderSettings.Max - SliderSettings.Min) - (tonumber(SliderCurCount.Text) + 0), SliderSettings.Min, SliderSettings.Max))
		value = SliderSettings.Min + Scale
		value2 =  UDim2.fromScale((value - SliderSettings.Min) / (SliderSettings.Max - SliderSettings.Min)).X.Scale * 267
		SizeX = math.clamp(267 - value2 + 1, 1, 267)

		while lastSizeX ~= SizeX do

			if math.abs(lastSizeX - SizeX) < 10 then
				lastSizeX = SizeX
			end

			if lastSizeX > SizeX then
				lastSizeX -= Animation(10)
			elseif lastSizeX < SizeX then
				lastSizeX += Animation(10)
			end

			SliderLine.Size = UDim2.new(0, lastSizeX, 0, 11)

			if lastSizeX ~= SizeX or math.abs(lastSizeX-SizeX) < Animation(10) then
				--	local SizeScale = math.clamp(lastSizeX / max_size, 0, 1)  
				SliderCurCount.Position = UDim2.new(0, SliderLine.Position.X.Offset + math.floor(lastSizeX) - 10, 0, 5)
			end
			game:GetService("RunService").RenderStepped:wait()
		end

		lastText = SliderCurCount.Text
		SliderSettings.callback(tonumber(SliderCurCount.Text))
		return SliderSettings.callback(tonumber(SliderCurCount.Text))
	end)

	SliderLineBox.InputBegan:Connect(function (inputObject)

		if DropDownOpen == true and idx > DropDownOpenIdx then return end

		if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
			wasActive = true
			--	SliderCurCount.Visible = true
			local SizeScale = math.clamp((inputObject.Position.X - SliderLine.AbsolutePosition.X) / max_size, 0, 1)  
			SliderCurCount.Text = math.floor(math.clamp(SliderSettings.Min + ((SliderSettings.Max - SliderSettings.Min) * SizeScale), SliderSettings.Min, SliderSettings.Max))
			SizeX = math.clamp(inputObject.Position.X - SliderLine.AbsolutePosition.X, 1, max_size)
			SliderCurCount.Position = UDim2.new(0, SliderLine.Position.X.Offset + lastSizeX - 10, 0, 5)

			while lastSizeX ~= SizeX do

				if math.abs(lastSizeX - SizeX) < 10 then
					lastSizeX = SizeX
				end

				if lastSizeX > SizeX then
					lastSizeX -= Animation(10)
				elseif lastSizeX < SizeX then
					lastSizeX += Animation(10)
				end

				SliderLine.Size = UDim2.new(0, lastSizeX, 0, 11)

				if lastSizeX ~= SizeX or math.abs(lastSizeX-SizeX) < Animation(10) then
					local SizeScale = math.clamp(lastSizeX / max_size, 0, 1)  
					SliderCurCount.Text = math.floor(math.clamp(SliderSettings.Min + ((SliderSettings.Max - SliderSettings.Min) * SizeScale), SliderSettings.Min, SliderSettings.Max))
					SliderCurCount.Position = UDim2.new(0, SliderLine.Position.X.Offset + math.floor(lastSizeX) - 10, 0, 5)
					--	SliderCurCount.Visible = true
				elseif not wasActive then
					--	SliderCurCount.Visible = false
				end
				game:GetService("RunService").RenderStepped:wait()
			end
		end

		lastText = SliderCurCount.Text
		SliderSettings.callback(tonumber(SliderCurCount.Text))
		return Slider
	end)

	SliderLineBox.InputChanged:Connect(function (inputObject)

		if DropDownOpen == true and idx > DropDownOpenIdx then return end

		if wasActive then
			--	SliderCurCount.Visible = true
			local SizeScale = math.clamp((inputObject.Position.X - SliderLine.AbsolutePosition.X) / max_size, 0, 1)  
			SliderCurCount.Text = math.floor(math.clamp(SliderSettings.Min + ((SliderSettings.Max - SliderSettings.Min) * SizeScale), SliderSettings.Min, SliderSettings.Max))
			SizeX = math.clamp(inputObject.Position.X - SliderLine.AbsolutePosition.X, 1, max_size)
			SliderCurCount.Position = UDim2.new(0, SliderLine.Position.X.Offset + lastSizeX - 10, 0, 5)

			while lastSizeX ~= SizeX do

				if math.abs(lastSizeX - SizeX) < 10 then
					lastSizeX = SizeX
				end

				if lastSizeX > SizeX then
					lastSizeX -= Animation(10)
				elseif lastSizeX < SizeX then
					lastSizeX += Animation(10)
				end

				SliderLine.Size = UDim2.new(0, lastSizeX, 0, 11)

				if lastSizeX ~= SizeX or math.abs(lastSizeX-SizeX) < Animation(10) then
					local SizeScale = math.clamp(lastSizeX / max_size, 0, 1)  
					SliderCurCount.Text = math.floor(math.clamp(SliderSettings.Min + ((SliderSettings.Max - SliderSettings.Min) * SizeScale), SliderSettings.Min, SliderSettings.Max))
					SliderCurCount.Position = UDim2.new(0, SliderLine.Position.X.Offset + math.floor(lastSizeX) - 10, 0, 5)
					--	SliderCurCount.Visible = true
				elseif not wasActive then
					--	SliderCurCount.Visible = false
				end
				game:GetService("RunService").RenderStepped:wait()
			end
		end

		lastText = SliderCurCount.Text
		SliderSettings.callback(tonumber(SliderCurCount.Text))
		return Slider
	end)

	SliderLineBox.InputEnded:Connect(function (inputObject)

		if DropDownOpen == true and idx > DropDownOpenIdx then return end

		if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
			wasActive = false
			--	SliderCurCount.Visible = false
		end
	end)

	Index[activeTab+1] += 1
	LastActiveTab = SliderSettings.Parent.Name

	return Slider
end

function RenderDropDown(DropDownSettings)
	DropDownSettings = DropDownSettings or {}
	DropDownSettings.Parent = DropDownSettings.Parent
	DropDownSettings.Name = DropDownSettings.Name or "Test label"
	DropDownSettings.Comment = DropDownSettings.Comment or "Comment"
	DropDownSettings.Textlist = DropDownSettings.Textlist or {"1", "2", "3"}
	DropDownSettings.Value = DropDownSettings.Value or 1
	DropDownSettings.callback = DropDownSettings.callback or function() end

	if LastActiveTab ~= DropDownSettings.Parent.Name then Index[activeTab+1] = 0 end

	DropDownSettings.Parent.Size = UDim2.new(0, 400, 0, (Index[activeTab+1] + 1) * 50 + 10)
	DropDownSettings.Position = DropDownSettings.Position or UDim2.new(0, 10, 0, 10 + Index[activeTab+1] * 50)

	local DropDown = Instance.new("Frame")
	local DropDownCor = Instance.new("UICorner")
	local DisableDropDown = Instance.new("Frame")
	local DisableDropDownCor = Instance.new("UICorner")
	local DisableDropDownStr = Instance.new("UIStroke")
	local Triangle1 = Instance.new("Frame")
	local Triangle2 = Instance.new("Frame")
	local DropDownOutLine = Instance.new("Frame")
	local DropDownOutLineCor = Instance.new("UICorner")
	local Comment = Instance.new("TextLabel")
	local DropDownActiveText = Instance.new("TextLabel")
	local ActiveDropDown = Instance.new("ScrollingFrame")
	local ActiveDropDownBG = Instance.new("Frame")
	local ActiveDropDownBGCor = Instance.new("UICorner")
	local ActiveDropDownBGStr = Instance.new("UIStroke")

	local idx = Index[activeTab+1]

	DropDown.Name = "DropDown"
	DropDown.Parent = DropDownSettings.Parent
	DropDown.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	DropDown.Position = DropDownSettings.Position
	DropDown.Size = UDim2.new(0, 387, 0, 40)
	DropDown.ZIndex = 4
	DropDownCor.Parent = DropDown
	DropDownCor.CornerRadius = UDim.new(0, 10)

	DisableDropDown.Name = "DisableDropDown"
	DisableDropDown.Parent = DropDown
	DisableDropDown.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	DisableDropDown.BackgroundTransparency = 0
	DisableDropDown.BorderColor3 = Color3.fromRGB(96, 135, 171)
	DisableDropDown.BorderSizePixel = 0
	DisableDropDown.Position = UDim2.new(0, 8, 0, 8)
	DisableDropDown.Size = UDim2.new(0, 200, 0, 25)
	DisableDropDown.ZIndex = 4
	DisableDropDownCor.Parent = DisableDropDown
	DisableDropDownCor.CornerRadius = UDim.new(0, 5)
	DisableDropDownStr.Parent = DisableDropDown
	DisableDropDownStr.ApplyStrokeMode = 1
	DisableDropDownStr.Color = Color3.fromRGB(96, 135, 171)
	DisableDropDownStr.Thickness = 1
	DisableDropDownStr.Transparency = 0.55

	Triangle1.Parent = DisableDropDown
	Triangle1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Triangle1.Position = UDim2.new(0, 180, 0, 5)
	Triangle1.Rotation = 45.000
	Triangle1.Size = UDim2.new(0, 10, 0, 10)
	Triangle1.ZIndex = 4

	Triangle2.Parent = Triangle1
	Triangle2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Triangle2.BorderSizePixel = 0
	Triangle2.Rotation = -45
	Triangle2.Position = UDim2.new(0, -10, 0, -2)
	Triangle2.Size = UDim2.new(0, 23, 0, 9)
	Triangle2.ZIndex = 4

	DropDownOutLine.Name = "OutLine"
	DropDownOutLine.Parent = DropDown
	DropDownOutLine.Active = true
	DropDownOutLine.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
	DropDownOutLine.BackgroundTransparency = 0.500
	DropDownOutLine.Position = UDim2.new(0, -1, 0, -1)
	DropDownOutLine.Size = UDim2.new(0, 389, 0, 42)
	DropDownOutLine.ZIndex = 3
	DropDownOutLineCor.Parent = DropDownOutLine
	DropDownOutLineCor.CornerRadius = UDim.new(0, 10)

	Comment.Name = "Comments"
	Comment.Parent = DropDown
	Comment.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Comment.BackgroundTransparency = 1.000
	Comment.Position = UDim2.new(0.508268774, 0, 0.600000024, 0)
	Comment.Size = UDim2.new(0, 182, 0, 12)
	Comment.ZIndex = 4
	Comment.Font = Enum.Font.FredokaOne
	Comment.Text = DropDownSettings.Comment
	Comment.TextColor3 = Color3.fromRGB(200, 200, 200)
	Comment.TextSize = 14.000
	Comment.TextXAlignment = Enum.TextXAlignment.Right

	DropDownActiveText.Name = "Main text"
	DropDownActiveText.Parent = DropDown
	DropDownActiveText.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
	DropDownActiveText.BackgroundTransparency = 1.000
	DropDownActiveText.BorderColor3 = Color3.fromRGB(27, 42, 53)
	DropDownActiveText.Position = UDim2.new(0.508268774, 0, 0.0209999084, 0)
	DropDownActiveText.Size = UDim2.new(0, 182, 0, 21)
	DropDownActiveText.ZIndex = 4
	DropDownActiveText.Font = Enum.Font.FredokaOne
	DropDownActiveText.TextColor3 = Color3.fromRGB(222, 222, 222)
	DropDownActiveText.Text = DropDownSettings.Name
	DropDownActiveText.TextSize = 18.000
	DropDownActiveText.TextXAlignment = Enum.TextXAlignment.Right
	DropDownActiveText.TextYAlignment = Enum.TextYAlignment.Top

	ActiveDropDown.Name = "ActiveDropDown"
	ActiveDropDown.Parent = DropDown
	ActiveDropDown.Active = true
	ActiveDropDown.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	ActiveDropDown.BackgroundTransparency = 1.000
	ActiveDropDown.BorderColor3 = Color3.fromRGB(96, 135, 171)
	ActiveDropDown.BorderSizePixel = 0
	ActiveDropDown.Position = UDim2.new(0.0199999996, 0, 0.200000003, 0)
	ActiveDropDown.Size = UDim2.new(0, 195, 0, 200)
	ActiveDropDown.ZIndex = 8
	ActiveDropDown.ScrollingEnabled = true
	ActiveDropDown.AutomaticCanvasSize = 3
	ActiveDropDown.ScrollBarImageColor3 = Color3.fromRGB(96, 135, 171)
	ActiveDropDown.ScrollingDirection = 2
	ActiveDropDown.CanvasSize = UDim2.new(0, 10, 0, 10)
	ActiveDropDown.ScrollBarThickness = 10

	ActiveDropDownBG.Name = "DropDown"
	ActiveDropDownBG.Parent = DropDown
	ActiveDropDownBG.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	ActiveDropDownBG.Position = UDim2.new(0.0199999996, 0, 0.200000003, 0)
	ActiveDropDownBG.Size = UDim2.new(0, 200, 0, 200)
	ActiveDropDownBG.Visible = false
	ActiveDropDownBG.ZIndex = 7
	ActiveDropDownBGCor.Parent = ActiveDropDownBG
	ActiveDropDownBGCor.CornerRadius = UDim.new(0, 5)
	ActiveDropDownBGStr.Parent = ActiveDropDownBG
	ActiveDropDownBGStr.ApplyStrokeMode = 1
	ActiveDropDownBGStr.Color = Color3.fromRGB(96, 135, 171)
	ActiveDropDownBGStr.Thickness = 1
	ActiveDropDownBGStr.Transparency = 0.55


	local DropDownText = {}
	local lastFrameSize = 25
	local NeedSize = 25
	local maxsize = math.min(#DropDownSettings.Textlist * 25, 100.00)

	local ActiveItemText = Instance.new("TextLabel", DisableDropDown)
	ActiveItemText.Text = DropDownSettings.Textlist[DropDownSettings.Value]
	ActiveItemText.BackgroundTransparency = 1
	ActiveItemText.BorderSizePixel = 0
	ActiveItemText.Position = UDim2.new(0, 8, 0, 5)
	ActiveItemText.Size = UDim2.new(0.5, 0, 0.4, 0)
	ActiveItemText.ZIndex = 5
	ActiveItemText.Font = "SourceSans"
	ActiveItemText.FontSize = "Size18"
	ActiveItemText.TextColor3 = Color3.new(0.376471, 0.529412, 0.670588)
	ActiveItemText.TextXAlignment = "Left"
	ActiveItemText.TextYAlignment = "Center"
	ActiveItemText.Visible = DisableDropDown.Visible

	for i = 1, #DropDownSettings.Textlist do
		DropDownText[i] = Instance.new("TextLabel", ActiveDropDown)
		DropDownText[i].Text = DropDownSettings.Textlist[i]
		DropDownText[i].BackgroundTransparency = 1
		DropDownText[i].BorderSizePixel = 0
		DropDownText[i].Position = UDim2.new(0, 9, 0, (i-1) * 25 - 2)
		DropDownText[i].Size = UDim2.new(0, 200, 0, 25)
		DropDownText[i].ZIndex = 8
		DropDownText[i].Font = "SourceSans"
		DropDownText[i].FontSize = "Size18"
		DropDownText[i].TextColor3 = Color3.new(0.807843, 0.807843, 0.807843)
		DropDownText[i].TextTransparency = 0
		DropDownText[i].TextXAlignment = "Left"
		DropDownText[i].TextYAlignment = "Center"
		DropDownText[i].Visible = false

		DropDownText[i].InputEnded:Connect(function (inputObject)
			local mouseposX = inputObject.Position.X - ActiveDropDown.AbsolutePosition.X
			if inputObject.UserInputType == Enum.UserInputType.MouseButton1 and mouseposX < 190 then
				DropDownSettings.Value = i
				ActiveItemText.Text = DropDownSettings.Textlist[DropDownSettings.Value]

				NeedSize = 25
				DropDownOpen = false
				DropDownOpenIdx = -1

				while NeedSize ~= lastFrameSize do
					if lastFrameSize > NeedSize then
						lastFrameSize -= Animation(5)
					elseif lastFrameSize < NeedSize then
						lastFrameSize += Animation(5)
					end

					if math.abs(lastFrameSize - NeedSize) < 5 then
						lastFrameSize = NeedSize
						ActiveDropDown.Size = UDim2.new(0, 195, 0, lastFrameSize)
						ActiveDropDownBG.Size = UDim2.new(0, 200, 0, lastFrameSize)
						ActiveDropDownBG.Transparency = 1 - (lastFrameSize/maxsize)

						for i = 1, #DropDownSettings.Textlist do
							if DropDownText[i].TextTransparency < 1 then
								DropDownText[i].Visible = true
							else
								DropDownText[i].Visible = false
							end
						end
					end

					if lastFrameSize ~= NeedSize then
						ActiveDropDown.Size = UDim2.new(0, 195, 0, lastFrameSize)
						ActiveDropDownBG.Size = UDim2.new(0, 200, 0, lastFrameSize)
						ActiveDropDownBG.Transparency = 1 - (lastFrameSize/maxsize)

						for i = 1, #DropDownSettings.Textlist do
							if DropDownText[i].TextTransparency < 1 then
								DropDownText[i].Visible = true
							else
								DropDownText[i].Visible = false
							end
						end
					end

					if lastFrameSize == 25  then
						ActiveDropDown.Visible = false
						ActiveDropDownBG.Visible = false
						DisableDropDown.Visible = true
						ActiveItemText.Visible = DisableDropDown.Visible
					elseif lastFrameSize > 25 then
						ActiveDropDown.Visible = true
						ActiveDropDownBG.Visible = true
						DisableDropDown.Visible = false
					end

					game:GetService("RunService").RenderStepped:wait()
				end

				DropDownSettings.callback(DropDownSettings.Value)
				return DropDown
			end
		end)
	end

	DropDown.InputBegan:Connect(function (inputObject)
		if inputObject.UserInputType == Enum.UserInputType.MouseButton1 --[[and DropDownOpen == false and idx > DropDownOpenIdx ]]then
			local mouseposX = inputObject.Position.X - DisableDropDown.AbsolutePosition.X

			if DisableDropDown.Visible then
				NeedSize = maxsize
				DropDownOpen = true
				DropDownOpenIdx = idx
			end

			if mouseposX > 200 then
				NeedSize = 25
				DropDownOpen = false
				DropDownOpenIdx = -1
			end

			for i = 1, #DropDownSettings.Textlist do			
				if i == DropDownSettings.Value then
					DropDownText[i].TextColor3 = Color3.new(0.376471, 0.529412, 0.670588)
				else
					DropDownText[i].TextColor3 = Color3.new(0.807843, 0.807843, 0.807843)
				end
			end

			while NeedSize ~= lastFrameSize do
				if lastFrameSize > NeedSize then
					lastFrameSize -= Animation(5)
				elseif lastFrameSize < NeedSize then
					lastFrameSize += Animation(5)
				end

				if math.abs(lastFrameSize - NeedSize) < 5 then
					lastFrameSize = NeedSize
					ActiveDropDown.Size = UDim2.new(0, 195, 0, lastFrameSize)
					ActiveDropDownBG.Size = UDim2.new(0, 200, 0, lastFrameSize)
					ActiveDropDownBG.Transparency = 1 - (lastFrameSize/maxsize)

					for i = 1, #DropDownSettings.Textlist do
						if DropDownText[i].TextTransparency < 1 then
							DropDownText[i].Visible = true
						else
							DropDownText[i].Visible = false
						end
					end
				end

				if lastFrameSize ~= NeedSize then
					ActiveDropDown.Size = UDim2.new(0, 195, 0, lastFrameSize)
					ActiveDropDownBG.Size = UDim2.new(0, 200, 0, lastFrameSize)
					ActiveDropDownBG.Transparency = 1 - (lastFrameSize/maxsize)

					for i = 1, #DropDownSettings.Textlist do
						if DropDownText[i].TextTransparency < 1 then
							DropDownText[i].Visible = true
						else
							DropDownText[i].Visible = false
						end
					end
				end

				if lastFrameSize == 25  then
					ActiveDropDown.Visible = false
					ActiveDropDownBG.Visible = false
					DisableDropDown.Visible = true
					ActiveItemText.Visible = DisableDropDown.Visible
				elseif lastFrameSize > 25 then
					ActiveDropDown.Visible = true
					ActiveDropDownBG.Visible = true
					DisableDropDown.Visible = false
				end

				game:GetService("RunService").RenderStepped:wait()
			end
		end
	end)

	LastActiveTab = DropDownSettings.Parent.Name
	Index[activeTab+1] += 1

	return DropDown
end

function RenderMultiDropDown(DropDownSettings)
	DropDownSettings = DropDownSettings or {}
	DropDownSettings.Parent = DropDownSettings.Parent
	DropDownSettings.Name = DropDownSettings.Name or "Test label"
	DropDownSettings.Comment = DropDownSettings.Comment or "Comment"
	DropDownSettings.Textlist = DropDownSettings.Textlist or {"1", "2", "3"}
	DropDownSettings.Value = DropDownSettings.Value or {false, false, false}
	DropDownSettings.callback = DropDownSettings.callback or function() end

	if LastActiveTab ~= DropDownSettings.Parent.Name then Index[activeTab+1] = 0 end

	DropDownSettings.Parent.Size = UDim2.new(0, 400, 0, (Index[activeTab+1] + 1) * 50 + 10)
	DropDownSettings.Position = DropDownSettings.Position or UDim2.new(0, 10, 0, 10 + Index[activeTab+1] * 50)

	local DropDown = Instance.new("Frame")
	local DropDownCor = Instance.new("UICorner")
	local DisableDropDown = Instance.new("Frame")
	local DisableDropDownCor = Instance.new("UICorner")
	local DisableDropDownStr = Instance.new("UIStroke")
	local Triangle1 = Instance.new("Frame")
	local Triangle2 = Instance.new("Frame")
	local DropDownOutLine = Instance.new("Frame")
	local DropDownOutLineCor = Instance.new("UICorner")
	local Comment = Instance.new("TextLabel")
	local DropDownActiveText = Instance.new("TextLabel")
	local ActiveDropDown = Instance.new("ScrollingFrame")
	local ActiveDropDownBG = Instance.new("Frame")
	local ActiveDropDownBGCor = Instance.new("UICorner")
	local ActiveDropDownBGStr = Instance.new("UIStroke")
	local Gradient = Instance.new("Frame")
	local UIGradient = Instance.new("UIGradient")

	local idx = Index[activeTab+1]

	DropDown.Name = "DropDown"
	DropDown.Parent = DropDownSettings.Parent
	DropDown.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	DropDown.Position = DropDownSettings.Position
	DropDown.Size = UDim2.new(0, 387, 0, 40)
	DropDown.ZIndex = 4
	DropDownCor.Parent = DropDown
	DropDownCor.CornerRadius = UDim.new(0, 10)

	DisableDropDown.Name = "DisableDropDown"
	DisableDropDown.Parent = DropDown
	DisableDropDown.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	DisableDropDown.BackgroundTransparency = 0
	DisableDropDown.BorderColor3 = Color3.fromRGB(96, 135, 171)
	DisableDropDown.BorderSizePixel = 0
	DisableDropDown.Position = UDim2.new(0, 8, 0, 8)
	DisableDropDown.Size = UDim2.new(0, 200, 0, 25)
	DisableDropDown.ZIndex = 4
	DisableDropDownCor.Parent = DisableDropDown
	DisableDropDownCor.CornerRadius = UDim.new(0, 5)
	DisableDropDownStr.Parent = DisableDropDown
	DisableDropDownStr.ApplyStrokeMode = 1
	DisableDropDownStr.Color = Color3.fromRGB(96, 135, 171)
	DisableDropDownStr.Thickness = 1
	DisableDropDownStr.Transparency = 0.55

	Triangle1.Parent = DisableDropDown
	Triangle1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Triangle1.Position = UDim2.new(0, 180, 0, 5)
	Triangle1.Rotation = 45.000
	Triangle1.Size = UDim2.new(0, 10, 0, 10)
	Triangle1.ZIndex = 4

	Triangle2.Parent = Triangle1
	Triangle2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Triangle2.BorderSizePixel = 0
	Triangle2.Rotation = -45
	Triangle2.Position = UDim2.new(0, -10, 0, -2)
	Triangle2.Size = UDim2.new(0, 23, 0, 9)
	Triangle2.ZIndex = 4

	DropDownOutLine.Name = "OutLine"
	DropDownOutLine.Parent = DropDown
	DropDownOutLine.Active = true
	DropDownOutLine.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
	DropDownOutLine.BackgroundTransparency = 0.500
	DropDownOutLine.Position = UDim2.new(0, -1, 0, -1)
	DropDownOutLine.Size = UDim2.new(0, 389, 0, 42)
	DropDownOutLine.ZIndex = 3
	DropDownOutLineCor.Parent = DropDownOutLine
	DropDownOutLineCor.CornerRadius = UDim.new(0, 10)

	Comment.Name = "Comments"
	Comment.Parent = DropDown
	Comment.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Comment.BackgroundTransparency = 1.000
	Comment.Position = UDim2.new(0.508268774, 0, 0.600000024, 0)
	Comment.Size = UDim2.new(0, 182, 0, 12)
	Comment.ZIndex = 4
	Comment.Font = Enum.Font.FredokaOne
	Comment.Text = DropDownSettings.Comment
	Comment.TextColor3 = Color3.fromRGB(200, 200, 200)
	Comment.TextSize = 14.000
	Comment.TextXAlignment = Enum.TextXAlignment.Right

	DropDownActiveText.Name = "Main text"
	DropDownActiveText.Parent = DropDown
	DropDownActiveText.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
	DropDownActiveText.BackgroundTransparency = 1.000
	DropDownActiveText.BorderColor3 = Color3.fromRGB(27, 42, 53)
	DropDownActiveText.Position = UDim2.new(0.508268774, 0, 0.0209999084, 0)
	DropDownActiveText.Size = UDim2.new(0, 182, 0, 21)
	DropDownActiveText.ZIndex = 4
	DropDownActiveText.Font = Enum.Font.FredokaOne
	DropDownActiveText.TextColor3 = Color3.fromRGB(222, 222, 222)
	DropDownActiveText.Text = DropDownSettings.Name
	DropDownActiveText.TextSize = 18.000
	DropDownActiveText.TextXAlignment = Enum.TextXAlignment.Right
	DropDownActiveText.TextYAlignment = Enum.TextYAlignment.Top

	ActiveDropDown.Name = "ActiveDropDown"
	ActiveDropDown.Parent = DropDown
	ActiveDropDown.Active = true
	ActiveDropDown.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	ActiveDropDown.BackgroundTransparency = 1.000
	ActiveDropDown.BorderColor3 = Color3.fromRGB(96, 135, 171)
	ActiveDropDown.BorderSizePixel = 0
	ActiveDropDown.Position = UDim2.new(0.0199999996, 0, 0.200000003, 0)
	ActiveDropDown.Size = UDim2.new(0, 195, 0, math.min(#DropDownSettings.Textlist * 25, 100.00))
	ActiveDropDown.ZIndex = 8
	ActiveDropDown.ScrollingEnabled = true
	ActiveDropDown.AutomaticCanvasSize = 3
	ActiveDropDown.ScrollBarImageColor3 = Color3.fromRGB(96, 135, 171)
	ActiveDropDown.ScrollingDirection = 2
	ActiveDropDown.CanvasSize = UDim2.new(0, 10, 0, 10)
	ActiveDropDown.ScrollBarThickness = 10

	ActiveDropDownBG.Name = "DropDown"
	ActiveDropDownBG.Parent = DropDown
	ActiveDropDownBG.BackgroundColor3 = Color3.fromRGB(30, 30, 30) 
	ActiveDropDownBG.Position = UDim2.new(0.0199999996, 0, 0.200000003, 0)
	ActiveDropDownBG.Size = UDim2.new(0, 200, 0, math.min(#DropDownSettings.Textlist * 25, 100.00))
	ActiveDropDownBG.Visible = false
	ActiveDropDownBG.ZIndex = 7
	ActiveDropDownBGCor.Parent = ActiveDropDownBG
	ActiveDropDownBGCor.CornerRadius = UDim.new(0, 5)
	ActiveDropDownBGStr.Parent = ActiveDropDownBG
	ActiveDropDownBGStr.ApplyStrokeMode = 1
	ActiveDropDownBGStr.Color = Color3.fromRGB(96, 135, 171)
	ActiveDropDownBGStr.Thickness = 1
	ActiveDropDownBGStr.Transparency = 0.55

	Gradient.Name = "Gradient"
	Gradient.Parent = DropDown
	Gradient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Gradient.BorderColor3 = Color3.fromRGB(255, 255, 255)
	Gradient.BorderSizePixel = 0
	Gradient.Position = UDim2.new(0, 113, 0, 10)
	Gradient.Size = UDim2.new(0, 71, 0, 22)
	Gradient.ZIndex = 6

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 30, 30)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 30, 30))}
	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.86), NumberSequenceKeypoint.new(0.80, 0.00), NumberSequenceKeypoint.new(1.00, 0.00)}
	UIGradient.Parent = Gradient

	--Script
	local Text = {"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""}
	local TestText = {""}
	local CountActiveItems = 0
	local DropDownText = {}
	local lastFrameSize = 25
	local NeedSize = 25
	local maxsize = math.min(#DropDownSettings.Textlist * 25, 100.00)

	for i = 1, #DropDownSettings.Textlist do
		DropDownText[i] = Instance.new("TextLabel", ActiveDropDown)
		DropDownText[i].Text = DropDownSettings.Textlist[i]
		DropDownText[i].BackgroundTransparency = 1
		DropDownText[i].BorderSizePixel = 0
		DropDownText[i].Position = UDim2.new(0, 7.5, 0, (i-1) * 25)
		DropDownText[i].Size = UDim2.new(0, 200, 0, 25)
		DropDownText[i].ZIndex = 8
		DropDownText[i].Font = "SourceSans"
		DropDownText[i].FontSize = "Size18"
		DropDownText[i].TextColor3 = Color3.new(0.807843, 0.807843, 0.807843)
		DropDownText[i].TextXAlignment = "Left"
		DropDownText[i].TextYAlignment = "Center"
		DropDownText[i].Visible = false

		DropDownText[i].InputBegan:Connect(function (inputObject)
			if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
				DropDownSettings.Value[i] = not DropDownSettings.Value[i]

				if DropDownSettings.Value[i] == true then
					DropDownText[i].TextColor3 = Color3.new(0.376471, 0.529412, 0.670588)
				else
					DropDownText[i].TextColor3 = Color3.new(0.807843, 0.807843, 0.807843)
				end
			end

			DropDownSettings.callback(DropDownSettings.Value)
			return DropDown
		end)
	end

	local ActiveItemText = Instance.new("TextLabel", DisableDropDown)
	ActiveItemText.Text = "None"
	ActiveItemText.BackgroundTransparency = 1
	ActiveItemText.BorderSizePixel = 0
	ActiveItemText.Position = UDim2.new(0, 7.5, 0, 7)
	ActiveItemText.Size = UDim2.new(0.5, 0, 0.4, 0)
	ActiveItemText.ZIndex = 5
	ActiveItemText.Font = "SourceSans"
	ActiveItemText.FontSize = "Size18"
	ActiveItemText.TextColor3 = Color3.new(0.376471, 0.529412, 0.670588)
	ActiveItemText.TextXAlignment = "Left"
	ActiveItemText.TextYAlignment = "Center"
	ActiveItemText.Visible = DisableDropDown.Visible
	for i = 1, #DropDownSettings.Textlist do
		if DropDownSettings.Value[i] == true then
			if CountActiveItems == 0 then
				table.insert(TestText, DropDownText[i].Text)
			elseif CountActiveItems > 0 then
				table.insert(TestText, ", " .. DropDownText[i].Text)
			end
			CountActiveItems += 1
		end
	end

	if CountActiveItems > 0 then
		ActiveItemText.Text = string.sub(table.concat(TestText), 0, 25)
	end

	DropDown.InputBegan:Connect(function (inputObject)
		if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
			local mouseposX = inputObject.Position.X - DisableDropDown.AbsolutePosition.X

			if mouseposX < 200 and DisableDropDown.Visible and DropDownOpen == false and idx > DropDownOpenIdx then
				NeedSize = maxsize
				DropDownOpen = true
				DropDownOpenIdx = idx
			elseif mouseposX > 200 and ActiveDropDown.Visible then
				NeedSize = 25
				DropDownOpen = false
				DropDownOpenIdx = -1
			end

			while lastFrameSize ~= NeedSize do
				if lastFrameSize > NeedSize then
					lastFrameSize -= Animation(5)
				elseif lastFrameSize < NeedSize then
					lastFrameSize += Animation(5)
				end

				if math.abs(lastFrameSize - NeedSize) < 5 then
					lastFrameSize = NeedSize
					ActiveDropDown.Size = UDim2.new(0, 195, 0, lastFrameSize)
					ActiveDropDownBG.Size = UDim2.new(0, 200, 0, lastFrameSize)
					ActiveDropDownBG.Transparency = 1 - (lastFrameSize/maxsize)

					for i = 1, #DropDownSettings.Textlist do
						if DropDownText[i].TextTransparency < 1 then
							DropDownText[i].Visible = true
						else
							DropDownText[i].Visible = false
						end
					end
				end

				if lastFrameSize ~= NeedSize then
					ActiveDropDown.Size = UDim2.new(0, 195, 0, lastFrameSize)
					ActiveDropDownBG.Size = UDim2.new(0, 200, 0, lastFrameSize)
					ActiveDropDownBG.Transparency = 1 - (lastFrameSize/maxsize)

					for i = 1, #DropDownSettings.Textlist do
						if DropDownText[i].TextTransparency < 1 then
							DropDownText[i].Visible = true
						else
							DropDownText[i].Visible = false
						end
					end
				end

				if lastFrameSize == 25  then
					ActiveDropDown.Visible = false
					ActiveDropDownBG.Visible = false
					DisableDropDown.Visible = true
					ActiveItemText.Visible = DisableDropDown.Visible
				elseif lastFrameSize > 25 then
					ActiveDropDown.Visible = true
					ActiveDropDownBG.Visible = true
					DisableDropDown.Visible = false
				end

				game:GetService("RunService").RenderStepped:wait()
			end

			ActiveItemText.Visible = DisableDropDown.Visible
			Gradient.Visible = DisableDropDown.Visible

			for i = 1, #DropDownSettings.Textlist do
				DropDownText[i].Visible = ActiveDropDown.Visible and ActiveDropDownBG.Visible

				if DropDownSettings.Value[i] == true then
					DropDownText[i].TextColor3 = Color3.new(0.376471, 0.529412, 0.670588)
				else
					DropDownText[i].TextColor3 = Color3.new(0.807843, 0.807843, 0.807843)
				end
			end

			if DisableDropDown.Visible then
				CountActiveItems = 0

				TestText = {""}

				for i = 1, #DropDownSettings.Textlist do
					Text[i] = ""
					if DropDownSettings.Value[i] == true then
						if CountActiveItems == 0 then
							table.insert(TestText, DropDownText[i].Text)
						elseif CountActiveItems > 0 then
							table.insert(TestText, ", " .. DropDownText[i].Text)
						end
						CountActiveItems += 1
					end
				end

				ActiveItemText.Text = string.sub(table.concat(TestText), 0, 25)

				if CountActiveItems == 0 then
					ActiveItemText.Text = "None"
				end
			end

			DropDownSettings.callback(DropDownSettings.Value)
			return DropDown
		end
	end)

	LastActiveTab = DropDownSettings.Parent.Name
	Index[activeTab+1] += 1

	DropDownSettings.callback(DropDownSettings.Value)
	return DropDown
end

function RenderButton(ButtonSettings)
	ButtonSettings = ButtonSettings or {}
	ButtonSettings.Parent = ButtonSettings.Parent
	ButtonSettings.Name = ButtonSettings.Name or "Test label"
	ButtonSettings.callback = ButtonSettings.callback or function() end

	if LastActiveTab ~= ButtonSettings.Parent.Name then Index[activeTab+1] = 0 end

	ButtonSettings.Parent.Size = ButtonSettings.ParentSize or UDim2.new(0, 400, 0, (Index[activeTab+1] + 1) * 50 + 10)
	ButtonSettings.Position = ButtonSettings.Position or UDim2.new(0, 10, 0, 10 + Index[activeTab+1] * 50)
	ButtonSettings.Size = ButtonSettings.Size or UDim2.new(0, 387, 0, 40)

	local Button = Instance.new("Frame")
	local ButtonCor = Instance.new("UICorner")
	local ButtonName = Instance.new("TextLabel")
	local OutLine = Instance.new("Frame")
	local OutLineCorner = Instance.new("UICorner")
	local ButtonActive = Instance.new("Frame")
	local ButtonActiveCor = Instance.new("UICorner")	
	local ButtonActiveStroke = Instance.new("UIStroke")

	local idx = Index[activeTab+1]

	Button.Name = "CheckBox"
	Button.Parent = ButtonSettings.Parent
	Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Button.Position = ButtonSettings.Position
	Button.Size = ButtonSettings.Size
	Button.ZIndex = 4
	ButtonCor.CornerRadius = UDim.new(0, 10)
	ButtonCor.Parent = Button
	OutLine.Name = "OutLine"
	OutLine.Parent = Button
	OutLine.Active = true
	OutLine.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
	OutLine.BackgroundTransparency = 0.500
	OutLine.Position = UDim2.new(0, -1, 0, -1)
	OutLine.Size = ButtonSettings.Size + UDim2.new(0, 2, 0, 2)
	OutLine.ZIndex = 3
	OutLineCorner.CornerRadius = UDim.new(0, 10)
	OutLineCorner.Parent = OutLine

	ButtonName.Name = "Main text"
	ButtonName.Parent = Button
	ButtonName.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
	ButtonName.BackgroundTransparency = 1.000
	ButtonName.BorderColor3 = Color3.fromRGB(27, 42, 53)
	ButtonName.Position = UDim2.new(0, 0, 0, 0)
	ButtonName.Size = UDim2.new(0, ButtonSettings.Size.X.Offset, 0, ButtonSettings.Size.Y.Offset)
	ButtonName.ZIndex = 4
	ButtonName.Font = Enum.Font.FredokaOne
	ButtonName.Text = ButtonSettings.Name
	ButtonName.TextColor3 = Color3.fromRGB(222, 222, 222)
	ButtonName.TextSize = 18.000
	ButtonName.TextXAlignment = Enum.TextXAlignment.Center
	ButtonName.TextYAlignment = Enum.TextYAlignment.Center

	ButtonActive.Name = "Checkbox"
	ButtonActive.Parent = Button
	ButtonActive.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
	ButtonActive.BackgroundTransparency = 1.000
	ButtonActive.BorderColor3 = Color3.fromRGB(96, 135, 171)
	ButtonActive.BorderSizePixel = 0
	ButtonActive.Position = UDim2.new(0, 0, 0, 0)
	ButtonActive.Size = ButtonSettings.Size - UDim2.new(0, 0, 0, 0)
	ButtonActive.ZIndex = 4
	ButtonActiveCor.Parent = ButtonActive
	ButtonActiveCor.CornerRadius = UDim.new(0, 10)
	ButtonActiveStroke.Parent = ButtonActive
	ButtonActiveStroke.ApplyStrokeMode = 1
	ButtonActiveStroke.Color = Color3.fromRGB(96, 135, 171)
	ButtonActiveStroke.Transparency = 0.5
	ButtonActiveStroke.Thickness = 0
	ButtonActiveStroke.ApplyStrokeMode = 1

	local size = 0
	local NeedSize = 0
	local pos = ButtonActive.Position
	local chto = ButtonSettings.Size.X.Offset / ButtonSettings.Size.Y.Offset

	Button.InputBegan:Connect(function (inputObject)
		if DropDownOpen == true and idx > DropDownOpenIdx then return end

		if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
			ButtonActive.BackgroundTransparency = 0.5

			ButtonSettings.callback()
		else
			ButtonActive.BackgroundTransparency = 1
			NeedSize = 5

			while size ~= NeedSize do
				size += Animation(2)

				ButtonActiveStroke.Thickness = size
				ButtonActive.Position = UDim2.new(0, size, 0, size)
				ButtonActive.Size = ButtonSettings.Size - UDim2.new(0, size * 2, 0, size * 2)
				ButtonActiveCor.CornerRadius = UDim.new(0, math.clamp(10 - size, 0, 10))

				if math.abs(size - NeedSize) < 3 or size >= NeedSize then
					size = NeedSize
					wait()
					ButtonActiveStroke.Thickness = size
					ButtonActive.Position = UDim2.new(0, size, 0, size)
					ButtonActive.Size = ButtonSettings.Size - UDim2.new(0, size * 2, 0, size * 2)
					ButtonActiveCor.CornerRadius = UDim.new(0, math.clamp(10 - size, 0, 10))
				end
				wait()
			end
		end

		return Button
	end)

	Button.InputEnded:Connect(function (inputObject)
		if DropDownOpen == true and idx > DropDownOpenIdx then return end

		NeedSize = 0
		ButtonActive.BackgroundTransparency = 1

		while size ~= NeedSize do
			size -= Animation(2)

			ButtonActiveStroke.Thickness = size
			ButtonActive.Position = UDim2.new(0, size, 0, size)
			ButtonActive.Size = ButtonSettings.Size - UDim2.new(0, size * 2, 0, size * 2)
			ButtonActiveCor.CornerRadius = UDim.new(0, math.clamp(10 - size, 0, 10))

			if math.abs(size - NeedSize) < 3 or size <= NeedSize then
				size = NeedSize
				wait()
				ButtonActiveStroke.Thickness = size
				ButtonActive.Position = UDim2.new(0, size, 0, size)
				ButtonActive.Size = ButtonSettings.Size - UDim2.new(0, size * 2, 0, size * 2)
				ButtonActiveCor.CornerRadius = UDim.new(0, math.clamp(10 - size, 0, 10))
			end
			wait()
		end
	end)

	Index[activeTab+1] += 1 
	LastActiveTab = ButtonSettings.Parent.Name
end

function RenderTextBox(TextBoxSettings)
	TextBoxSettings = TextBoxSettings or {}
	TextBoxSettings.Parent = TextBoxSettings.Parent
	TextBoxSettings.Name = TextBoxSettings.Name or "Test label"
	TextBoxSettings.Value = TextBoxSettings.Value or false
	TextBoxSettings.callback = TextBoxSettings.callback or function() end

	if LastActiveTab ~= TextBoxSettings.Parent.Name then Index[activeTab+1] = 0 end

	TextBoxSettings.Parent.Size = UDim2.new(0, 400, 0, (Index[activeTab+1] + 1) * 50 + 10)
	TextBoxSettings.Position = TextBoxSettings.Position or UDim2.new(0, 10, 0, 10 + Index[activeTab+1] * 50)

	local TextBox = Instance.new("Frame")
	local TextBoxCor = Instance.new("UICorner")
	local FixFrame = Instance.new("Frame")
	local FixFrameCor = Instance.new("UICorner")
	local TextBoxText = Instance.new("TextBox")
	local TextBoxTextCor = Instance.new("UICorner")
	local TextBoxName = Instance.new("TextLabel")
	local OutLine = Instance.new("Frame")
	local OutLineCorner = Instance.new("UICorner")

	local idx = Index[activeTab+1]

	TextBox.Name = "TextBox"
	TextBox.Parent = TextBoxSettings.Parent
	TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	TextBox.Position = TextBoxSettings.Position
	TextBox.Size = UDim2.new(0, 387, 0, 40)
	TextBox.ZIndex = 4
	TextBoxCor.CornerRadius = UDim.new(0, 10)
	TextBoxCor.Parent = TextBox

	FixFrame.Name = "FixFrame"
	FixFrame.Parent = TextBox
	FixFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	FixFrame.BackgroundTransparency = 0
	FixFrame.BorderColor3 = Color3.fromRGB(96, 135, 171)
	FixFrame.BorderSizePixel = 0
	FixFrame.Position = UDim2.new(0, 10, 0, 23)
	FixFrame.Size = UDim2.new(0, 25, 0, 15)
	FixFrame.ZIndex = 5
	FixFrameCor.Parent = FixFrame
	FixFrameCor.CornerRadius = UDim.new(0, 10)

	TextBoxText.Name = "TextBox"
	TextBoxText.Parent = TextBox
	TextBoxText.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	TextBoxText.BackgroundTransparency = 0
	TextBoxText.BorderColor3 = Color3.fromRGB(96, 135, 171)
	TextBoxText.BorderSizePixel = 0
	TextBoxText.Position = UDim2.new(0, 20, 0, 23)
	TextBoxText.Size = UDim2.new(0, 350, 0, 15)
	TextBoxText.TextXAlignment = 0
	TextBoxText.TextColor3 = Color3.fromRGB(230, 230, 230)
	TextBoxText.Text = TextBoxSettings.Value
	TextBoxText.ZIndex = 5
	TextBoxText.MaxVisibleGraphemes = 56
	TextBoxTextCor.Parent = TextBoxText
	TextBoxTextCor.CornerRadius = UDim.new(0, 10)

	TextBoxName.Name = "Main text"
	TextBoxName.Parent = TextBox
	TextBoxName.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
	TextBoxName.BackgroundTransparency = 1.000
	TextBoxName.BorderColor3 = Color3.fromRGB(27, 42, 53)
	TextBoxName.Position = UDim2.new(0, 10, 0, 2)
	TextBoxName.Size = UDim2.new(0, 227, 0, 21)
	TextBoxName.ZIndex = 4
	TextBoxName.Font = Enum.Font.FredokaOne
	TextBoxName.Text = TextBoxSettings.Name
	TextBoxName.TextColor3 = Color3.fromRGB(222, 222, 222)
	TextBoxName.TextSize = 18.000
	TextBoxName.TextXAlignment = Enum.TextXAlignment.Left
	TextBoxName.TextYAlignment = Enum.TextYAlignment.Top

	OutLine.Name = "OutLine"
	OutLine.Parent = TextBox
	OutLine.Active = true
	OutLine.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
	OutLine.BackgroundTransparency = 0.500
	OutLine.Position = UDim2.new(0, -1, 0, -1)
	OutLine.Size = UDim2.new(0, 389, 0, 42)
	OutLine.ZIndex = 3
	OutLineCorner.CornerRadius = UDim.new(0, 10)
	OutLineCorner.Parent = OutLine

	TextBoxText.FocusLost:Connect(function()
		TextBoxText.TextEditable = not DropDownOpen

		TextBoxSettings.callback(TextBoxText.Text)
		return TextBox
	end)

	Index[activeTab+1] += 1 
	LastActiveTab = TextBoxSettings.Parent.Name
	return TextBox
end

RenderButton( { Parent = Up, Name = "Unload", ParentSize = Up.Size,  Position = UDim2.new(0, 365, 0, 5), Size = UDim2.new(0, 77, 0, 26), callback = function() Menu:Destroy() Debris:AddItem(Button, 1) ebris:AddItem(ScreenGUI2, 1) end } )

--Logo
RainHub.Name = "RainHub"
RainHub.Parent = Menu
RainHub.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
RainHub.BorderColor3 = Color3.fromRGB(96, 135, 171)
RainHub.BorderSizePixel = 0
RainHub.Position = UDim2.new(0, 1, 0, 0)
RainHub.Size = UDim2.new(0, 158, 0, 55)
RainHub.ZIndex = 2

UICorner_5.CornerRadius = UDim.new(0, 10)
UICorner_5.Parent = RainHub

Frame_2.Parent = RainHub
Frame_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0, 0, 0.672727287, 0)
Frame_2.Size = UDim2.new(0, 100, 0, 18)
Frame_2.ZIndex = 2

outline.Name = "outline"
outline.Parent = RainHub
outline.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
outline.Position = UDim2.new(0.632911384, 0, 0.198945478, 0)
outline.Size = UDim2.new(0, 59, 0, 45)

UICorner_6.CornerRadius = UDim.new(0, 10)
UICorner_6.Parent = outline

outline_2.Name = "outline"
outline_2.Parent = RainHub
outline_2.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
outline_2.BorderSizePixel = 0
outline_2.Position = UDim2.new(0, 0, 0.818181813, 0)
outline_2.Size = UDim2.new(0, 133, 0, 11)

Rain.Name = "Rain"
Rain.Parent = RainHub
Rain.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Rain.BackgroundTransparency = 1.000
Rain.Position = UDim2.new(0, -41, 0, 2)
Rain.Size = UDim2.new(0, 180, 0, 48)
Rain.ZIndex = 4
Rain.Font = Enum.Font.Fantasy
Rain.Text = "Rain"
Rain.TextColor3 = Color3.fromRGB(223, 223, 223)
Rain.TextSize = 32.000
Rain.TextTransparency = 0.100

Hub.Name = "Hub"
Hub.Parent = RainHub
Hub.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Hub.BackgroundTransparency = 1.000
Hub.BorderSizePixel = 0
Hub.Position = UDim2.new(0.0980134457, 0, 0.0514688194, 0)
Hub.Size = UDim2.new(0, 180, 0, 48)
Hub.ZIndex = 3
Hub.Font = Enum.Font.Fantasy
Hub.Text = "Hub"
Hub.TextColor3 = Color3.fromRGB(96, 135, 171)
Hub.TextSize = 32.000

RRain.Name = "RRain"
RRain.Parent = RainHub
RRain.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
RRain.BackgroundTransparency = 1.000
RRain.Position = UDim2.new(0, -41, 0, 2)
RRain.Size = UDim2.new(0, 180, 0, 48)
RRain.ZIndex = 3
RRain.Font = Enum.Font.Fantasy
RRain.Text = "Rain"
RRain.TextColor3 = Color3.fromRGB(129, 0, 2)
RRain.TextSize = 32.000

BRain.Name = "BRain"
BRain.Parent = RainHub
BRain.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
BRain.BackgroundTransparency = 1.000
BRain.Position = UDim2.new(0, -41, 0, 2)
BRain.Size = UDim2.new(0, 180, 0, 48)
BRain.ZIndex = 3
BRain.Font = Enum.Font.Fantasy
BRain.Text = "Rain"
BRain.TextColor3 = Color3.fromRGB(0, 52, 129)
BRain.TextSize = 32.000

coroutine.resume(coroutine.create(function()
	while task.wait() do
		local randomX = math.random(-4, 4)
		local randomY = math.random(-4, 4)
		RRain.Position = UDim2.new(0, Rain.Position.X.Offset + randomX, 0, Rain.Position.Y.Offset + randomY)
		BRain.Position = UDim2.new(0, Rain.Position.X.Offset - randomX, 0, Rain.Position.Y.Offset - randomY)
	end
end))

Cornser_func.Name = "Cornser_func"
Cornser_func.Parent = Menu
Cornser_func.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Cornser_func.BorderColor3 = Color3.fromRGB(96, 135, 171)
Cornser_func.BorderSizePixel = 0
Cornser_func.Position = UDim2.new(0, 173, 0, 56)
Cornser_func.Size = UDim2.new(0, 405, 0, 383)
Cornser_func.ZIndex = 2

UICorner_24.CornerRadius = UDim.new(0, 10)
UICorner_24.Parent = Cornser_func

outline_3.Name = "outline"
outline_3.Parent = Menu

outline_4.Name = "outline"
outline_4.Parent = outline_3
outline_4.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
outline_4.BorderSizePixel = 0
outline_4.Position = UDim2.new(0, 0, 0.157575309, 0)
outline_4.Size = UDim2.new(0, 159, 0, 1)

outline_5.Name = "outline"
outline_5.Parent = outline_3
outline_5.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
outline_5.BorderSizePixel = 0
outline_5.Position = UDim2.new(0, 0, 0.970908701, 0)
outline_5.Size = UDim2.new(0, 159, 0, 1)

outline_6.Name = "outline"
outline_6.Parent = outline_3
outline_6.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
outline_6.BorderSizePixel = 0
outline_6.Position = UDim2.new(0.263333321, 0, 0.159797564, 0)
outline_6.Size = UDim2.new(0, 1, 0, 365)

Outline_func.Name = "Outline_func"
Outline_func.Parent = outline_3
Outline_func.Active = true
Outline_func.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
Outline_func.Position = UDim2.new(0.286000013, 0, 0.122000001, 0)
Outline_func.Size = UDim2.new(0, 407, 0, 385)

UICorner_7.CornerRadius = UDim.new(0, 10)
UICorner_7.Parent = Outline_func

outline_7.Name = "outline"
outline_7.Parent = outline_3
outline_7.BackgroundColor3 = Color3.fromRGB(96, 135, 171)
outline_7.BorderSizePixel = 0
outline_7.Position = UDim2.new(0.263333321, 0, 0.0799999982, 0)
outline_7.Size = UDim2.new(0, 442, 0, 1)

Function.Name = "Function"
Function.Parent = Menu
Function.Active = true
Function.BackgroundColor3 = Color3.fromRGB(145, 145, 145)
Function.BackgroundTransparency = 1.000
Function.Position = UDim2.new(0, 170, 0, 60)
Function.Size = UDim2.new(0, 420, 0, 378)
Function.ZIndex = 2
Function.ScrollBarThickness = 8
Function.ScrollBarImageColor3 = Color3.fromRGB(96, 135, 171)
Function.ScrollingEnabled = true
Function.AutomaticCanvasSize = 3
Function.ScrollingDirection = 2
Function.CanvasSize = UDim2.new(0, 10, 0, 10)
