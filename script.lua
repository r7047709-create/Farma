--[[
    =============================================================================
    🏴‍☠️ PIRATE HUB V9 - REACH FAST ATTACK (PEGA DE LONGE NOS NPCS E PLAYERS)
    ⚡ Ataque à Distância 100 Studs + Fast Click Instantâneo
    📱 100% Otimizado para Mobile (Realme C3, Arceus X, Delta, Hydrogen)
    =============================================================================
]]

if not game:IsLoaded() then game.Loaded:Wait() end

-- Limpa execuções antigas
pcall(function()
    if _G.PH_Reach_GUI and _G.PH_Reach_GUI.Parent then
        _G.PH_Reach_GUI:Destroy()
    end
end)

_G.PH_AutoFarm = false
_G.PH_FastClick = true

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- [1. INJETOR UNIVERSAL DE TELA]
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PH_Reach_" .. math.random(1000, 9999)
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999999
_G.PH_Reach_GUI = ScreenGui

local parentUI = nil
if typeof(gethui) == "function" then
    parentUI = gethui()
elseif typeof(syn) == "table" and typeof(syn.protect_gui) == "function" then
    syn.protect_gui(ScreenGui)
    parentUI = game:GetService("CoreGui")
else
    local ok, _ = pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)
    if not ok or not ScreenGui.Parent then
        parentUI = LocalPlayer:WaitForChild("PlayerGui")
    else
        parentUI = game:GetService("CoreGui")
    end
end
ScreenGui.Parent = parentUI

-- Janela Principal
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 240, 0, 190)
mainFrame.Position = UDim2.new(0.5, -120, 0.35, -95)
mainFrame.BackgroundColor3 = Color3.fromRGB(13, 15, 23)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.ZIndex = 100
mainFrame.Parent = ScreenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Thickness = 1.5
mainStroke.Color = Color3.fromRGB(245, 158, 11)
mainStroke.Transparency = 0.2
mainStroke.Parent = mainFrame

-- Cabeçalho
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 36)
header.BackgroundColor3 = Color3.fromRGB(19, 23, 35)
header.BorderSizePixel = 0
header.ZIndex = 101
header.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 12)
headerCorner.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 12, 0, 0)
title.BackgroundTransparency = 1
title.Text = "⚡ PIRATE <font color='#F59E0B'>REACH KILL</font>"
title.RichText = true
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 12
title.Font = Enum.Font.GothamBlack
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 102
title.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 24, 0, 24)
closeBtn.Position = UDim2.new(1, -28, 0, 6)
closeBtn.BackgroundColor3 = Color3.fromRGB(235, 55, 55)
closeBtn.Text = "×"
closeBtn.TextSize = 16
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.ZIndex = 102
closeBtn.Parent = header

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- Botão Flutuante Móvel (⚡)
local toggleBtn = Instance.new("TextButton")
toggleBtn.Name = "FloatingToggle"
toggleBtn.Size = UDim2.new(0, 48, 0, 48)
toggleBtn.Position = UDim2.new(0, 15, 0.45, -24)
toggleBtn.BackgroundColor3 = Color3.fromRGB(245, 158, 11)
toggleBtn.Text = "⚡"
toggleBtn.TextSize = 24
toggleBtn.TextColor3 = Color3.fromRGB(13, 15, 23)
toggleBtn.Active = true
toggleBtn.Draggable = true
toggleBtn.ZIndex = 200
toggleBtn.Parent = ScreenGui

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 14)
toggleCorner.Parent = toggleBtn

local toggleStroke = Instance.new("UIStroke")
toggleStroke.Thickness = 2
toggleStroke.Color = Color3.fromRGB(255, 255, 255)
toggleStroke.Transparency = 0.4
toggleStroke.Parent = toggleBtn

toggleBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.RightControl then
        mainFrame.Visible = not mainFrame.Visible
    end
end)-- [2. BOTÃO DE ATIVAÇÃO]
local btnContainer = Instance.new("Frame")
btnContainer.Size = UDim2.new(1, -24, 0, 90)
btnContainer.Position = UDim2.new(0, 12, 0, 48)
btnContainer.BackgroundTransparency = 1
btnContainer.ZIndex = 101
btnContainer.Parent = mainFrame

local farmBtn = Instance.new("TextButton")
farmBtn.Size = UDim2.new(1, 0, 0, 46)
farmBtn.BackgroundColor3 = Color3.fromRGB(22, 26, 40)
farmBtn.Text = ""
farmBtn.AutoButtonColor = false
farmBtn.ZIndex = 102
farmBtn.Parent = btnContainer

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = farmBtn

local bStroke = Instance.new("UIStroke")
bStroke.Thickness = 1
bStroke.Color = Color3.fromRGB(45, 55, 80)
bStroke.Parent = farmBtn

local label = Instance.new("TextLabel")
label.Size = UDim2.new(0.65, 0, 1, 0)
label.Position = UDim2.new(0, 12, 0, 0)
label.BackgroundTransparency = 1
label.Text = "⚔️ AUTO FARM + REACH"
label.TextColor3 = Color3.fromRGB(230, 235, 255)
label.TextSize = 11
label.Font = Enum.Font.GothamBold
label.TextXAlignment = Enum.TextXAlignment.Left
label.ZIndex = 103
label.Parent = farmBtn

local pill = Instance.new("Frame")
pill.Size = UDim2.new(0, 38, 0, 22)
pill.Position = UDim2.new(1, -48, 0.5, -11)
pill.BackgroundColor3 = Color3.fromRGB(45, 55, 75)
pill.ZIndex = 103
pill.Parent = farmBtn

local pillCorner = Instance.new("UICorner")
pillCorner.CornerRadius = UDim.new(1, 0)
pillCorner.Parent = pill

local circle = Instance.new("Frame")
circle.Size = UDim2.new(0, 16, 0, 16)
circle.Position = UDim2.new(0, 3, 0.5, -8)
circle.BackgroundColor3 = Color3.fromRGB(170, 180, 200)
circle.ZIndex = 104
circle.Parent = pill

local circleCorner = Instance.new("UICorner")
circleCorner.CornerRadius = UDim.new(1, 0)
circleCorner.Parent = circle

farmBtn.MouseButton1Click:Connect(function()
    _G.PH_AutoFarm = not _G.PH_AutoFarm
    if _G.PH_AutoFarm then
        pill.BackgroundColor3 = Color3.fromRGB(245, 158, 11)
        circle.Position = UDim2.new(1, -19, 0.5, -8)
        circle.BackgroundColor3 = Color3.fromRGB(13, 15, 23)
        bStroke.Color = Color3.fromRGB(245, 158, 11)
    else
        pill.BackgroundColor3 = Color3.fromRGB(45, 55, 75)
        circle.Position = UDim2.new(0, 3, 0.5, -8)
        circle.BackgroundColor3 = Color3.fromRGB(170, 180, 200)
        bStroke.Color = Color3.fromRGB(45, 55, 80)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart:FindFirstChild("PH_Flight") then
            LocalPlayer.Character.HumanoidRootPart.PH_Flight:Destroy()
        end
    end
end)

local footer = Instance.new("TextLabel")
footer.Size = UDim2.new(1, 0, 0, 25)
footer.Position = UDim2.new(0, 0, 1, -28)
footer.BackgroundTransparency = 1
footer.Text = "⚡ Reach 100 Studs (NPCs & Players)"
footer.TextColor3 = Color3.fromRGB(120, 135, 160)
footer.TextSize = 10
footer.Font = Enum.Font.GothamMedium
footer.ZIndex = 102
footer.Parent = mainFrame

-- [3. TABELA DE MISSÕES BLOX FRUITS - SEA 1]
local TABELA_MISSOES = {
    {MinLvl = 1,   MaxLvl = 9,    Quest = "BanditQuest1",     NpcName = "Bandit",              LevelId = 1, CFrameQuest = CFrame.new(1059, 16, 1549)},
    {MinLvl = 10,  MaxLvl = 14,   Quest = "JungleQuest",      NpcName = "Monkey",              LevelId = 1, CFrameQuest = CFrame.new(-1598, 36, 153)},
    {MinLvl = 15,  MaxLvl = 29,   Quest = "JungleQuest",      NpcName = "Gorilla",             LevelId = 2, CFrameQuest = CFrame.new(-1598, 36, 153)},
    {MinLvl = 30,  MaxLvl = 39,   Quest = "BuggyQuest1",      NpcName = "Pirate",              LevelId = 1, CFrameQuest = CFrame.new(-1140, 4, 3826)},
    {MinLvl = 40,  MaxLvl = 59,   Quest = "BuggyQuest1",      NpcName = "Brute",               LevelId = 2, CFrameQuest = CFrame.new(-1140, 4, 3826)},
    {MinLvl = 60,  MaxLvl = 74,   Quest = "DesertQuest",      NpcName = "Desert Bandit",       LevelId = 1, CFrameQuest = CFrame.new(896, 6, 4390)},
    {MinLvl = 75,  MaxLvl = 89,   Quest = "DesertQuest",      NpcName = "Desert Officer",      LevelId = 2, CFrameQuest = CFrame.new(896, 6, 4390)},
    {MinLvl = 90,  MaxLvl = 99,   Quest = "SnowQuest",        NpcName = "Snow Bandit",         LevelId = 1, CFrameQuest = CFrame.new(1386, 87, -1298)},
    {MinLvl = 100, MaxLvl = 119,  Quest = "SnowQuest",        NpcName = "Snowman",             LevelId = 2, CFrameQuest = CFrame.new(1386, 87, -1298)},
    {MinLvl = 120, MaxLvl = 149,  Quest = "MarineQuest2",     NpcName = "Chief Petty Officer", LevelId = 1, CFrameQuest = CFrame.new(-5035, 28, 4324)},
    {MinLvl = 150, MaxLvl = 174,  Quest = "SkyQuest",         NpcName = "Sky Bandit",          LevelId = 1, CFrameQuest = CFrame.new(-4840, 717, -2620)},
    {MinLvl = 175, MaxLvl = 189,  Quest = "SkyQuest",         NpcName = "Dark Master",         LevelId = 2, CFrameQuest = CFrame.new(-4840, 717, -2620)},
    {MinLvl = 190, MaxLvl = 224,  Quest = "PrisonerQuest",    NpcName = "Prisoner",            LevelId = 1, CFrameQuest = CFrame.new(4854, 5, 743)},
    {MinLvl = 225, MaxLvl = 274,  Quest = "ColosseumQuest",   NpcName = "Toga Warrior",        LevelId = 1, CFrameQuest = CFrame.new(-1580, 7, -2982)},
    {MinLvl = 275, MaxLvl = 299,  Quest = "MagmaQuest",       NpcName = "Military Soldier",    LevelId = 1, CFrameQuest = CFrame.new(-5315, 12, 8515)},
    {MinLvl = 300, MaxLvl = 374,  Quest = "MagmaQuest",       NpcName = "Military Spy",        LevelId = 2, CFrameQuest = CFrame.new(-5315, 12, 8515)},
    {MinLvl = 375, MaxLvl = 449,  Quest = "FishmanQuest",     NpcName = "Fishman Warrior",     LevelId = 1, CFrameQuest = CFrame.new(61122, 18, 1569)},
    {MinLvl = 450, MaxLvl = 524,  Quest = "SkyQuest2",        NpcName = "God's Guard",         LevelId = 1, CFrameQuest = CFrame.new(-7861, 5545, -380)},
    {MinLvl = 525, MaxLvl = 624,  Quest = "SkyQuest2",        NpcName = "Shanda",              LevelId = 2, CFrameQuest = CFrame.new(-7861, 5545, -380)},
    {MinLvl = 625, MaxLvl = 700,  Quest = "FountainQuest",    NpcName = "Galley Pirate",       LevelId = 1, CFrameQuest = CFrame.new(5258, 38, 4050)}
}

local function obterLevelAtual()
    local d = LocalPlayer:FindFirstChild("Data")
    return (d and d:FindFirstChild("Level")) and d.Level.Value or 1
end

local function obterMissao(lvl)
    for _, m in ipairs(TABELA_MISSOES) do
        if lvl >= m.MinLvl and lvl <= m.MaxLvl then return m end
    end
    return TABELA_MISSOES[#TABELA_MISSOES]
end

local function temMissaoAtiva()
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    return (pg and pg:FindFirstChild("Main") and pg.Main:FindFirstChild("Quest") and pg.Main.Quest.Visible)
end

-- [4. MOTOR DE REACH ATTACK: PEGA DE LONGE EM TODOS OS ALVOS AO REDOR]
local function executarReachAttack()
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("Humanoid") or char.Humanoid.Health <= 0 then return end
    local myRoot = char:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end

    -- 1. Garante que a ferramenta está na mão
    local tool = char:FindFirstChildOfClass("Tool")
    if not tool then
        local bp = LocalPlayer:FindFirstChild("Backpack")
        if bp then
            for _, t in ipairs(bp:GetChildren()) do
                if t:IsA("Tool") and (t.ToolTip == "Melee" or t.ToolTip == "Sword" or t.ToolTip == "Blox Fruit" or t:FindFirstChild("Handle")) then
                    char.Humanoid:EquipTool(t)
                    tool = t
                    break
                end
            end
        end
    end

    -- 2. Escaneia todos os inimigos e players num raio de 100 studs e expande a hitbox
    local enemies = Workspace:FindFirstChild("Enemies")
    if enemies then
        for _, e in ipairs(enemies:GetChildren()) do
            if e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 and e:FindFirstChild("HumanoidRootPart") then
                local dist = (e.HumanoidRootPart.Position - myRoot.Position).Magnitude
                if dist <= 100 then
                    e.HumanoidRootPart.Size = Vector3.new(65, 65, 65)
                    e.HumanoidRootPart.Transparency = 1
                    e.HumanoidRootPart.CanCollide = false
                end
            end
        end
    end

    -- 3. Disparo ultra rápido do ataque à distância
    if tool then
        pcall(function() tool:Activate() end)

        -- Toque na tela (Mobile Touch)
        pcall(function()
            local vp = Workspace.CurrentCamera.ViewportSize
            VirtualInputManager:SendMouseButtonEvent(vp.X / 2, vp.Y / 2, 0, true, game, 1)
            VirtualInputManager:SendMouseButtonEvent(vp.X / 2, vp.Y / 2, 0, false, game, 1)
        end)

        VirtualUser:CaptureController()
        VirtualUser:Button1Down(Vector2.new(0, 0))
        VirtualUser:Button1Up(Vector2.new(0, 0))
    end
end-- [5. ESTABILIZADOR DE VOO & NOCLIP]
local function fixarFlutuacao(root)
    if not root:FindFirstChild("PH_Flight") then
        local bv = Instance.new("BodyVelocity")
        bv.Name = "PH_Flight"
        bv.Velocity = Vector3.zero
        bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        bv.Parent = root
    end
end

local function removerFlutuacao(root)
    if root and root:FindFirstChild("PH_Flight") then
        root.PH_Flight:Destroy()
    end
end

-- Noclip durante o farm para voar direto sem bater em paredes
RunService.Stepped:Connect(function()
    if _G.PH_AutoFarm then
        local char = LocalPlayer.Character
        if char then
            for _, p in ipairs(char:GetChildren()) do
                if p:IsA("BasePart") and p.CanCollide then
                    p.CanCollide = false
                end
            end
        end
    end
end)

-- [6. MOTOR PRINCIPAL: AUTO FARM LEVEL COM REACH ATTACK]
task.spawn(function()
    while true do
        task.wait(0.08) -- Cadência ultra rápida para múltiplos hits por segundo

        if _G.PH_AutoFarm then
            local char = LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")

            if root and hum and hum.Health > 0 then
                local lvl = obterLevelAtual()
                local q = obterMissao(lvl)

                -- 1. Se não tiver missão ativa na tela, vai ao NPC pegar
                if not temMissaoAtiva() then
                    removerFlutuacao(root)
                    root.CFrame = q.CFrameQuest + Vector3.new(0, 3, 0)
                    task.wait(0.3)
                    pcall(function()
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", q.Quest, q.LevelId)
                    end)
                    task.wait(1.0)
                else
                    -- 2. Localiza os monstros da missão atual
                    local alvo = nil
                    local mobs = {}
                    local enemies = Workspace:FindFirstChild("Enemies")
                    if enemies then
                        for _, e in ipairs(enemies:GetChildren()) do
                            if e.Name == q.NpcName and e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 and e:FindFirstChild("HumanoidRootPart") then
                                if not alvo then alvo = e end
                                table.insert(mobs, e)
                            end
                        end
                    end

                    -- Se encontrou monstros vivos
                    if alvo and alvo:FindFirstChild("HumanoidRootPart") then
                        local tPos = alvo.HumanoidRootPart.Position

                        -- Flutua a 12 studs de distância (Totalmente seguro e com alcance máximo de dano)
                        fixarFlutuacao(root)
                        root.CFrame = CFrame.new(tPos + Vector3.new(0, 12, 0), tPos)

                        -- Bring Mobs: Puxa todos os monstros do spawn para o mesmo ponto
                        for _, m in ipairs(mobs) do
                            if m ~= alvo and m:FindFirstChild("HumanoidRootPart") then
                                m.HumanoidRootPart.CFrame = alvo.HumanoidRootPart.CFrame
                                m.HumanoidRootPart.CanCollide = false
                                if m:FindFirstChild("Humanoid") then 
                                    m.Humanoid.WalkSpeed = 0 
                                end
                            end
                        end

                        -- Executa o Reach Attack que bate a 100 studs de distância
                        executarReachAttack()
                    else
                        -- Aguardando os monstros renascerem: flutua em segurança na ilha
                        fixarFlutuacao(root)
                        root.CFrame = q.CFrameQuest + Vector3.new(0, 25, 0)
                        task.wait(1.0)
                    end
                end
            else
                task.wait(2) -- Aguarda renascer caso morra
            end
        end
    end
end)
