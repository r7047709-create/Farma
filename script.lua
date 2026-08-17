--[[
    =======================================================
    ⚡ SCRIPT LUA / LUAU OTIMIZADO PARA ROBLOX MOBILE (ARCEUS X)
    ⚡ Gerado sem UI pesada | 100% Lógica Pura | Sem script.Parent
    ⚡ Seguro contra Memory Leaks em Celulares Fracos
    =======================================================
]]
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local VirtualUser = game:GetService("VirtualUser")

-- [CONFIGURAÇÕES]
local CONFIG = {
    WalkSpeed = 250,
    JumpPower = 50,
    SpeedEnabled = true,
    JumpEnabled = true,
    NoclipEnabled = true,
    TouchTPEnabled = true
}

-- [MÓDULO: SUPER VELOCIDADE]
local function aplicarVelocidade(character)
    if not character then return end
    local humanoid = character:WaitForChild("Humanoid", 5)
    if not humanoid then return end

    if CONFIG.SpeedEnabled then
        humanoid.WalkSpeed = CONFIG.WalkSpeed
    end

    local speedConn
    speedConn = humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        if CONFIG.SpeedEnabled and humanoid and humanoid.WalkSpeed ~= CONFIG.WalkSpeed then
            humanoid.WalkSpeed = CONFIG.WalkSpeed
        end
    end)

    humanoid.Died:Once(function()
        if speedConn then speedConn:Disconnect() end
    end)
end

-- [MÓDULO: PULO INFINITO LEVE]
task.spawn(function()
    UserInputService.JumpRequest:Connect(function()
        if not CONFIG.JumpEnabled then return end
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)
end)

-- [MÓDULO: NOCLIP EFICIENTE]
task.spawn(function()
    RunService.Stepped:Connect(function()
        if not CONFIG.NoclipEnabled then return end
        local char = LocalPlayer.Character
        if char then
            for _, part in ipairs(char:GetChildren()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end
    end)
end)

-- [MÓDULO: TOUCH TELEPORT]
task.spawn(function()
    local Camera = workspace.CurrentCamera
    UserInputService.TouchTapInWorld:Connect(function(touchPositions, processed)
        if processed or not CONFIG.TouchTPEnabled then return end
        local char = LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        local ray = Camera:ViewportPointToRay(touchPositions[1].X, touchPositions[1].Y)
        local params = RaycastParams.new()
        params.FilterDescendantsInstances = {char}
        params.FilterType = Enum.RaycastFilterType.Exclude

        local hit = workspace:Raycast(ray.Origin, ray.Direction * 1000, params)
        if hit and hit.Position then
            hrp.CFrame = CFrame.new(hit.Position + Vector3.new(0, 3, 0))
        end
    end)
end)

-- [MÓDULO: ANTI-AFK 20 MINUTOS]
task.spawn(function()
    LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new(0, 0))
    end)
end)

-- [MÓDULO: FPS BOOSTER / LIMPEZA DE RAM]
task.spawn(function()
    local Lighting = game:GetService("Lighting")
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    Lighting.Brightness = 1

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            obj.Material = Enum.Material.SmoothPlastic
            obj.CastShadow = false
        elseif obj:IsA("Decal") or obj:IsA("Texture") then
            obj.Transparency = 1
        elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
            obj.Enabled = false
        end
    end
end)

-- [INICIALIZAÇÃO EM THREAD SEGURA]
task.spawn(function()
    if LocalPlayer.Character then
        aplicarVelocidade(LocalPlayer.Character)
    end
    LocalPlayer.CharacterAdded:Connect(aplicarVelocidade)
end)
