--// ULTRA PANEL GOD V5 ☠️

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local root = character:WaitForChild("HumanoidRootPart")

player.CharacterAdded:Connect(function(char)
	character = char
	humanoid = char:WaitForChild("Humanoid")
	root = char:WaitForChild("HumanoidRootPart")
end)

--------------------------------------------------
-- GUI
--------------------------------------------------

local gui = Instance.new("ScreenGui",game.CoreGui)
gui.ResetOnSpawn = false

--------------------------------------------------
-- ☠️ BOLITA
--------------------------------------------------

local skull = Instance.new("TextButton",gui)
skull.Size = UDim2.new(0,60,0,60)
skull.Position = UDim2.new(0,20,0.5,-30)
skull.Text="☠️"
skull.TextScaled=true
skull.BackgroundColor3=Color3.fromRGB(120,0,200)
skull.Draggable=true

--------------------------------------------------
-- PANEL
--------------------------------------------------

local panel = Instance.new("Frame",gui)
panel.Size = UDim2.new(0,320,0,420)
panel.Position = UDim2.new(0.5,-160,0.5,-210)
panel.BackgroundColor3=Color3.new(0,0,0)
panel.Visible=false
panel.Active=true
panel.Draggable=true

local title = Instance.new("TextLabel",panel)
title.Size=UDim2.new(1,0,0,40)
title.Text="ULTRA PANEL GOD V5 ☠️"
title.TextColor3=Color3.fromRGB(0,255,120)
title.BackgroundTransparency=1
title.TextScaled=true

skull.MouseButton1Click:Connect(function()
	panel.Visible=not panel.Visible
end)

--------------------------------------------------
-- BOTONES
--------------------------------------------------

local function crearBoton(txt,pos)
	local b=Instance.new("TextButton",panel)
	b.Size=UDim2.new(0.9,0,0,40)
	b.Position=UDim2.new(0.05,0,0,pos)
	b.BackgroundColor3=Color3.fromRGB(25,25,25)
	b.TextColor3=Color3.fromRGB(0,255,120)
	b.TextScaled=true
	b.Text=txt
	return b
end

local god=crearBoton("GOD OFF",50)
local invis=crearBoton("INVISIBLE OFF",95)
local fly=crearBoton("FLY OFF",140)
local noclip=crearBoton("NOCLIP OFF",185)
local espbtn=crearBoton("ESP OFF",230)
local aura=crearBoton("KILL AURA OFF",275)
local scan=crearBoton("S SCAN PLAYERS",320)

--------------------------------------------------
-- GOD
--------------------------------------------------

local godon=false
god.MouseButton1Click:Connect(function()
	godon=not godon
	god.Text=godon and "GOD ON" or "GOD OFF"

	if godon then
		humanoid.Health=math.huge
	end
end)

--------------------------------------------------
-- INVISIBLE
--------------------------------------------------

local invisOn=false
invis.MouseButton1Click:Connect(function()
	invisOn=not invisOn
	invis.Text=invisOn and "INVISIBLE ON" or "INVISIBLE OFF"

	for _,v in pairs(character:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Transparency=invisOn and 1 or 0
		end
	end
end)

--------------------------------------------------
-- FLY
--------------------------------------------------

local flying=false
local bv

fly.MouseButton1Click:Connect(function()
	flying=not flying
	fly.Text=flying and "FLY ON" or "FLY OFF"

	if flying then
		bv=Instance.new("BodyVelocity",root)
		bv.MaxForce=Vector3.new(99999,99999,99999)

		RunService.RenderStepped:Connect(function()
			if flying then
				bv.Velocity=workspace.CurrentCamera.CFrame.LookVector*70
			end
		end)
	else
		if bv then bv:Destroy() end
	end
end)

--------------------------------------------------
-- NOCLIP
--------------------------------------------------

local noclipOn=false

noclip.MouseButton1Click:Connect(function()
	noclipOn=not noclipOn
	noclip.Text=noclipOn and "NOCLIP ON" or "NOCLIP OFF"
end)

RunService.Stepped:Connect(function()
	if noclipOn then
		for _,v in pairs(character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide=false
			end
		end
	end
end)

--------------------------------------------------
-- ESP VERDE
--------------------------------------------------

local espOn=false

local function crearESP(plr)
	if plr==player then return end
	if not plr.Character then return end

	local h=Instance.new("Highlight",plr.Character)
	h.FillColor=Color3.fromRGB(0,255,0)
	h.OutlineColor=Color3.fromRGB(0,255,0)
	h.Name="ESP"
end

espbtn.MouseButton1Click:Connect(function()
	espOn=not espOn
	espbtn.Text=espOn and "ESP ON" or "ESP OFF"

	for _,p in pairs(Players:GetPlayers()) do
		if espOn then
			crearESP(p)
		else
			if p.Character and p.Character:FindFirstChild("ESP") then
				p.Character.ESP:Destroy()
			end
		end
	end
end)

--------------------------------------------------
-- KILL AURA
--------------------------------------------------

local auraOn=false

aura.MouseButton1Click:Connect(function()
	auraOn=not auraOn
	aura.Text=auraOn and "KILL AURA ON" or "KILL AURA OFF"
end)

RunService.Heartbeat:Connect(function()
	if auraOn then
		for _,p in pairs(Players:GetPlayers()) do
			if p~=player and p.Character and p.Character:FindFirstChild("Humanoid") then
				if (p.Character.HumanoidRootPart.Position-root.Position).Magnitude<15 then
					p.Character.Humanoid.Health=0
				end
			end
		end
	end
end)

--------------------------------------------------
-- SCAN PLAYERS (S)
--------------------------------------------------

scan.MouseButton1Click:Connect(function()
	for _,p in pairs(Players:GetPlayers()) do
		print("PLAYER:",p.Name)
	end
end)

--------------------------------------------------
-- TP PLAYER V5
--------------------------------------------------

local tpFrame=Instance.new("Frame",panel)
tpFrame.Size=UDim2.new(0,150,0,350)
tpFrame.Position=UDim2.new(1,10,0,50)
tpFrame.BackgroundTransparency=1

local layout=Instance.new("UIListLayout",tpFrame)

local function refreshTP()

	for _,v in pairs(tpFrame:GetChildren()) do
		if v:IsA("TextButton") then v:Destroy() end
	end

	for _,p in pairs(Players:GetPlayers()) do
		if p~=player then

			local b=Instance.new("TextButton",tpFrame)
			b.Size=UDim2.new(1,0,0,30)
			b.Text=p.Name
			b.BackgroundColor3=Color3.fromRGB(20,20,20)
			b.TextColor3=Color3.fromRGB(0,255,120)

			b.MouseButton1Click:Connect(function()
				if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
					root.CFrame=p.Character.HumanoidRootPart.CFrame+Vector3.new(0,3,0)
				end
			end)

		end
	end
end

Players.PlayerAdded:Connect(refreshTP)
Players.PlayerRemoving:Connect(refreshTP)

refreshTP()

--------------------------------------------------
-- PRÓXIMO
--------------------------------------------------

for i=1,5 do
	local l=Instance.new("TextLabel",panel)
	l.Size=UDim2.new(0,80,0,20)
	l.Position=UDim2.new(1,-90,0,350+(i*15))
	l.BackgroundTransparency=1
	l.Text="PRÓXIMO"
	l.TextColor3=Color3.fromRGB(0,255,120)
	l.TextScaled=true
end
