--[[
    =============================================================================
    🏴‍☠️ PIRATE HUB V4 PRO (CROSS-PLATFORM: PC & MOBILE)
    ⚡ Compatível com Arceus X, Delta, Hydrogen, Wave, PC
    📱 Otimizado para Realme C3 (Baixo consumo de RAM e CPU)
    =============================================================================
]]

if not game:IsLoaded() then game.Loaded:Wait() end

-- Evita abrir duas interfaces ao mesmo tempo
if _G.PirateHub_V4_Pro then 
    if game:GetService("CoreGui"):FindFirstChild("PirateHub_V4_Pro") then
        game:GetService("CoreGui").PirateHub_V4_Pro:Destroy()
    end
end
_G.PirateHub_V4_Pro = true

-- [ESTADOS GLOBAIS DE CONTROLE]
_G.PH_AutoFarmLevel = false
_G.PH_AutoFruits    = false
_G.PH_AutoChests    = false
_G.PH_AutoStats     = false
_G.PH_Speed         = false
_G.PH_ESP           = false

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- [1. CRIAÇÃO DA INTERFACE GRÁFICA]
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PirateHub_V4_Pro"
ScreenGui.ResetOnSpawn = false

local success, _ = pcall(function() ScreenGui.Parent = CoreGui end)
if not success or not ScreenGui.Parent then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

-- Janela Principal
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 230, 0, 330)
mainFrame.Position = UDim2.new(0.5, -115, 0.35, -165)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 17, 26)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.ClipsDescendants = true
mainFrame.Parent = ScreenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainFrame

local stroke = Instance.new("UIStroke")
stroke.Thickness = 1
stroke.Color = Color3.fromRGB(245, 158, 11)
stroke.Transparency = 0.4
stroke.Parent = mainFrame

-- Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 38)
title.BackgroundTransparency = 1
title.Text = "⚡ PIRATE HUB V4 PRO"
title.TextColor3 = Color3.fromRGB(245, 158, 11)
title.TextSize = 13
title.Font = Enum.Font.GothamBlack
title.Parent = mainFrame

-- Scroll para caber todos os botões
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(0.92, 0, 0, 245)
scroll.Position = UDim2.new(0.04, 0, 0, 40)
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 3
scroll.ScrollBarImageColor3 = Color3.fromRGB(245, 158, 11)
scroll.CanvasSize = UDim2.new(0, 0, 0, 440)
scroll.Parent = mainFrame

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 6)
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
listLayout.Parent = scroll

-- Rodapé
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0, 30)
statusLabel.Position = UDim2.new(0, 0, 0, 295)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "💻 PC: [RCtrl] | 📱 Mobile: [⚡]"
statusLabel.TextColor3 = Color3.fromRGB(140, 150, 175)
statusLabel.TextSize = 10
statusLabel.Font = Enum.Font.GothamMedium
statusLabel.Parent = mainFrame

-- Botão Flutuante (Mobile)
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 44, 0, 44)
toggleBtn.Position = UDim2.new(0, 15, 0.5, -22)
toggleBtn.BackgroundColor3 = Color3.fromRGB(245, 158, 11)
toggleBtn.Text = "⚡"
toggleBtn.TextSize = 22
toggleBtn.TextColor3 = Color3.fromRGB(15, 17, 26)
toggleBtn.Active = true
toggleBtn.Draggable = true
toggleBtn.Parent = ScreenGui

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 12)
toggleCorner.Parent = toggleBtn

toggleBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- Tecla PC (RightControl)
UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.RightControl then
        mainFrame.Visible = not mainFrame.Visible
    end
end)-- [2. FUNÇÕES DE CRIAÇÃO DE BOTÕES]
local function criarBotaoToggle(texto, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.BackgroundColor3 = Color3.fromRGB(220, 45, 45)
    btn.Text = texto .. ": OFF"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 10
    btn.Font = Enum.Font.GothamBold
    btn.Parent = scroll

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn

    local estado = false
    btn.MouseButton1Click:Connect(function()
        estado = not estado
        btn.Text = texto .. (estado and ": ON" or ": OFF")
        btn.BackgroundColor3 = estado and Color3.fromRGB(35, 185, 75) or Color3.fromRGB(220, 45, 45)
        callback(estado)
    end)
    return btn
end

local function criarBotaoAcao(texto, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
    btn.Text = texto
    btn.TextColor3 = Color3.fromRGB(210, 230, 255)
    btn.TextSize = 10
    btn.Font = Enum.Font.GothamBold
    btn.Parent = scroll

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- [3. TABELA DE MISSÕES E LOCAIS DO PRIMEIRO MAR (SEA 1)]
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

-- [4. FUNÇÕES AUXILIARES]
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

local function equiparArma()
    local char = LocalPlayer.Character
    if not char then return end
    local equipped = char:FindFirstChildOfClass("Tool")
    if equipped then 
        equipped:Activate()
        return 
    end

    local bp = LocalPlayer:FindFirstChild("Backpack")
    if bp then
        for _, t in ipairs(bp:GetChildren()) do
            if t:IsA("Tool") and (t.ToolTip == "Melee" or t.ToolTip == "Sword" or t.ToolTip == "Blox Fruit") then
                char.Humanoid:EquipTool(t)
                t:Activate()
                break
            end
        end
    end
end

-- Estabilizador Antigravidade Aéreo
local function fixarFlutuacao(root)
    if not root:FindFirstChild("PH_Float") then
        local bv = Instance.new("BodyVelocity")
        bv.Name = "PH_Float"
        bv.Velocity = Vector3.zero
        bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        bv.Parent = root
    end
end

local function removerFlutuacao(root)
    if root and root:FindFirstChild("PH_Float") then
        root.PH_Float:Destroy()
    end
end

-- Noclip durante o farm para não colidir com paredes
RunService.Stepped:Connect(function()
    if _G.PH_AutoFarmLevel or _G.PH_AutoChests or _G.PH_AutoFruits then
        local char = LocalPlayer.Character
        if char then
            for _, p in ipairs(char:GetChildren()) do
                if p:IsA("BasePart") and p.CanCollide then
                    p.CanCollide = false
                end
            end
        end
    end
end)-- [5. REGISTRO E CRIAÇÃO DOS BOTÕES NO MENU]
criarBotaoToggle("⚔️ AUTO FARM LEVEL", function(on)
    _G.PH_AutoFarmLevel = on
    if not on and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        removerFlutuacao(LocalPlayer.Character.HumanoidRootPart)
    end
end)

criarBotaoToggle("🍒 AUTO PEGAR FRUTAS", function(on)
    _G.PH_AutoFruits = on
end)

criarBotaoToggle("💰 AUTO FARM BAÚS", function(on)
    _G.PH_AutoChests = on
end)

criarBotaoToggle("🛡️ AUTO STATS (MELEE/DEF)", function(on)
    _G.PH_AutoStats = on
end)

criarBotaoToggle("💨 VELOCIDADE (70)", function(on)
    _G.PH_Speed = on
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = on and 70 or 16
    end
end)

criarBotaoToggle("👁️ ESP PLAYERS", function(on)
    _G.PH_ESP = on
end)

-- Botões de Viagem Rápida entre Mares
criarBotaoAcao("🚢 VIAJAR SEA 1", function()
    pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelMain") end)
end)

criarBotaoAcao("🚢 VIAJAR SEA 2", function()
    pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelDressrosa") end)
end)

criarBotaoAcao("🚢 VIAJAR SEA 3", function()
    pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou") end)
end)

-- [6. MOTOR PRINCIPAL: AUTO FARM LEVEL]
task.spawn(function()
    while true do
        task.wait(0.2)
        if _G.PH_AutoFarmLevel then
            local char = LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")

            if root and hum and hum.Health > 0 then
                local lvl = obterLevelAtual()
                local q = obterMissao(lvl)

                -- 1. Se não tiver missão, vai até o NPC e pega
                if not temMissaoAtiva() then
                    removerFlutuacao(root)
                    root.CFrame = q.CFrameQuest + Vector3.new(0, 3, 0)
                    task.wait(0.5)
                    pcall(function()
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", q.Quest, q.LevelId)
                    end)
                    task.wait(1.5)
                else
                    -- 2. Localiza os monstros da missão
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

                    -- Se encontrou o monstro, posiciona no ar e ataca
                    if alvo and alvo:FindFirstChild("HumanoidRootPart") then
                        local tPos = alvo.HumanoidRootPart.Position
                        fixarFlutuacao(root)
                        root.CFrame = CFrame.new(tPos + Vector3.new(0, 22, 0), tPos)

                        -- Bring Mobs Leve (Junta monstros próximos)
                        for _, m in ipairs(mobs) do
                            if m ~= alvo and m:FindFirstChild("HumanoidRootPart") then
                                m.HumanoidRootPart.CFrame = alvo.HumanoidRootPart.CFrame
                                m.HumanoidRootPart.CanCollide = false
                                if m:FindFirstChild("Humanoid") then m.Humanoid.WalkSpeed = 0 end
                            end
                        end

                        equiparArma()
                        VirtualUser:CaptureController()
                        VirtualUser:ClickButton1(Vector2.new(0, 0))
                    else
                        -- Monstros ainda renascendo
                        fixarFlutuacao(root)
                        root.CFrame = q.CFrameQuest + Vector3.new(0, 35, 0)
                        task.wait(1.5)
                    end
                end
            else
                task.wait(2)
            end
        end
    end
end)-- [7. THREADS COMPLEMENTARES: AUTO FRUTAS, BAÚS, STATS, VELOCIDADE & ESP]

-- A) Auto Pegar Frutas do Chão
task.spawn(function()
    while true do
        task.wait(2)
        if _G.PH_AutoFruits and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local root = LocalPlayer.Character.HumanoidRootPart
            for _, item in ipairs(Workspace:GetChildren()) do
                if item:IsA("Tool") and string.find(string.lower(item.Name), "fruit") then
                    local handle = item:FindFirstChild("Handle") or item:FindFirstChildWhichIsA("BasePart")
                    if handle then
                        root.CFrame = handle.CFrame + Vector3.new(0, 2, 0)
                        task.wait(0.5)
                        if firetouchinterest then
                            firetouchinterest(root, handle, 0)
                            firetouchinterest(root, handle, 1)
                        end
                        task.wait(1)
                    end
                end
            end
        end
    end
end)

-- B) Auto Farm de Baús (Dinheiro Rápido)
task.spawn(function()
    while true do
        task.wait(1)
        if _G.PH_AutoChests and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local root = LocalPlayer.Character.HumanoidRootPart
            for _, item in ipairs(Workspace:GetDescendants()) do
                if not _G.PH_AutoChests then break end
                if item:IsA("BasePart") and string.find(string.lower(item.Name), "chest") and item.Parent then
                    root.CFrame = item.CFrame + Vector3.new(0, 2, 0)
                    if firetouchinterest then
                        firetouchinterest(root, item, 0)
                        firetouchinterest(root, item, 1)
                    end
                    task.wait(1)
                end
            end
        end
    end
end)

-- C) Auto Stats (Distribui pontos em Melee e Defesa ao subir de nível)
task.spawn(function()
    while true do
        task.wait(1.5)
        if _G.PH_AutoStats then
            local d = LocalPlayer:FindFirstChild("Data")
            local pts = d and d:FindFirstChild("Points")
            if pts and pts.Value > 0 then
                local gastar = math.min(pts.Value, 3)
                pcall(function()
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Melee", gastar)
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Defense", gastar)
                end)
            end
        end
    end
end)

-- D) Velocidade Contínua com Reconexão no Respawn
local function manterVelocidade(char)
    if not char or not _G.PH_Speed then return end
    local hum = char:WaitForChild("Humanoid", 5)
    if hum then
        hum.WalkSpeed = 70
        hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
            if _G.PH_Speed and hum and hum.WalkSpeed ~= 70 then 
                hum.WalkSpeed = 70 
            end
        end)
    end
end

LocalPlayer.CharacterAdded:Connect(function(c)
    task.wait(0.5)
    if _G.PH_Speed then manterVelocidade(c) end
end)

-- E) ESP de Jogadores com Distância em Metros
local function aplicarESP(p)
    if p == LocalPlayer then return end
    task.spawn(function()
        while p and p.Parent do
            if _G.PH_ESP and p.Character then
                local head = p.Character:FindFirstChild("Head")
                local r = p.Character:FindFirstChild("HumanoidRootPart")
                local myR = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

                if head and not head:FindFirstChild("PH_Tag") then
                    local bg = Instance.new("BillboardGui")
                    local lbl = Instance.new("TextLabel")
                    bg.Name = "PH_Tag"
                    bg.Parent = head
                    bg.AlwaysOnTop = true
                    bg.Size = UDim2.new(0, 110, 0, 24)
                    bg.StudsOffset = Vector3.new(0, 2.5, 0)

                    lbl.Name = "Txt"
                    lbl.Parent = bg
                    lbl.BackgroundTransparency = 1
                    lbl.Size = UDim2.new(1, 0, 1, 0)
                    lbl.TextSize = 10
                    lbl.Font = Enum.Font.SourceSansBold
                    lbl.TextColor3 = Color3.fromRGB(245, 158, 11)
                    lbl.TextStrokeTransparency = 0.4
                end

                if head and r and myR and head:FindFirstChild("PH_Tag") then
                    local dist = math.floor((myR.Position - r.Position).Magnitude)
                    head.PH_Tag.Txt.Text = p.Name .. " [" .. dist .. "m]"
                end
            else
                if p.Character and p.Character:FindFirstChild("Head") and p.Character.Head:FindFirstChild("PH_Tag") then
                    p.Character.Head.PH_Tag:Destroy()
                end
            end
            task.wait(2)
        end
    end)
end

-- Inicializa o ESP para jogadores atuais e novos que entrarem no servidor
for _, pl in ipairs(Players:GetPlayers()) do aplicarESP(pl) end
Players.PlayerAdded:Connect(aplicarESP)
