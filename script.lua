--[[
    =============================================================================
    🏴‍☠️ PIRATE HUB V5 - AUTO FARM LEVEL + AUTO FRUTAS + FAST ATTACK
    ⚡ O Melhor Sistema de Clique e Ataque Rápido
    📱 Interface Moderna, Bonita e Ultra Leve (Realme C3 & PC)
    =============================================================================
]]

if not game:IsLoaded() then game.Loaded:Wait() end

-- Limpa interface antiga se já estiver aberta
if _G.PirateHub_V5 then 
    pcall(function()
        if game:GetService("CoreGui"):FindFirstChild("PirateHub_V5") then
            game:GetService("CoreGui").PirateHub_V5:Destroy()
        end
    end)
end
_G.PirateHub_V5 = true

-- Variáveis de Controle
_G.PH_AutoFarm = false
_G.PH_AutoFruits = false

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- [1. CRIAÇÃO DA INTERFACE MODERNA E BONITA]
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PirateHub_V5"
ScreenGui.ResetOnSpawn = false

local success, _ = pcall(function() ScreenGui.Parent = CoreGui end)
if not success or not ScreenGui.Parent then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

-- Painel Principal (Fundo Escuro com Borda Dourada)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 240, 0, 260)
mainFrame.Position = UDim2.new(0.5, -120, 0.35, -130)
mainFrame.BackgroundColor3 = Color3.fromRGB(13, 15, 24)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.ClipsDescendants = true
mainFrame.Parent = ScreenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 14)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Thickness = 1.5
mainStroke.Color = Color3.fromRGB(245, 158, 11)
mainStroke.Transparency = 0.3
mainStroke.Parent = mainFrame

-- Cabeçalho
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 38)
header.BackgroundColor3 = Color3.fromRGB(18, 22, 34)
header.BorderSizePixel = 0
header.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 14)
headerCorner.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 14, 0, 0)
title.BackgroundTransparency = 1
title.Text = "⚡ PIRATE HUB <font color='#F59E0B'>V5</font>"
title.RichText = true
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 13
title.Font = Enum.Font.GothamBlack
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 24, 0, 24)
closeBtn.Position = UDim2.new(1, -30, 0, 7)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 65, 65)
closeBtn.Text = "×"
closeBtn.TextSize = 16
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = header

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- Botão Flutuante Móvel (Mobile ⚡)
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 46, 0, 46)
toggleBtn.Position = UDim2.new(0, 15, 0.5, -23)
toggleBtn.BackgroundColor3 = Color3.fromRGB(245, 158, 11)
toggleBtn.Text = "⚡"
toggleBtn.TextSize = 22
toggleBtn.TextColor3 = Color3.fromRGB(13, 15, 24)
toggleBtn.Active = true
toggleBtn.Draggable = true
toggleBtn.Parent = ScreenGui

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 12)
toggleCorner.Parent = toggleBtn

local toggleStroke = Instance.new("UIStroke")
toggleStroke.Thickness = 2
toggleStroke.Color = Color3.fromRGB(255, 255, 255)
toggleStroke.Transparency = 0.5
toggleStroke.Parent = toggleBtn

toggleBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- Tecla RightControl para PC
UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.RightControl then
        mainFrame.Visible = not mainFrame.Visible
    end
end)

-- Container dos Botões
local btnContainer = Instance.new("Frame")
btnContainer.Size = UDim2.new(1, -24, 0, 160)
btnContainer.Position = UDim2.new(0, 12, 0, 48)
btnContainer.BackgroundTransparency = 1
btnContainer.Parent = mainFrame

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 10)
listLayout.Parent = btnContainer

-- Criador de Botão Moderno com Chave Seletora
local function criarToggle(texto, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 42)
    btn.BackgroundColor3 = Color3.fromRGB(22, 27, 42)
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.Parent = btnContainer

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    local bStroke = Instance.new("UIStroke")
    bStroke.Thickness = 1
    bStroke.Color = Color3.fromRGB(40, 50, 75)
    bStroke.Parent = btn

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = texto
    label.TextColor3 = Color3.fromRGB(220, 230, 255)
    label.TextSize = 11
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = btn

    local pill = Instance.new("Frame")
    pill.Size = UDim2.new(0, 36, 0, 20)
    pill.Position = UDim2.new(1, -46, 0.5, -10)
    pill.BackgroundColor3 = Color3.fromRGB(45, 55, 75)
    pill.Parent = btn

    local pillCorner = Instance.new("UICorner")
    pillCorner.CornerRadius = UDim.new(1, 0)
    pillCorner.Parent = pill

    local circle = Instance.new("Frame")
    circle.Size = UDim2.new(0, 14, 0, 14)
    circle.Position = UDim2.new(0, 3, 0.5, -7)
    circle.BackgroundColor3 = Color3.fromRGB(160, 170, 190)
    circle.Parent = pill

    local circleCorner = Instance.new("UICorner")
    circleCorner.CornerRadius = UDim.new(1, 0)
    circleCorner.Parent = circle

    local estado = false
    btn.MouseButton1Click:Connect(function()
        estado = not estado
        if estado then
            pill.BackgroundColor3 = Color3.fromRGB(245, 158, 11)
            circle.Position = UDim2.new(1, -17, 0.5, -7)
            circle.BackgroundColor3 = Color3.fromRGB(15, 17, 26)
            bStroke.Color = Color3.fromRGB(245, 158, 11)
        else
            pill.BackgroundColor3 = Color3.fromRGB(45, 55, 75)
            circle.Position = UDim2.new(0, 3, 0.5, -7)
            circle.BackgroundColor3 = Color3.fromRGB(160, 170, 190)
            bStroke.Color = Color3.fromRGB(40, 50, 75)
        end
        callback(estado)
    end)
    return btn
end

-- Rodapé
local footer = Instance.new("TextLabel")
footer.Size = UDim2.new(1, 0, 0, 25)
footer.Position = UDim2.new(0, 0, 1, -28)
footer.BackgroundTransparency = 1
footer.Text = "📱 Realme C3 • Fast Attack Ativo"
footer.TextColor3 = Color3.fromRGB(110, 120, 145)
footer.TextSize = 10
footer.Font = Enum.Font.GothamMedium
footer.Parent = mainFramefooter.Font = Enum.Font.GothamMedium
footer.Parent = mainFrame
-- [2. TABELA COMPLETA DE MISSÕES BLOX FRUITS - SEA 1]
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

-- [3. FUNÇÕES DE CHECAGEM DE LEVEL E MISSÃO]
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

-- [4. O MELHOR SISTEMA DE CLIQUE / FAST ATTACK TRIPLO]
local function executarFastAttack()
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("Humanoid") or char.Humanoid.Health <= 0 then return end

    -- 1. Garante arma na mão (Soco, Espada ou Fruta)
    local equippedTool = char:FindFirstChildOfClass("Tool")
    if not equippedTool then
        local bp = LocalPlayer:FindFirstChild("Backpack")
        if bp then
            for _, tool in ipairs(bp:GetChildren()) do
                if tool:IsA("Tool") then
                    local tipo = tool.ToolTip
                    if tipo == "Melee" or tipo == "Sword" or tipo == "Blox Fruit" or tool:FindFirstChild("Handle") then
                        char.Humanoid:EquipTool(tool)
                        equippedTool = tool
                        break
                    end
                end
            end
        end
    end

    -- 2. Disparo de ataque otimizado sem travar o jogo
    if equippedTool then
        pcall(function()
            equippedTool:Activate()
        end)

        VirtualUser:CaptureController()
        VirtualUser:Button1Down(Vector2.new(0, 0))
        VirtualUser:Button1Up(Vector2.new(0, 0))

        pcall(function()
            if ReplicatedStorage:FindFirstChild("RigControllerEvent") then
                ReplicatedStorage.RigControllerEvent:FireServer("weaponChange", tostring(equippedTool.Name))
            end
        end)
    end
end

-- Estabilizador Antigravidade Aéreo (Não cai da altura do farm)
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

-- Noclip automático durante o farm para não colidir em paredes
RunService.Stepped:Connect(function()
    if _G.PH_AutoFarm or _G.PH_AutoFruits then
        local char = LocalPlayer.Character
        if char then
            for _, p in ipairs(char:GetChildren()) do
                if p:IsA("BasePart") and p.CanCollide then
                    p.CanCollide = false
                end
            end
        end
    end
end)-- [5. REGISTRO DOS BOTÕES NA INTERFACE]
criarToggle("⚔️ AUTO FARM LEVEL", function(on)
    _G.PH_AutoFarm = on
    if not on and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        removerFlutuacao(LocalPlayer.Character.HumanoidRootPart)
    end
end)

criarToggle("🍒 AUTO PEGAR FRUTAS", function(on)
    _G.PH_AutoFruits = on
end)

-- [6. MOTOR PRINCIPAL: AUTO FARM LEVEL COM FLUTUAÇÃO SEGURA]
task.spawn(function()
    while true do
        task.wait(0.15) -- Cadência ideal para fast attack sem travar o celular

        if _G.PH_AutoFarm then
            local char = LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")

            if root and hum and hum.Health > 0 then
                local lvl = obterLevelAtual()
                local q = obterMissao(lvl)

                -- 1. Se não tiver missão, vai ao NPC e pega
                if not temMissaoAtiva() then
                    removerFlutuacao(root)
                    root.CFrame = q.CFrameQuest + Vector3.new(0, 3, 0)
                    task.wait(0.4)
                    pcall(function()
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", q.Quest, q.LevelId)
                    end)
                    task.wait(1.2)
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

                        -- Trava a flutuação a 20 studs de altura no ar acima dos monstros
                        fixarFlutuacao(root)
                        root.CFrame = CFrame.new(tPos + Vector3.new(0, 20, 0), tPos)

                        -- Bring Mobs (Agrupa os outros monstros da missão embaixo de você)
                        for _, m in ipairs(mobs) do
                            if m ~= alvo and m:FindFirstChild("HumanoidRootPart") then
                                m.HumanoidRootPart.CFrame = alvo.HumanoidRootPart.CFrame
                                m.HumanoidRootPart.CanCollide = false
                                if m:FindFirstChild("Humanoid") then 
                                    m.Humanoid.WalkSpeed = 0 
                                end
                            end
                        end

                        -- Executa o melhor Fast Attack contínuo
                        executarFastAttack()
                    else
                        -- Monstros renascendo: flutua em segurança sobre a ilha
                        fixarFlutuacao(root)
                        root.CFrame = q.CFrameQuest + Vector3.new(0, 30, 0)
                        task.wait(1.2)
                    end
                end
            else
                task.wait(2) -- Aguarda renascer caso morra
            end
        end
    end
end)

-- [7. MOTOR: AUTO PEGAR FRUTAS DO CHÃO]
task.spawn(function()
    while true do
        task.wait(2)
        if _G.PH_AutoFruits and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local root = LocalPlayer.Character.HumanoidRootPart
            for _, item in ipairs(Workspace:GetChildren()) do
                if item:IsA("Tool") and string.find(string.lower(item.Name), "fruit") then
                    local handle = item:FindFirstChild("Handle") or item:FindFirstChildWhichIsA("BasePart")
                    if handle then
                        -- Teleporta até a fruta
                        root.CFrame = handle.CFrame + Vector3.new(0, 2, 0)
                        task.wait(0.5)
                        -- Pega a fruta para a mochila
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
