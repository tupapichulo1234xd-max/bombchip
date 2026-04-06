-- 🌸 SUKI HUB PRO 🌸
-- Recolector Mint & Sky

local CoreGui = game:GetService("CoreGui")

-- Evitar duplicados
if CoreGui:FindFirstChild("SukiHub") then
    CoreGui.SukiHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Title = Instance.new("TextLabel")
local CollectBtn = Instance.new("TextButton")
local MiniBtn = Instance.new("TextButton")
local Status = Instance.new("TextLabel")

-- PROTECCIÓN CORE GUI
ScreenGui.Name = "SukiHub"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- VENTANA PRINCIPAL (Estilo Rosado)
Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(255, 200, 220) -- Rosa claro
Main.Position = UDim2.new(0.1, 0, 0.4, 0)
Main.Size = UDim2.new(0, 165, 0, 115)
Main.Active = true
Main.Draggable = true
Main.BorderSizePixel = 0

UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = Main

-- BORDE ROSADO OSCURO
UIStroke.Parent = Main
UIStroke.Thickness = 3
UIStroke.Color = Color3.fromRGB(255, 50, 150)

-- TÍTULO
Title.Parent = Main
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Font = Enum.Font.GothamBold
Title.Text = "🌸 SUKI HUB 🌸"
Title.TextColor3 = Color3.fromRGB(100, 20, 60)
Title.TextSize = 14

-- BOTÓN MINIMIZAR
MiniBtn.Parent = Main
MiniBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 150)
MiniBtn.Position = UDim2.new(0.8, 0, 0.08, 0)
MiniBtn.Size = UDim2.new(0, 20, 0, 20)
MiniBtn.Font = Enum.Font.GothamBold
MiniBtn.Text = "-"
MiniBtn.TextColor3 = Color3.new(1,1,1)

local MC = Instance.new("UICorner")
MC.CornerRadius = UDim.new(1, 0)
MC.Parent = MiniBtn

-- BOTÓN RECOLECTAR
CollectBtn.Parent = Main
CollectBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 160)
CollectBtn.Position = UDim2.new(0.1, 0, 0.4, 0)
CollectBtn.Size = UDim2.new(0.8, 0, 0, 35)
CollectBtn.Font = Enum.Font.GothamBold
CollectBtn.Text = "🥚 RECOLECTAR 🥚"
CollectBtn.TextColor3 = Color3.new(1,1,1)
CollectBtn.TextSize = 15

local BC = Instance.new("UICorner")
BC.CornerRadius = UDim.new(0, 12)
BC.Parent = CollectBtn

-- STATUS
Status.Parent = Main
Status.BackgroundTransparency = 1
Status.Position = UDim2.new(0, 0, 0.75, 0)
Status.Size = UDim2.new(1, 0, 0, 20)
Status.Font = Enum.Font.GothamBold
Status.Text = "✨ Listo ✨"
Status.TextColor3 = Color3.fromRGB(120, 30, 70)
Status.TextSize = 11

-- LÓGICA DE MINIMIZAR
local open = true
MiniBtn.MouseButton1Click:Connect(function()
    if open then
        Main:TweenSize(UDim2.new(0, 35, 0, 35), "Out", "Back", 0.4, true)
        CollectBtn.Visible, Status.Visible, Title.Visible = false, false, false
        MiniBtn.Text = "+"
    else
        Main:TweenSize(UDim2.new(0, 165, 0, 115), "Out", "Back", 0.4, true)
        task.wait(0.2)
        CollectBtn.Visible, Status.Visible, Title.Visible = true, true, true
        MiniBtn.Text = "-"
    end
    open = not open
end)

-- FUNCIÓN DE RECOLECCIÓN
local function recolectarHuevos()
    local Player = game.Players.LocalPlayer
    local RootPart = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    if not RootPart then return end

    local encontrados = 0
    Status.Text = "🔍 Buscando..."
    Status.TextColor3 = Color3.fromRGB(100, 20, 60)

    for _, obj in pairs(game.Workspace:GetDescendants()) do
        if obj.Name == "EggEaster" or obj.Name:match("Egg%d+") or (obj.Parent and obj.Parent.Name == "MoneyMaker") then
            if (obj:IsA("BasePart") or obj:IsA("MeshPart")) and obj:FindFirstChildOfClass("TouchTransmitter") then
                firetouchinterest(RootPart, obj, 0)
                task.wait()
                firetouchinterest(RootPart, obj, 1)
                encontrados = encontrados + 1
            end
        end
    end

    if encontrados > 0 then
        Status.Text = "✅ Conseguidos: " .. encontrados
        Status.TextColor3 = Color3.fromRGB(0, 150, 80)
    else
        Status.Text = "❌ Ni ahí"
        Status.TextColor3 = Color3.fromRGB(200, 50, 50)
    end
end

CollectBtn.MouseButton1Click:Connect(recolectarHuevos)
