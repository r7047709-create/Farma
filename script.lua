-- =========================================================
--  BLOX FRUITS - HUB MOBILE COMPLETO (DELTA EXECUTOR 2026)
-- =========================================================

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Delta Hub - Blox Fruits 🍊", "DarkTheme")

-- Serviços e Jogador
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local Stats = game:GetService("Stats")
local requestFunc = (syn and syn.request) or http_request or request

-- Variáveis Globais de Controle
_G.AutoFarm = false
_G.AutoChest = false
_G.AutoQuest = false
_G.SelectedMob = ""
_G.SelectedQuest = ""
local webhookURL = ""

-- =========================================================
-- LOOPS DE AUTOMAÇÃO (EM SEGUNDO PLANO)
-- =========================================================

-- 1. AUTO FARM DE MOBS (SAFE POSITION)
task.spawn(function()
    while task.wait(0.1) do
        if _G.AutoFarm and _G.SelectedMob ~= "" then
            pcall(function()
                for _, mob in pairs(game:GetService("Workspace"):GetChildren()) do
                    if mob:FindFirstChild("HumanoidRootPart") and mob.Name:find(_G.SelectedMob) then
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame + Vector3.new(0, 10, 0)
                            local VirtualUser = game:GetService("VirtualUser")
                            VirtualUser:CaptureController()
                            VirtualUser:ClickButton1(Vector2.new(500, 500))
                            task.wait(0.1)
                        end
                    end
                end
            end)
        end
    end
end)

-- 2. AUTO CHEST (COLETA DE BAÚS)
task.spawn(function()
    while task.wait(0.1) do
        if _G.AutoChest then
            pcall(function()
                for _, object in pairs(game:GetService("Workspace"):GetChildren()) do
                    if _G.AutoChest and object.Name:find("Chest") and object:IsA("Part") then
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = object.CFrame + Vector3.new(0, 3, 0)
                            task.wait(0.2)
                        end
                    end
                end
            end)
        end
    end
end)

-- 3. AUTO QUEST (ACEITAR MISSÃO AUTOMÁTICA)
task.spawn(function()
    while task.wait(1) do
        if _G.AutoQuest and _G.SelectedQuest ~= "" then
            pcall(function()
                local args = {
                    [1] = "StartQuest",
                    [2] = _G.SelectedQuest,
                    [3] = 1
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end)
        end
    end
end)

-- =========================================================
-- INTERFACE GRÁFICA (ABAS NO DELTA)
-- =========================================================

-- ABA 1: MOBS & QUESTS
local TabMobs = Window:NewTab("Auto Farm")
local SectionMobs = TabMobs:NewSection("Configuração do Farm")

SectionMobs:NewTextBox("Nome do Mob", "Ex: Bandit, Monkey", function(txt)
    _G.SelectedMob = txt
end)

SectionMobs:NewTextBox("Nome da Quest", "Ex: BanditQuest1", function(txt)
    _G.SelectedQuest = txt
end)

SectionMobs:NewToggle("Auto Quest", "Aceita a missão automaticamente", function(state)
    _G.AutoQuest = state
end)

SectionMobs:NewToggle("Auto Farm Mobs", "Teleporta e ataca com Safe Position", function(state)
    _G.AutoFarm = state
end)

-- ABA 2: BAÚS & RECURSOS
local TabChest = Window:NewTab("Baús & Utilidades")
local SectionChest = TabChest:NewSection("Coleta Automática")

SectionChest:NewToggle("Auto Chest (Baús)", "Teleporta e pega baús", function(state)
    _G.AutoChest = state
end)

-- ABA 3: OTIMIZAÇÃO MOBILE
local TabOpt = Window:NewTab("Otimização")
local SectionOpt = TabOpt:NewSection("FPS Boost")

SectionOpt:NewButton("Ativar FPS Boost Extremo", "Remove sombras e partículas", function()
    pcall(function()
        for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if v:IsA("BasePart") then
                v.Material = Enum.Material.SmoothPlastic
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v:Destroy()
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Enabled = false
            end
        end
    end)
end)

-- ABA 4: NUVEM (WEBHOOK DISCORD)
local TabDiscord = Window:NewTab("Discord")
local SectionDiscord = TabDiscord:NewSection("Monitoramento Remoto")

SectionDiscord:NewTextBox("URL do Webhook", "Cole o link do seu Webhook", function(txt)
    webhookURL = txt
end)

SectionDiscord:NewButton("Enviar Notificação Teste", "Envia log para o servidor", function()
    if webhookURL ~= "" then
        pcall(function()
            requestFunc({
                Url = webhookURL,
                Method = "POST",
                Headers = { ["Content-Type"] = "application/json" },
                Body = HttpService:JSONEncode({
                    embeds = {{
                        title = "🚀 Status Delta Hub",
                        description = "O Farm no celular está rodando com sucesso!",
                        color = 3066993,
                        fields = {
                            { name = "RAM Usada", value = math.floor(Stats:GetTotalMemoryUsageMb()) .. " MB", inline = true },
                            { name = "Mob Alvo", value = _G.SelectedMob ~= "" and _G.SelectedMob or "Nenhum", inline = true }
                        }
                    }}
                })
            })
        end)
    end
end)

-- Notificação de carregamento
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Delta Hub 2026",
    Text = "Hub totalmente carregado!",
    Duration = 4
})
