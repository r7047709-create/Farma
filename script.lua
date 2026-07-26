-- =========================================================
--  BLOX FRUITS - HUB MOBILE DEBUG (DELTA EXECUTOR 2026)
-- =========================================================

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Delta Hub - DEBUG 🍊", "DarkTheme")

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

print("[DEBUG] Hub iniciado. Aguardando interações...")

-- =========================================================
-- LOOPS DE AUTOMAÇÃO COM LOGS DE CONSOLE
-- =========================================================

-- 1. AUTO FARM DE MOBS
task.spawn(function()
    while task.wait(0.5) do
        if _G.AutoFarm then
            print("[DEBUG LOOP] AutoFarm está LIGADO! Alvo atual:", _G.SelectedMob)
            if _G.SelectedMob ~= "" then
                pcall(function()
                    for _, mob in pairs(game:GetService("Workspace"):GetChildren()) do
                        if mob:FindFirstChild("HumanoidRootPart") and mob.Name:find(_G.SelectedMob) then
                            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                print("[DEBUG FARM] Teleportando para o mob:", mob.Name)
                                LocalPlayer.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame + Vector3.new(0, 10, 0)
                                local VirtualUser = game:GetService("VirtualUser")
                                VirtualUser:CaptureController()
                                VirtualUser:ClickButton1(Vector2.new(500, 500))
                            end
                        end
                    end
                end)
            else
                print("[DEBUG AVISO] AutoFarm ligado, mas nenhum nome de mob foi digitado!")
            end
        end
    end
end)

-- 2. AUTO CHEST
task.spawn(function()
    while task.wait(1) do
        if _G.AutoChest then
            print("[DEBUG LOOP] AutoChest está LIGADO! Procurando baús...")
            pcall(function()
                for _, object in pairs(game:GetService("Workspace"):GetChildren()) do
                    if _G.AutoChest and object.Name:find("Chest") and object:IsA("Part") then
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            print("[DEBUG CHEST] Coletando baú:", object.Name)
                            LocalPlayer.Character.HumanoidRootPart.CFrame = object.CFrame + Vector3.new(0, 3, 0)
                            task.wait(0.2)
                        end
                    end
                end
            end)
        end
    end
end)

-- 3. AUTO QUEST
task.spawn(function()
    while task.wait(2) do
        if _G.AutoQuest then
            print("[DEBUG LOOP] AutoQuest está LIGADO! Quest:", _G.SelectedQuest)
            if _G.SelectedQuest ~= "" then
                pcall(function()
                    local args = {
                        [1] = "StartQuest",
                        [2] = _G.SelectedQuest,
                        [3] = 1
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    print("[DEBUG QUEST] Comando de quest enviado ao servidor.")
                end)
            else
                print("[DEBUG AVISO] AutoQuest ligado, mas nenhum nome de quest foi digitado!")
            end
        end
    end
end)

-- =========================================================
-- INTERFACE GRÁFICA (COM PRINTS DE CALLBACK)
-- =========================================================

local TabMobs = Window:NewTab("Auto Farm")
local SectionMobs = TabMobs:NewSection("Configuração do Farm")

SectionMobs:NewTextBox("Nome do Mob", "Ex: Bandit, Monkey", function(txt)
    _G.SelectedMob = txt
    print("[UI EVENT] Nome do mob alterado para:", txt)
end)

SectionMobs:NewTextBox("Nome da Quest", "Ex: BanditQuest1", function(txt)
    _G.SelectedQuest = txt
    print("[UI EVENT] Nome da quest alterado para:", txt)
end)

SectionMobs:NewToggle("Auto Quest", "Aceita a missão automaticamente", function(state)
    _G.AutoQuest = state
    print("[UI EVENT] Toggle AutoQuest mudou para:", tostring(state))
end)

SectionMobs:NewToggle("Auto Farm Mobs", "Teleporta e ataca com Safe Position", function(state)
    _G.AutoFarm = state
    print("[UI EVENT] Toggle AutoFarm mudou para:", tostring(state))
end)

local TabChest = Window:NewTab("Baús & Utilidades")
local SectionChest = TabChest:NewSection("Coleta Automática")

SectionChest:NewToggle("Auto Chest (Baús)", "Teleporta e pega baús", function(state)
    _G.AutoChest = state
    print("[UI EVENT] Toggle AutoChest mudou para:", tostring(state))
end)

local TabOpt = Window:NewTab("Otimização")
local SectionOpt = TabOpt:NewSection("FPS Boost")

SectionOpt:NewButton("Ativar FPS Boost Extremo", "Remove sombras e partículas", function()
    print("[UI EVENT] Botão FPS Boost acionado.")
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
    print("[OTIMIZAÇÃO] FPS Boost aplicado com sucesso!")
end)

local TabDiscord = Window:NewTab("Discord")
local SectionDiscord = TabDiscord:NewSection("Monitoramento Remoto")

SectionDiscord:NewTextBox("URL do Webhook", "Cole o link do seu Webhook", function(txt)
    webhookURL = txt
    print("[UI EVENT] Webhook URL atualizada.")
end)

SectionDiscord:NewButton("Enviar Notificação Teste", "Envia log para o servidor", function()
    print("[UI EVENT] Botão de teste do Webhook acionado.")
    if webhookURL ~= "" then
        pcall(function()
            requestFunc({
                Url = webhookURL,
                Method = "POST",
                Headers = { ["Content-Type"] = "application/json" },
                Body = HttpService:JSONEncode({
                    embeds = {{
                        title = "🚀 Status Delta Hub (DEBUG)",
                        description = "O script de diagnóstico está comunicando perfeitamente!",
                        color = 3066993,
                        fields = {
                            { name = "RAM Usada", value = math.floor(Stats:GetTotalMemoryUsageMb()) .. " MB", inline = true },
                            { name = "Mob Alvo", value = _G.SelectedMob ~= "" and _G.SelectedMob or "Nenhum", inline = true }
                        }
                    }}
                })
            })
            print("[WEBHOOK] Requisição enviada com sucesso!")
        end)
    else
        print("[AVISO WEBHOOK] URL do Webhook está vazia!")
    end
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Delta Hub - DEBUG",
    Text = "Versão de diagnóstico carregada!",
    Duration = 4
})
