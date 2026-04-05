--==================================
-- JOLLY EXECUTOR 💜
--==================================

if game.CoreGui:FindFirstChild("JollyExecutor") then
    game.CoreGui.JollyExecutor:Destroy()
end

----------------
-- LOADER TRANSPARENTE
----------------

local gui = Instance.new("ScreenGui")
gui.Name = "JollyExecutor"
gui.Parent = game.CoreGui

local title = Instance.new("TextLabel", gui)
title.Size = UDim2.new(0,260,0,60)
title.Position = UDim2.new(0.5,-130,0.45,0)
title.BackgroundTransparency = 1
title.Text = "Jolly Executor 🥷"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255,120,255)

local loading = Instance.new("TextLabel", gui)
loading.Size = UDim2.new(0,260,0,40)
loading.Position = UDim2.new(0.5,-130,0.55,0)
loading.BackgroundTransparency = 1
loading.Text = "Loading..."
loading.TextScaled = true
loading.Font = Enum.Font.Gotham
loading.TextColor3 = Color3.fromRGB(255,180,255)

task.wait(3)
gui:Destroy()

----------------
-- SCRIPT ORIGINAL
----------------

loadstring(game:HttpGet(
"https://pastebin.com/raw/my0SXZ0u"
))()

----------------
-- JOLLY STYLE SYSTEM 💜
----------------

task.spawn(function()
	while task.wait(1) do
		for _,v in pairs(game.CoreGui:GetDescendants()) do

			-- CAMBIAR TEXTO
			if v:IsA("TextLabel") or v:IsA("TextButton") then
				if string.find(string.lower(v.Text),"recolector") then
					v.Text = "Jolly Farm ❤️"
				end
			end

			-- MORADO
			if v:IsA("Frame") then
				v.BackgroundColor3 = Color3.fromRGB(170,60,255)
			end

			-- BOTONES ROSA
			if v:IsA("TextButton") then
				v.BackgroundColor3 = Color3.fromRGB(255,90,200)
				v.TextColor3 = Color3.new(1,1,1)
			end

			-- LETRAS
			if v:IsA("TextLabel") then
				v.TextColor3 = Color3.fromRGB(255,180,255)
			end
		end
	end
end)

----------------
-- BOTÓN FLOTANTE 🥷
----------------

local floatGui = Instance.new("ScreenGui", game.CoreGui)

local btn = Instance.new("TextButton", floatGui)
btn.Size = UDim2.new(0,60,0,60)
btn.Position = UDim2.new(0,30,0.6,0)
btn.BackgroundColor3 = Color3.fromRGB(200,80,255)
btn.Text = "🥷"
btn.TextScaled = true
btn.Draggable = true
btn.Active = true

btn.MouseButton1Click:Connect(function()
	print("Jolly Executor activo 💜")
end)
