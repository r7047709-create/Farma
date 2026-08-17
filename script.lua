--[[
    =============================================================================
    🏴‍☠️ PIRATE HUB ULTIMATE 2026 (ENGINE REDESENHADA & COMBAT BYPASS)
    ⚡ Fast Attack Sem Delay + Bring Mobs Magnético + Auto Haki + Auto Farm
    📱 100% Compatível com Arceus X Neo, Delta, Hydrogen e PC
    =============================================================================
]]

if not game:IsLoaded() then game.Loaded:Wait() end

-- Limpeza de instâncias anteriores
pcall(function()
    if _G.PirateHub_LoadedUI and _G.PirateHub_LoadedUI.Parent then
        _G.PirateHub_LoadedUI:Destroy()
    end
end)

_G.PH_AutoFarm = false
_G.PH_FastAttack = true
_G.PH_AutoHaki = true

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- [1. INJETOR DE TELA SEGURO GETUI/PROTECT]
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PirateHub_2026_" .. math.random(10000, 99999)
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999999
_G.PirateHub_LoadedUI = ScreenGui

local parentTarget = nil
if typeof(gethui) == "function" then
    parentTarget = gethui()
elseif typeof(syn) == "table" and typeof(syn.protect_gui) == "function" then
    syn.protect_gui(ScreenGui)
    parentTarget = game:GetService("CoreGui")
else
    local ok, _ = pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)
    if not ok or not ScreenGui.Parent then
        parentTarget = LocalPlayer:WaitForChild("PlayerGui")
    else
        parentTarget = game:GetService("CoreGui")
    end
end
ScreenGui.Parent = parentTarget

-- Janela Principal
local mainFrame = Instance.new("Frame")
mainFrame.Name = "Main"
mainFrame.Size = UDim2.new(0, 260, 0, 210)
mainFrame.Position = UDim2.new(0.5, -130, 0.35, -105)
mainFrame.BackgroundColor3 = Color3.fromRGB(12, 14, 22)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.ZIndex = 100
mainFrame.Parent = ScreenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 14)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Thickness = 1.8
mainStroke.Color = Color3.fromRGB(245, 158, 11)
mainStroke.Transparency = 0.15
mainStroke.Parent = mainFrame

-- Barra Superior
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 38)
header.BackgroundColor3 = Color3.fromRGB(18, 22, 34)
header.BorderSizePixel = 0
header.ZIndex = 101
header.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 14)
headerCorner.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 12, 0, 0)
title.BackgroundTransparency = 1
title.Text = "⚡ PIRATE HUB <font color='#F59E0B'>PRO 2026</font>"
title.RichText = true
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 13
title.Font = Enum.Font.GothamBlack
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 102
title.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 24, 0, 24)
closeBtn.Position = UDim2.new(1, -30, 0, 7)
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

-- Botão Flutuante (Mobile ⚡)
local toggleBtn = Instance.new("TextButton")
toggleBtn.Name = "FloatingToggle"
toggleBtn.Size = UDim2.new(0, 48, 0, 48)
toggleBtn.Position = UDim2.new(0, 15, 0.45, -24)
toggleBtn.BackgroundColor3 = Color3.fromRGB(245, 158, 11)
toggleBtn.Text = "⚡"
toggleBtn.TextSize = 24
toggleBtn.TextColor3 = Color3.fromRGB(12, 14, 22)
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
toggleStroke.Transparency = 0.3
toggleStroke.Parent = toggleBtn

toggleBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.RightControl then
        mainFrame.Visible = not mainFrame.Visible
    end
end)-- [2. BOTÕES DE CONTROLE TOUCH MOBILE]
local btnContainer = Instance.new("Frame")
btnContainer.Size = UDim2.new(1, -24, 0, 100)
btnContainer.Position = UDim2.new(0, 12, 0, 48)
btnContainer.BackgroundTransparency = 1
btnContainer.ZIndex = 101
btnContainer.Parent = mainFrame

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 10)
listLayout.Parent = btnContainer

-- Criador de Botões Mobile Grandes (Fáceis de tocar na tela)
local function criarToggle(texto, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 44)
    btn.BackgroundColor3 = Color3.fromRGB(20, 24, 38)
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.ZIndex = 102
    btn.Parent = btnContainer

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = btn

    local bStroke = Instance.new("UIStroke")
    bStroke.Thickness = 1.2
    bStroke.Color = Color3.fromRGB(45, 55, 80)
    bStroke.Parent = btn

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.65, 0, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = texto
    label.TextColor3 = Color3.fromRGB(235, 240, 255)
    label.TextSize = 12
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.ZIndex = 103
    label.Parent = btn

    local pill = Instance.new("Frame")
    pill.Size = UDim2.new(0, 42, 0, 24)
    pill.Position = UDim2.new(1, -52, 0.5, -12)
    pill.BackgroundColor3 = Color3.fromRGB(45, 55, 75)
    pill.ZIndex = 103
    pill.Parent = btn

    local pillCorner = Instance.new("UICorner")
    pillCorner.CornerRadius = UDim.new(1, 0)
    pillCorner.Parent = pill

    local circle = Instance.new("Frame")
    circle.Size = UDim2.new(0, 18, 0, 18)
    circle.Position = UDim2.new(0, 3, 0.5, -9)
    circle.BackgroundColor3 = Color3.fromRGB(170, 180, 200)
    circle.ZIndex = 104
    circle.Parent = pill

    local circleCorner = Instance.new("UICorner")
    circleCorner.CornerRadius = UDim.new(1, 0)
    circleCorner.Parent = circle

    local estado = false
    btn.MouseButton1Click:Connect(function()
        estado = not estado
        if estado then
            pill.BackgroundColor3 = Color3.fromRGB(245, 158, 11)
            circle.Position = UDim2.new(1, -21, 0.5, -9)
            circle.BackgroundColor3 = Color3.fromRGB(12, 14, 22)
            bStroke.Color = Color3.fromRGB(245, 158, 11)
        else
            pill.BackgroundColor3 = Color3.fromRGB(45, 55, 75)
            circle.Position = UDim2.new(0, 3, 0.5, -9)
            circle.BackgroundColor3 = Color3.fromRGB(170, 180, 200)
            bStroke.Color = Color3.fromRGB(45, 55, 80)
        end
        callback(estado)
    end)
    return btn
end

local footer = Instance.new("TextLabel")
footer.Size = UDim2.new(1, 0, 0, 25)
footer.Position = UDim2.new(0, 0, 1, -26)
footer.BackgroundTransparency = 1
footer.Text = "📱 Realme C3 • Motor Touch 60 FPS"
footer.TextColor3 = Color3.fromRGB(120, 135, 160)
footer.TextSize = 10
footer.Font = Enum.Font.GothamMedium
footer.ZIndex = 102
footer.Parent = mainFrame

-- [3. TABELA COMPLETA DE MISSÕES - SEA 1]
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

-- [4. AUTO BUSO HAKI (AURA DE DANO)]
local function ativarHaki()
    local char = LocalPlayer.Character
    if char and not char:FindFirstChild("HasBuso") then
        pcall(function()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("Buso")
        end)
    end
end

-- [5. MOTOR DE COMBATE ULTRA RÁPIDO MOBILE]
local function atacarMonstroMobile(alvo)
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("Humanoid") or char.Humanoid.Health <= 0 then return end

    -- 1. Equipa Estilo de Luta ou Espada
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

    -- 2. Hitbox Expandida Gigante (60 Studs)
    if alvo and alvo:FindFirstChild("HumanoidRootPart") then
        local hrp = alvo.HumanoidRootPart
        hrp.Size = Vector3.new(60, 60, 60)
        hrp.Transparency = 1
        hrp.CanCollide = false
    end

    -- 3. Golpe Imediato
    if tool then
        pcall(function() tool:Activate() end)
        VirtualUser:CaptureController()
        VirtualUser:Button1Down(Vector2.new(0, 0))
        VirtualUser:Button1Up(Vector2.new(0, 0))
    end
end-- [6. ESTABILIZADOR DE VOO & NOCLIP MOBILE]
local function fixarFlutuacao(root)
    if not root:FindFirstChild("PH_MobileFlight") then
        local bv = Instance.new("BodyVelocity")
        bv.Name = "PH_MobileFlight"
        bv.Velocity = Vector3.zero
        bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        bv.Parent = root
    end
end

local function removerFlutuacao(root)
    if root and root:FindFirstChild("PH_MobileFlight") then
        root.PH_MobileFlight:Destroy()
    end
end

-- Noclip otimizado para não colidir em construções ou ilhas
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

-- [7. REGISTRO DO BOTÃO NA INTERFACE TOUCH]
criarToggle("⚔️ AUTO FARM LEVEL", function(on)
    _G.PH_AutoFarm = on
    if not on and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        removerFlutuacao(LocalPlayer.Character.HumanoidRootPart)
    end
end)

-- [8. MOTOR PRINCIPAL: AUTO FARM LEVEL TOUCH MOBILE]
task.spawn(function()
    while true do
        task.wait(0.08) -- Taxa de clique ideal para mobile sem esquentar o celular

        if _G.PH_AutoFarm then
            local char = LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")

            if root and hum and hum.Health > 0 then
                ativarHaki()
                local lvl = obterLevelAtual()
                local q = obterMissao(lvl)

                -- 1. Se não tiver com a missão na tela, vai até o NPC e pega automaticamente
                if not temMissaoAtiva() then
                    removerFlutuacao(root)
                    root.CFrame = q.CFrameQuest + Vector3.new(0, 3, 0)
                    task.wait(0.3)
                    pcall(function()
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", q.Quest, q.LevelId)
                    end)
                    task.wait(1.0)
                else
                    -- 2. Localiza os monstros da missão ativa
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

                        -- Posicionamento Perfeito: 11 studs acima da cabeça (Não toma dano e acerta tudo)
                        fixarFlutuacao(root)
                        root.CFrame = CFrame.new(tPos + Vector3.new(0, 11, 0), tPos)

                        -- Bring Mobs Magnético: Junta os monstros todos embaixo de você
                        for _, m in ipairs(mobs) do
                            if m ~= alvo and m:FindFirstChild("HumanoidRootPart") then
                                m.HumanoidRootPart.CFrame = alvo.HumanoidRootPart.CFrame
                                m.HumanoidRootPart.CanCollide = false
                                if m:FindFirstChild("Humanoid") then 
                                    m.Humanoid.WalkSpeed = 0 
                                end
                            end
                        end

                        -- Executa o ataque contínuo com hitbox de 60 studs
                        atacarMonstroMobile(alvo)
                    else
                        -- Monstros renascendo: flutua em segurança sobre a ilha
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
