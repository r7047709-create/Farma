-- [2. BOTÕES VISUAIS E COMPONENTES]
local btnContainer = Instance.new("Frame")
btnContainer.Size = UDim2.new(1, -24, 0, 150)
btnContainer.Position = UDim2.new(0, 12, 0, 46)
btnContainer.BackgroundTransparency = 1
btnContainer.ZIndex = 101
btnContainer.Parent = mainFrame

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 8)
listLayout.Parent = btnContainer

local function criarToggle(texto, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 42)
    btn.BackgroundColor3 = Color3.fromRGB(24, 28, 42)
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.ZIndex = 102
    btn.Parent = btnContainer

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    local bStroke = Instance.new("UIStroke")
    bStroke.Thickness = 1
    bStroke.Color = Color3.fromRGB(45, 55, 80)
    bStroke.Parent = btn

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = texto
    label.TextColor3 = Color3.fromRGB(230, 235, 255)
    label.TextSize = 11
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.ZIndex = 103
    label.Parent = btn

    local pill = Instance.new("Frame")
    pill.Size = UDim2.new(0, 38, 0, 22)
    pill.Position = UDim2.new(1, -48, 0.5, -11)
    pill.BackgroundColor3 = Color3.fromRGB(45, 55, 75)
    pill.ZIndex = 103
    pill.Parent = btn

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

    local estado = false
    btn.MouseButton1Click:Connect(function()
        estado = not estado
        if estado then
            pill.BackgroundColor3 = Color3.fromRGB(245, 158, 11)
            circle.Position = UDim2.new(1, -19, 0.5, -8)
            circle.BackgroundColor3 = Color3.fromRGB(15, 17, 26)
            bStroke.Color = Color3.fromRGB(245, 158, 11)
        else
            pill.BackgroundColor3 = Color3.fromRGB(45, 55, 75)
            circle.Position = UDim2.new(0, 3, 0.5, -8)
            circle.BackgroundColor3 = Color3.fromRGB(170, 180, 200)
            bStroke.Color = Color3.fromRGB(45, 55, 80)
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
footer.Text = "📱 Realme C3 • Motor 2026 Ativo"
footer.TextColor3 = Color3.fromRGB(130, 140, 165)
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

-- [4. FUNÇÕES DE SUPORTE]
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

-- Fast Attack 2026: Puxa arma e ativa dano instantâneo
local function dispararAtaque()
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("Humanoid") or char.Humanoid.Health <= 0 then return end

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

    if tool then
        pcall(function() tool:Activate() end)
        VirtualUser:CaptureController()
        VirtualUser:Button1Down(Vector2.new(0, 0))
        VirtualUser:Button1Up(Vector2.new(0, 0))
    end
end-- [2. BOTÕES VISUAIS]
local btnContainer = Instance.new("Frame")
btnContainer.Size = UDim2.new(1, -24, 0, 150)
btnContainer.Position = UDim2.new(0, 12, 0, 46)
btnContainer.BackgroundTransparency = 1
btnContainer.ZIndex = 101
btnContainer.Parent = mainFrame

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 8)
listLayout.Parent = btnContainer

local function criarToggle(texto, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 42)
    btn.BackgroundColor3 = Color3.fromRGB(24, 28, 42)
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.ZIndex = 102
    btn.Parent = btnContainer

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    local bStroke = Instance.new("UIStroke")
    bStroke.Thickness = 1
    bStroke.Color = Color3.fromRGB(45, 55, 80)
    bStroke.Parent = btn

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = texto
    label.TextColor3 = Color3.fromRGB(230, 235, 255)
    label.TextSize = 11
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.ZIndex = 103
    label.Parent = btn

    local pill = Instance.new("Frame")
    pill.Size = UDim2.new(0, 38, 0, 22)
    pill.Position = UDim2.new(1, -48, 0.5, -11)
    pill.BackgroundColor3 = Color3.fromRGB(45, 55, 75)
    pill.ZIndex = 103
    pill.Parent = btn

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

    local estado = false
    btn.MouseButton1Click:Connect(function()
        estado = not estado
        if estado then
            pill.BackgroundColor3 = Color3.fromRGB(245, 158, 11)
            circle.Position = UDim2.new(1, -19, 0.5, -8)
            circle.BackgroundColor3 = Color3.fromRGB(14, 16, 24)
            bStroke.Color = Color3.fromRGB(245, 158, 11)
        else
            pill.BackgroundColor3 = Color3.fromRGB(45, 55, 75)
            circle.Position = UDim2.new(0, 3, 0.5, -8)
            circle.BackgroundColor3 = Color3.fromRGB(170, 180, 200)
            bStroke.Color = Color3.fromRGB(45, 55, 80)
        end
        callback(estado)
    end)
    return btn
end

local footer = Instance.new("TextLabel")
footer.Size = UDim2.new(1, 0, 0, 25)
footer.Position = UDim2.new(0, 0, 1, -28)
footer.BackgroundTransparency = 1
footer.Text = "⚡ Fast Kill + Alcance Distância Ativo"
footer.TextColor3 = Color3.fromRGB(130, 140, 165)
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

-- [4. FAST KILL SUPREMO & ALCANCE DE ATAQUE À DISTÂNCIA]
local function executarFastKill(alvo)
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("Humanoid") or char.Humanoid.Health <= 0 then return end

    -- 1. Equipa a arma automaticamente
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

    -- 2. Expande o alcance da hitbox do monstro para o golpe acertar de longe
    if alvo and alvo:FindFirstChild("HumanoidRootPart") then
        local hrp = alvo.HumanoidRootPart
        hrp.Size = Vector3.new(45, 45, 45)
        hrp.Transparency = 1
        hrp.CanCollide = false
    end

    -- 3. Sequência de Fast Attack contínuo (Fast Kill sem delay)
    if tool then
        pcall(function() tool:Activate() end)
        VirtualUser:CaptureController()
        VirtualUser:Button1Down(Vector2.new(0, 0))
        VirtualUser:Button1Up(Vector2.new(0, 0))
        
        -- Disparo do módulo de combate
        pcall(function()
            if ReplicatedStorage:FindFirstChild("RigControllerEvent") then
                ReplicatedStorage.RigControllerEvent:FireServer("weaponChange", tostring(tool.Name))
            end
        end)
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

-- Noclip automático para atravessar paredes sem travar
RunService.Stepped:Connect(function()
    if _G.PH_FarmLevel or _G.PH_AutoFruit then
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

-- [6. REGISTRO DOS BOTÕES NO MENU]
criarToggle("⚔️ AUTO FARM LEVEL", function(on)
    _G.PH_FarmLevel = on
    if not on and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        removerFlutuacao(LocalPlayer.Character.HumanoidRootPart)
    end
end)

criarToggle("🍒 AUTO PEGAR FRUTAS", function(on)
    _G.PH_AutoFruit = on
end)

-- [7. MOTOR: AUTO FARM COM DISTÂNCIA PERFEITA & FAST KILL RÁPIDO]
task.spawn(function()
    while true do
        task.wait(0.08) -- Velocidade alta para Fast Kill instantâneo

        if _G.PH_FarmLevel then
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

                        -- 📍 DISTÂNCIA PERFEITA: 11 studs acima (Você acerta 100% dos golpes e o monstro não te alcança)
                        fixarFlutuacao(root)
                        root.CFrame = CFrame.new(tPos + Vector3.new(0, 11, 0), tPos)

                        -- Bring Mobs: Agrupa os outros monstros no mesmo ponto da hitbox
                        for _, m in ipairs(mobs) do
                            if m ~= alvo and m:FindFirstChild("HumanoidRootPart") then
                                m.HumanoidRootPart.CFrame = alvo.HumanoidRootPart.CFrame
                                m.HumanoidRootPart.CanCollide = false
                                if m:FindFirstChild("Humanoid") then 
                                    m.Humanoid.WalkSpeed = 0 
                                end
                            end
                        end

                        -- Dispara o Fast Kill à distância
                        executarFastKill(alvo)
                    else
                        -- Monstros renascendo: flutua em segurança sobre a ilha
                        fixarFlutuacao(root)
                        root.CFrame = q.CFrameQuest + Vector3.new(0, 25, 0)
                        task.wait(1.0)
                    end
                end
            else
                task.wait(2)
            end
        end
    end
end)

-- [8. MOTOR: AUTO PEGAR FRUTAS DO CHÃO]
task.spawn(function()
    while true do
        task.wait(2)
        if _G.PH_AutoFruit and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local root = LocalPlayer.Character.HumanoidRootPart
            for _, item in ipairs(Workspace:GetChildren()) do
                if item:IsA("Tool") and string.find(string.lower(item.Name), "fruit") then
                    local handle = item:FindFirstChild("Handle") or item:FindFirstChildWhichIsA("BasePart")
                    if handle then
                        root.CFrame = handle.CFrame + Vector3.new(0, 2, 0)
                        task.wait(0.4)
                        if firetouchinterest then
                            firetouchinterest(root, handle, 0)
                            firetouchinterest(root, handle, 1)
                        end
                        task.wait(0.8)
                    end
                end
            end
        end
    end
end)
