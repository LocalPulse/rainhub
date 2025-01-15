repeat  task.wait() until game:IsLoaded()

if game.PlaceId == 8304191830 then
    repeat task.wait() until game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name)
    repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("collection"):FindFirstChild("grid"):FindFirstChild("List"):FindFirstChild("Outer"):FindFirstChild("UnitFrames")
else
    repeat task.wait() until game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name)
end

local MenuLib = loadstring(game:HttpGet("https://pastebin.com/raw/8BAxGjk3"))()

local name = game:GetService("Players").LocalPlayer.Name
local CfgLocate = "RainHub/Settings/Cfg_" .. name .. ".json"

makefolder("RainHub")
makefolder("RainHub/Settings")

local SaveData = {
	["EnableAutoFarm"] = false,
	["AutoReplay"] = false,
	["AutoLeave"] = false,
	["AutoNext"] = false,
    ["LimitFarm"] = false,
    ["Limitgems"] = 0,
    ["LimitLVL"] = 0,
    ["LimitEpicStar"] = 0,
    ["LimitPinkStar"] = 0,
    ["LimitRedStar"] = 0,
    ["LimitGreenStar"] = 0,
    ["LimitBlueStar"] = 0,
    ["LimitRainbowStar"] = 0,
    ["LimitRikuganEye"] = 0,
    ["LimitCursedOrb"] = 0,
    ["LimitPowerCell"] = 0,
    ["LimitEchantedMagicStone"] = 0,
    ["LimitCursedMagicStone"] = 0,
    ["LimitSoulTiel"] = 0,
    ["LimitSoulToshe"] = 0,
    ["LimitSoulWes"] = 0,
    ["LimitSoulBarrago"] = 0,
    ["LimitSoulGing"] = 0,
	["LimitSoulWorthy"] = 0,
    ["LimitDISCBlue"] = 0,
    ["LimitDISCGreen"] = 0,
    ["LimitDISCOrange"] = 0,
    ["LimitDISCPink"] = 0,
    ["LimitDISCPurple"] = 0,
    ["LimitDISCBlack"] = 0,
    ["LimitFullPowerCore"] = 0,
    ["LimitTomoe"] = 0,
	["Anywhere"] = false,
	["DeleteMap"] = false,
	["HideName"] = false,
	["AutoStart"] = false,
	["AutoSkip"] = false,
	["Unfocused"] = false,
	["UnfocusedSaveGpu"] = false,
	["FocusedFps"] = 60,
	["UnfocusedFps"] = 30,
    ["WebHook"] = false,
    ["WebHookURL"] = "",
	["AutoFuncsLobby"] = {false, false, false, false},
	["AutoBuy"] = {false, false, false}
}

if not isfile(CfgLocate) then 
    local json = game:GetService("HttpService"):JSONEncode(SaveData)
    writefile(CfgLocate, json)
end

local jsonData = readfile(CfgLocate)
local LoadData = game:GetService("HttpService"):JSONDecode(jsonData)

function Save()
	local json = game:GetService("HttpService"):JSONEncode(LoadData)
    writefile(CfgLocate, json)
end

local Farm = RenderTab( "Farm" )
local Macros = RenderTab( "Macro" )
local FarmSettings = RenderTab( "Farm Settings" )
local Extra = RenderTab( "Extra func" ) 

RenderCheckBox( { Parent = Farm, Name = "Enable auto farm", Comment = "Active auto farm functions", Value = LoadData.EnableAutoFarm, callback = function(V) LoadData.EnableAutoFarm = V Save() end } )
RenderCheckBox( { Parent = Farm, Name = "Auto replay", Comment = "Automatic press replay", Value = LoadData.AutoReplay, callback = function(V) LoadData.AutoReplay = V Save() end } )
RenderCheckBox( { Parent = Farm, Name = "Auto leave", Comment = "Automatic press leave", Value = LoadData.AutoLeave, callback = function(V) LoadData.AutoLeave = V Save() end } )
RenderCheckBox( { Parent = Farm, Name = "Auto next", Comment = "Automatic press next", Value = LoadData.AutoNext, callback = function(V) LoadData.AutoNext = V Save() end } )

local ListCfgs = listfiles("RainHub/Settings/")
local angiaon = 1
RenderDropDown( { Parent = Macros, Name = "Configs", Comment = "", Textlist = ListCfgs, Value = angiaon, callback = function(V) angiaon= V end } )

RenderCheckBox( { Parent = FarmSettings, Name = "Enable limit farm", Comment = "", Value = LoadData.LimitFarm, callback = function(V) LoadData.LimitFarm = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "Limit Gems", Comment = "", Value = LoadData.Limitgems, Min = 0, Max = 10000, callback = function(V) LoadData.Limitgems = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "Limit LVL", Comment = "", Value = LoadData.LimitLVL, Min = 0, Max = 200, callback = function(V) LoadData.LimitLVL = V  Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "Epic star", Comment = "", Value = LoadData.LimitEpicStar, Min = 0, Max = 100, callback = function(V) LoadData.LimitEpicStar = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "Pink star", Comment = "", Value = LoadData.LimitPinkStar, Min = 0, Max = 75, callback = function(V) LoadData.LimitPinkStar = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "Red star", Comment = "", Value = LoadData.LimitRedStar, Min = 0, Max = 75, callback = function(V) LoadData.LimitRedStar = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "Green star", Comment = "", Value = LoadData.LimitGreenStar, Min = 0, Max = 75, callback = function(V) LoadData.LimitGreenStar = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "Blue star", Comment = "", Value = LoadData.LimitBlueStar, Min = 0, Max = 75, callback = function(V) LoadData.LimitBlueStar = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "Rainbow star", Comment = "", Value = LoadData.LimitRainbowStar, Min = 0, Max = 25, callback = function(V) LoadData.LimitRainbowStar = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "Rikugan Eye", Comment = "", Value = LoadData.LimitRikuganEye, Min = 0, Max = 10000, callback = function(V) LoadData.LimitRikuganEye = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "Cursed Orb", Comment = "", Value = LoadData.LimitCursedOrb, Min = 0, Max = 10000, callback = function(V) LoadData.LimitCursedOrb = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "Power Cell", Comment = "", Value = LoadData.LimitPowerCell, Min = 0, Max = 10000, callback = function(V) LoadData.LimitPowerCell = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "Enchanted Magic Stone", Comment = "", Value = LoadData.LimitEchantedMagicStone, Min = 0, Max = 10000, callback = function(V) LoadData.LimitEchantedMagicStone = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "Cursed Magic Stone", Comment = "", Value = LoadData.LimitCursedMagicStone, Min = 0, Max = 10000, callback = function(V) LoadData.LimitCursedMagicStone = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "Soul (Tiel)", Comment = "", Value = LoadData.LimitSoulTiel, Min = 0, Max = 10000, callback = function(V) LoadData.LimitSoulTiel = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "Soul (Toshe)", Comment = "", Value = LoadData.LimitSoulToshe, Min = 0, Max = 10000, callback = function(V) LoadData.LimitSoulToshe = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "Soul (Wes)", Comment = "", Value = LoadData.LimitSoulWes, Min = 0, Max = 10000, callback = function(V) LoadData.LimitSoulWes = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "Soul (Barrago)", Comment = "", Value = LoadData.LimitSoulBarrago, Min = 0, Max = 10000, callback = function(V) LoadData.LimitSoulBarrago = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "Soul (Ging)", Comment = "", Value = LoadData.LimitSoulGing, Min = 0, Max = 10000, callback = function(V) LoadData.LimitSoulGing = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "Soul (Worthy)", Comment = "", Value = LoadData.LimitSoulWorthy, Min = 0, Max = 10000, callback = function(V) LoadData.LimitSoulWorthy = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "DISC (Blue)", Comment = "", Value = LoadData.LimitDISCBlue, Min = 0, Max = 10000, callback = function(V) LoadData.LimitDISCBlue = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "DISC (Green)", Comment = "", Value = LoadData.LimitDISCGreen, Min = 0, Max = 10000, callback = function(V) LoadData.LimitDISCGreen = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "DISC (Orange)", Comment = "", Value = LoadData.LimitDISCOrange, Min = 0, Max = 10000, callback = function(V) LoadData.LimitDISCOrange = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "DISC (Pink)", Comment = "", Value = LoadData.LimitDISCPink, Min = 0, Max = 10000, callback = function(V) LoadData.LimitDISCPink = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "DISC (Purple)", Comment = "", Value = LoadData.LimitDISCPurple, Min = 0, Max = 10000, callback = function(V) LoadData.LimitDISCPurple = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "DISC (Black)", Comment = "", Value = LoadData.LimitDISCBlack, Min = 0, Max = 10000, callback = function(V) LoadData.LimitDISCBlack = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "Full Power Core", Comment = "", Value = LoadData.LimitFullPowerCore, Min = 0, Max = 10000, callback = function(V) LoadData.LimitFullPowerCore = V Save() end } )
RenderSlider( { Parent = FarmSettings, Name = "Tomoe", Comment = "", Value = LoadData.LimitTomoe, Min = 0, Max = 10000, callback = function(V) LoadData.LimitTomoe = V Save() end } )


RenderCheckBox( { Parent = Extra, Name = "Anywhere place", Comment = "", Value = LoadData.Anywhere, callback = function(V) LoadData.Anywhere = V Save() end } )
RenderCheckBox( { Parent = Extra, Name = "Delete map", Comment = "", Value = LoadData.DeleteMap, callback = function(V) LoadData.DeleteMap = V Save() end } )
RenderCheckBox( { Parent = Extra, Name = "Hide name", Comment = "", Value = LoadData.HideName, callback = function(V) LoadData.HideName = V Save() end } )
RenderCheckBox( { Parent = Extra, Name = "Auto start", Comment = "Automatic press start", Value = LoadData.AutoStart, callback = function(V) LoadData.AutoStart = V Save() end } )
RenderCheckBox( { Parent = Extra, Name = "Auto skip", Comment = "Automatic press skip", Value = LoadData.AutoSkip, callback = function(V) LoadData.AutoSkip = V Save() end } )
RenderCheckBox( { Parent = Extra, Name = "Enable unfocused settings", Comment = "Need fps unlocker", Value = LoadData.Unfocused, callback = function(V) LoadData.Unfocused = V Save() end } )
RenderCheckBox( { Parent = Extra, Name = "Save gpu when unfocused roblox", Comment = "Disable render when unfocus", Value = LoadData.UnfocusedSaveGpu, callback = function(V) LoadData.UnfocusedSaveGpu = V Save() end } )
RenderSlider( { Parent = Extra, Name = "Focused fps", Comment = ""--[["Fps when active window roblox"]], Value = LoadData.FocusedFps, Min = 1, Max = 180, callback = function(V) LoadData.FocusedFps = V Save() end } )
RenderSlider( { Parent = Extra, Name = "Unfocused fps", Comment = ""--[["Fps when hide roblox window"]], Value = LoadData.UnfocusedFps, Min = 1, Max = 180, callback = function(V) LoadData.UnfocusedFps = V Save() end } )
RenderCheckBox( { Parent = Extra, Name = "WebHook", Comment = "Send message to server Discord", Value = LoadData.WebHook, callback = function(V) LoadData.WebHook = V Save() end } )
RenderTextBox( { Parent = Extra, Name = "WebHookURL", Value = LoadData.WebHookURL, callback = function(V) LoadData.WebHookURL = V Save() end } )


if game.PlaceId == 8304191830 then -- lobby
	local Lobby = RenderTab( "Lobby settings" )

	RenderMultiDropDown( { Parent = Lobby, Name = "Auto claim and take", Comment = "", Textlist = {"Auto claim quest reward", "Auto take quests", "Auto claim daily reward", "Auto claim battlepass reward"},
	Value = LoadData.AutoFuncsLobby, callback = function(V) LoadData.AutoFuncsLobby = V end } )
	RenderButton( { Parent = Lobby, Name = "Reedem all codes", callback = function() 
		local codes = { "FictioNTheFirst", "SubToKelvingts", "TOADBOIGAMING", "KingLuffy", "subtosnowrbx", "noclypso", 
		"SubToBlamspot", "Cxrsed", "UCHIHA", "SINS", "SINS2" }

		for i , v in pairs(codes) do
			game:GetService("ReplicatedStorage").endpoints.client_to_server.redeem_code:InvokeServer(v)
			wait()
		end 
	end } )
end

--[[
RenderCheckBox( { Parent = MainTab, Name = "Auto Join", Comment = "automatic connection to map", Value = Active, callback = function(AutoJoin) Active = V end } )

local SliderInt = 8
RenderSlider( { Parent = MainTab, Name = "test slider", Comment = "Test comments", Value = SliderInt, Min = 0, Max = 100, callback = function(V) SliderInt = V end } )

local DropDownText = {"Story Mode", "Infinity Mode", "Castle Mode", "Raid Mode", "Challeng Mode", "Legend Mode", "Portal Mode", "Dangeon Mode"}
local DropDownResult = 1
local DropDown = 0
RenderDropDown( { Parent = MainTab, Name = "DropDown test", Comment = "Test comment DropDown", Textlist = DropDownText, Value = DropDownResult, callback = function(V) DropDownResult = V end } )

local DropDownText = {"Story Mode", "Infinity Mode", "Castle Mode", "Raid Mode", "Challeng Mode", "Legend Mode", "Portal Mode", "Dangeon Mode"}
local DropDownActive = {true, false, false, true, true, true, false, false, true, true}
RenderMultiDropDown( { Parent = MainTab, Name = "MultiDropDown test", Comment = "Test comment DropDown", Textlist = DropDownText, Value = DropDownActive, callback = function(V) DropDownActive = V end } )
]]

local PlayerGUI = game:GetService("Players").LocalPlayer.PlayerGui
local name = game:GetService("Players").LocalPlayer.Name
local Map_Difficulty, Map_level, XP, gems, waves, ttime, sec_plus_min, avg_gems, avg_XP, cur_lvl_XP, Ftime, Map = ""
local LastItem = ""
local ListItems = {}
local EndFarm, sended, delete, havedailyquest, takebattlepass, getquest = false
local ID = 1
local QuestsID = {}
local count = ""
local Timer = 0

function CheckFarmLimit()
    if LoadData.LimitFarm == true then
		local LVL_text = tostring(game.Players.LocalPlayer.PlayerGui.spawn_units.Lives.Main.Desc.Level.Text)
		local LVL = 0
		for i = 0, #LVL_text do
			if LVL_text[i] == "[" then
				LVL = tonumber(lvl_text:sub(0, i-1))
			end
		end

        if LoadData.Limitgems > 0 and LoadData.LimitLVL >= LVL and LoadData.LimitEpicStar > 0 and LoadData.LimitPinkStar > 0 and LoadData.LimitRedStar > 0 and LoadData.LimitGreenStar > 0 and 
			LoadData.LimitBlueStar > 0 and LoadData.LimitRainbowStar > 0 and LoadData.LimitRikuganEye > 0 and LoadData.LimitCursedOrb > 0 and LoadData.LimitPowerCell > 0 and LoadData.LimitEchantedMagicStone > 0 and 
			LoadData.LimitCursedMagicStone > 0 and LoadData.LimitSoulTiel > 0 and LoadData.LimitSoulToshe > 0 and LoadData.LimitSoulWes > 0 and LoadData.LimitSoulBarrago > 0 and LoadData.LimitSoulGing > 0 and 
			LoadData.LimitDISCBlue > 0 and LoadData.LimitDISCGreen > 0 and LoadData.LimitDISCOrange > 0 and LoadData.LimitDISCPink > 0 and LoadData.LimitDISCPurple > 0 and LoadData.LimitDISCBlack > 0 and 
			LoadData.LimitFullPowerCore > 0 and LoadData.LimitTomoe > 0 then
				EndFarm = true
		end
    end
end

function ItemCalculator(Items)
	for ItemDrop = 1, #Items do
		for i = 0, #Items[ItemDrop] do
			if tonumber(string.sub(Items[ItemDrop], i, i)) then
				count ..= string.sub(Items[ItemDrop], i, i)
			end
		end

		warn(count)
		if string.sub(Items[ItemDrop], 0, #("Star Fruit (")) == "Star Fruit (" then
			LoadData.LimitEpicStar -= count
		elseif string.sub(Items[ItemDrop], 0, #("Star Fruit (Red)")) == "Star Fruit (Red)" then
			LoadData.LimitRedStar -= count
		elseif string.sub(Items[ItemDrop], 0, #("Star Fruit (Pink)")) == "Star Fruit (Pink)" then
			LoadData.LimitPinkStar -= count
		elseif string.sub(Items[ItemDrop], 0, #("Star Fruit (Green)")) == "Star Fruit (Green)" then
			LoadData.LimitGreenStar -= count
		elseif string.sub(Items[ItemDrop], 0, #("Star Fruit (Blue)")) == "Star Fruit (Blue)" then
			LoadData.LimitBlueStar -= count
		elseif string.sub(Items[ItemDrop], 0, #("Star Fruit (Rainbow)")) == "Star Fruit (Rainbow)" then
			LoadData.LimitRainbowStar -= count
		elseif string.sub(Items[ItemDrop], 0, #("Rikugan Eye")) == "Rikugan Eye" then
			LoadData.LimitRikuganEye -= count
		elseif string.sub(Items[ItemDrop], 0, #("Cursed Orb")) == "Cursed Orb" then
			LoadData.LimitCursedOrb -= count
		elseif string.sub(Items[ItemDrop], 0, #("Power Cell")) == "Power Cell" then
			LoadData.LimitPowerCell -= count
		elseif string.sub(Items[ItemDrop], 0, #("Enchanted Magic Stone")) == "Enchanted Magic Stone" then
			LoadData.LimitEchantedMagicStone -= count
		elseif string.sub(Items[ItemDrop], 0, #("Cursed Magic Stone")) == "Cursed Magic Stone" then
			LoadData.LimitCursedMagicStone -= count
		elseif string.sub(Items[ItemDrop], 0, #("Soul (Tiel)")) == "Soul (Tiel)" then
			LoadData.LimitSoulTiel -= count
		elseif string.sub(Items[ItemDrop], 0, #("Soul (Toshe)")) == "Soul (Toshe)" then
			LoadData.LimitSoulToshe -= count
		elseif string.sub(Items[ItemDrop], 0, #("Soul (Wes)")) == "Soul (Wes)" then
			LoadData.LimitSoulWes -= count
		elseif string.sub(Items[ItemDrop], 0, #("Soul (Barrago)")) == "Soul (Barrago)" then
			LoadData.LimitSoulBarrago -= count
		elseif string.sub(Items[ItemDrop], 0, #("Soul (Ging)")) == "Soul (Ging)" then
			LoadData.LimitSoulGing -= count
		elseif string.sub(Items[ItemDrop], 0, #("Worthy Soul")) == "Worthy Soul" then
			LoadData.LimitSoulWorthy = math.clamp(LoadData.LimitSoulWorthy - tonumber(count), 0, 10000)
		elseif string.sub(Items[ItemDrop], 0, #("DISC (Blue)")) == "DISC (Blue)" then
			LoadData.LimitDISCBlue -= count
		elseif string.sub(Items[ItemDrop], 0, #("DISC (Green)")) == "DISC (Green)" then
			LoadData.LimitDISCGreen -= count
		elseif string.sub(Items[ItemDrop], 0, #("DISC (Orange)")) == "DISC (Orange)" then
			LoadData.LimitDISCOrange -= count
		elseif string.sub(Items[ItemDrop], 0, #("DISC (Pink)")) == "DISC (Pink)" then
			LoadData.LimitDISCPink -= count
		elseif string.sub(Items[ItemDrop], 0, #("DISC (Purple)")) == "DISC (Purple)" then
			LoadData.LimitDISCPurple -= count
		elseif string.sub(Items[ItemDrop], 0, #("DISC (Black)")) == "DISC (Black)" then
			LoadData.LimitDISCBlack -= count
		elseif string.sub(Items[ItemDrop], 0, #("Full Power Core")) == "Full Power Core" then
			LoadData.LimitFullPowerCore -= count
		elseif string.sub(Items[ItemDrop], 0, #("Tomoe")) == "Tomoe" then
			LoadData.LimitTomoe -= count
		end
	end
	Save()
end

function FucusedUnFocused()
		game:GetService("UserInputService").WindowFocusReleased:Connect(function()
			if LoadData.Unfocused == true then
				if LoadData.UnfocusedSaveGpu == true then
					game:GetService("RunService"):Set3dRenderingEnabled(false)
				end

				setfpscap(LoadData.UnfocusedFps)
			end
		end)

		game:GetService("UserInputService").WindowFocused:Connect(function()
			if LoadData.Unfocused == true then
				if LoadData.UnfocusedSaveGpu == true then
					game:GetService("RunService"):Set3dRenderingEnabled(true)
				end

				setfpscap(LoadData.FocusedFps)
			end
		end)
end

function Extra()
	if LoadData.HideName and game.Players.LocalPlayer.Character.Head:FindFirstChild("_overhead") then
		workspace[game.Players.LocalPlayer.Name].Head["_overhead"]:Destroy()
	end
	if game.PlaceId == 8349889591 then
		if LoadData.AutoStart and game:GetService("Workspace")["_waves_started"].Value == false then
			game:GetService("ReplicatedStorage").endpoints["client_to_server"]["vote_start"]:InvokeServer()
		end

		if LoadData.AutoSkip and PlayerGUI.VoteSkip.Holder.Active then
			game:GetService("ReplicatedStorage").endpoints["client_to_server"]["vote_wave_skip"]:InvokeServer()
		end

		if LoadData.Anywhere then
			require(game:GetService("ReplicatedStorage"):WaitForChild("src").client.Services.PlacementServiceClient).can_place = true
		end

		if LoadData.DeleteMap and not delete then
			local hill = game:GetService("Workspace")["_terrain"].hill:GetChildren()
			local terrain = game:GetService("Workspace")["_terrain"].terrain:GetChildren()
			local ground = game:GetService("Workspace")["_map"]:GetChildren()
			local Barrier = game:GetService("Workspace")["_barrier"]:GetChildren()

			for i = 1, #hill do
				hill[i].CanCollide = false
			end

			for i = 1, #terrain do
				terrain[i]:Destroy()
			end

			for i = 1, #ground do
				ground[i]:Destroy()
			end

			for i = 1, #Barrier do
				Barrier[i].CanCollide = false
				Barrier[i].Transparency = 1
			end

			delete = true
		end
	end
end

function calculate(curlvl, maxlvl)
	cout_xp = 0
	for count = curlvl, maxlvl, 1 do
		cout_xp += 100 + (7 * (count - 1))
	end

	return cout_xp
end

function superCoolTime(sec)
	minutes = math.floor(sec/60)
	hour = 0
	while minutes > 60 do
		hour += 1
		minutes -= 60
	end

	return tostring(hour) .. ":" .. tostring(minutes)
end

function webhook()
	Map = PlayerGUI.NewArea.holder.areaTitle.Text

	if game:GetService("Workspace")["_DATA"].GameFinished.Value == true and not sended then
		repeat task.wait() until  PlayerGUI.ResultsUI.Enabled == true
		task.wait()

		Map_Difficulty = tostring(PlayerGUI.ResultsUI.Holder.Difficulty.Text)
		Map_level = tostring(PlayerGUI.ResultsUI.Holder.LevelName.Text)
		XP = tostring(PlayerGUI.ResultsUI.Holder.LevelRewards.ScrollingFrame.XPReward.Main.Amount.Text)
		gems = tostring(PlayerGUI.ResultsUI.Holder.LevelRewards.ScrollingFrame.GemReward.Main.Amount.Text)
		cwaves = PlayerGUI.ResultsUI.Holder.Middle.WavesCompleted.Text
		ctime = PlayerGUI.ResultsUI.Holder.Middle.Timer.Text
		waves = cwaves:split(": ")
		ttime = ctime:split(": ")
		sec_plus_min = ttime[2]:sub(1, #ttime[2] - 3) * 60 + ttime[2]:sub(4, #ttime[2]) + 30
		avg_gems = gems:sub(2, #gems) / (sec_plus_min) * 60
		avg_XP = XP:sub(2, #XP - 3) / (sec_plus_min) * 60
		lvl_text = tostring(game.Players.LocalPlayer.PlayerGui.spawn_units.Lives.Main.Desc.Level.Text)
		cur_lvl = lvl_text:sub(6, 9)
		cur_lvl_XP = lvl_text:sub(#cur_lvl + 2, #lvl_text)
		
		if PlayerGUI.HatchInfo.Enabled == false and PlayerGUI.ResultsUI.Holder.Visible == true then
			local button = game.Players.LocalPlayer.PlayerGui.ResultsUI.Holder.Buttons.Next
			local events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
			for i,v in pairs(events) do
				for i,v in pairs(getconnections(button[v])) do
					v:Fire()
				end
			end
		end

		if LastItem ~= PlayerGUI.HatchInfo.holder.info1.UnitName.Text and PlayerGUI.HatchInfo.holder.info1.UnitName.Text ~= "Goku" and PlayerGUI.HatchInfo.holder.info1.UnitName.Text ~= "" then
			if #ListItems == 0 then
				table.insert(ListItems, "**Added items:** \n")
			end
			LastItem = PlayerGUI.HatchInfo.holder.info1.UnitName.Text
			table.insert(ListItems, PlayerGUI.HatchInfo.holder.info1.UnitName.Text .. " \n")

			game:GetService("VirtualInputManager"):SendMouseButtonEvent(2, 2, 0, true, game, 1)
			wait()
			game:GetService("VirtualInputManager"):SendMouseButtonEvent(2, 2, 0, false, game, 1)
        end

		if PlayerGUI.ResultsUI.Holder.Visible == false and PlayerGUI.HatchInfo.Enabled == false then
			if #ListItems == 0 then
				table.insert(ListItems, "**Added items:** \n None")
			end

			if LoadData.WebHookURL ~= "" and LoadData.WebHook == true then
				local data = {
					["content"] = "",
					["username"] = "Anime Adventures",
					["avatar_url"] = "https://tr.rbxcdn.com/e5b5844fb26df605986b94d87384f5fb/150/150/Image/Jpeg",
					["embeds"] = {
						{
							["author"] = {
								["name"] = "Anime Adventures",
								["icon_url"] = "https://cdn.discordapp.com/emojis/997123585476927558.webp?size=96&quality=lossless"
							},
							["color"] = 6326187,
							["fields"] = {
								{
									["name"] = "",
									["value"] = "**Name:** " .. name .. "\n" ..
									"**Current Level:** " .. cur_lvl_XP .. " \n" ..
									"**Current Gems:** " .. tostring(game.Players.LocalPlayer._stats.gem_amount.Value) .. " <:gem:997123585476927558> \n" ..
									"**------------------------------------------------------------------------------------------------------** \n" ..
									"**Map:** [" .. Map_Difficulty .. "] " .. Map .. " " .. Map_level .. " | waves: " .. tostring(waves[2]) .. "  | time: " .. tostring(ttime[2]) .. " \n" ..
									"**Recieved Gems:** " .. gems:sub(2, #gems) .. " | **Gems/min:** " .. tostring(avg_gems):sub(1, 6) .. " <:gem:997123585476927558> \n" ..
									"**Recieved XP:** " .. XP:sub(2, #XP - 3) .. " | **XP/min:** " .. tostring(avg_XP):sub(1, 6) .. " 🧪 \n" ..
									"**------------------------------------------------------------------------------------------------------** \n" .. 
									table.concat(ListItems)
								}
							}
						}
					}
				}
				local body_msg = game:GetService("HttpService"):JSONEncode(data)
				local headers = {["content-type"] = "application/json"}
				request = http_request or request or HttpPost or syn.request or http.request
				local send_msg = {Url = LoadData.WebHookURL, Body = body_msg, Method = "POST", Headers = headers}
				request(send_msg)
			end
			sended = true

			if LoadData.LimitFarm == true then
				LoadData.Limitgems -= tonumber(gems:sub(2, #gems))
				if #ListItems > 1 then
					ItemCalculator(ListItems)
				end
			end
		end
	end
end

function AutoFarmFuncs()
	if LoadData.EnableAutoFarm == false then return end

	if game:GetService("Workspace")["_DATA"].GameFinished.Value == true then
		if Timer >= 50 then
			local NextStory, NextRoom, Replay = false

			for _, button in pairs(PlayerGUI.ResultsUI.Finished:GetChildren()) do 
				if button.ClassName == "TextButton" then
					if button.Main.text.Text == "Replay" then
						Replay = true
					elseif button.Main.text.Text == "Next Level" then
						NextStory = true
					elseif button.Main.text.Text == "Next Room" then 
						NextRoom = true
					end
				end
			end

			if LoadData.AutoNext == true then
				if NextStory == true then
					print("3")
					local a={[1]="next_story"} game:GetService("ReplicatedStorage").endpoints.client_to_server.set_game_finished_vote:InvokeServer(unpack(a))
					local a={[1]="next_story"} game:GetService("ReplicatedStorage").endpoints.client_to_server.set_game_finished_vote:InvokeServer(unpack(a))
					Timer = 0
					return
				elseif NextRoom == true then
					print("4")
					local a={[1]="NextRetry"} game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_infinite_tower_from_game:InvokeServer(unpack(a))
					local a={[1]="NextRetry"} game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_infinite_tower_from_game:InvokeServer(unpack(a))  
					Timer = 0 
					return
				end
			elseif LoadData.AutoReplay == true and Replay then
				local a={[1]="replay"} game:GetService("ReplicatedStorage").endpoints.client_to_server.set_game_finished_vote:InvokeServer(unpack(a))
                local a={[1]="replay"} game:GetService("ReplicatedStorage").endpoints.client_to_server.set_game_finished_vote:InvokeServer(unpack(a))
				Timer = 0
				return
			elseif LoadData.AutoLeave == true then
				game:GetService("TeleportService"):Teleport(8304191830, game.Players.LocalPlayer)
				Timer = 0
				return
			end
		else
		--	Timer += math.round(60 / math.clamp(MenuLib.CurFPS, 15, 60))
			Timer += 1
		end
	end
end

function LobbyFuncs()
	if not getquest then
		for i, Children in pairs(PlayerGUI.QuestsUI.Main.Main.Main.Content.story.Scroll:GetChildren()) do
			if Children.ClassName == "Frame" then
				table.insert(QuestsID, Children.Name)
			end
		end
		for i, Children in pairs(PlayerGUI.QuestsUI.Main.Main.Main.Content.event.Scroll:GetChildren()) do
			if Children.ClassName == "Frame" then
				table.insert(QuestsID, Children.Name)
				if Children.event.Text == "Daily Mission" then
					havedailyquest = true
				end
			end
		end
		for i, Children in pairs(PlayerGUI.QuestsUI.Main.Main.Main.Content.daily.Scroll:GetChildren()) do
			if Children.ClassName == "Frame" then
				table.insert(QuestsID, Children.Name)
			end
		end
		for i, Children in pairs(PlayerGUI.QuestsUI.Main.Main.Main.Content.infinite.Scroll:GetChildren()) do
			if Children.ClassName == "Frame" then
				table.insert(QuestsID, Children.Name)
			end
		end
		getquest = true
	end

	if LoadData.AutoFuncsLobby[1] == true then
		game:GetService("ReplicatedStorage").endpoints["client_to_server"]["redeem_quest"]:InvokeServer(QuestsID[ID])

		ID += 1
		if ID == #QuestsID then
			ID = 1
		end
	end
	if LoadData.AutoFuncsLobby[2] == true and not havedailyquest then
		game:GetService("ReplicatedStorage").endpoints["client_to_server"]["accept_npc_quest"]:InvokeServer( "7ds_daily")
		havedailyquest = true
	end
	if LoadData.AutoFuncsLobby[3] == true then
		game:GetService("ReplicatedStorage").endpoints["client_to_server"]["claim_daily_reward"]:InvokeServer()
	end
	if LoadData.AutoFuncsLobby[4] == true and not takebattlepass then
		game:GetService("ReplicatedStorage").endpoints["client_to_server"]["claim_battlepass_rewards"]:InvokeServer()
		takebattlepass = true
	end
end

while game:GetService("RunService").RenderStepped:wait() do -- calling func
	coroutine.resume(coroutine.create(function()
		CheckFarmLimit()
		FucusedUnFocused()
		Extra()

		if game.PlaceId == 8349889591 then -- in game
			webhook()
			AutoFarmFuncs()
		elseif game.PlaceId == 8304191830 then -- lobby
			LobbyFuncs()
		end
	end))
end
