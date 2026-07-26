-- =========================================================
--  BLOX FRUITS - RELATÓRIO HORÁRIO AUTOMÁTICO + WEBHOOK (DELTA 2026)
-- =========================================================

local HttpService = game:GetService("HttpService")
local Stats = game:GetService("Stats")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- URL do seu Webhook do Discord
local webhookURL = "https://discord.com/api/webhooks/SEU_WEBHOOK_AQUI"

-- Função genérica para enviar embeds
local function sendDiscordEmbed(payload)
    local jsonData = HttpService:JSONEncode(payload)
    pcall(function()
        http_request({
            Url = webhookURL,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = jsonData
        })
    end)
end

-- Funções de envio para cada cenário
local function sendGreenReport(xp, beli, fps, ram, ping, thumbUrl)
    local payload = {
        embeds = {{
            title = "✅ Sessão Estável - Relatório de Farm",
            description = "Resumo da última hora de execução.",
            color = 3066993,
            fields = {
                { name = "XP Ganho", value = tostring(xp), inline = true },
                { name = "Beli Acumulado", value = tostring(beli), inline = true },
                { name = "FPS Médio", value = tostring(fps), inline = true },
                { name = "RAM", value = tostring(ram) .. " MB", inline = true },
                { name = "Ping", value = tostring(ping) .. " ms", inline = true }
            },
            thumbnail = { url = thumbUrl },
            footer = { text = "Delta Executor - Hub Automação" },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    }
    sendDiscordEmbed(payload)
end

local function sendYellowAlert(xp, beli, fps, ram, ping, thumbUrl)
    local payload = {
        embeds = {{
            title = "⚠️ Alerta de Estabilidade",
            description = "O sistema detectou instabilidade moderada.",
            color = 16776960,
            fields = {
                { name = "XP Ganho", value = tostring(xp), inline = true },
                { name = "Beli Acumulado", value = tostring(beli), inline = true },
                { name = "FPS Médio", value = tostring(fps), inline = true },
                { name = "RAM", value = tostring(ram) .. " MB", inline = true },
                { name = "Ping", value = tostring(ping) .. " ms", inline = true }
            },
            thumbnail = { url = thumbUrl },
            footer = { text = "Delta Executor - Hub Automação" },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    }
    sendDiscordEmbed(payload)
end

local function sendRedSOS(xp, beli, fps, ram, ping, thumbUrl)
    local payload = {
        embeds = {{
            title = "🚨 ALERTA SOS - Sessão Crítica",
            description = "O hub não conseguiu conter a sobrecarga. Sessão encerrada.",
            color = 15158332,
            fields = {
                { name = "XP Ganho", value = tostring(xp), inline = true },
                { name = "Beli Acumulado", value = tostring(beli), inline = true },
                { name = "FPS Médio", value = tostring(fps), inline = true },
                { name = "RAM", value = tostring(ram) .. " MB", inline = true },
                { name = "Ping", value = tostring(ping) .. " ms", inline = true }
            },
            thumbnail = { url = thumbUrl },
            footer = { text = "Delta Executor - Hub Automação" },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    }
    sendDiscordEmbed(payload)
end

-- Configurações do Agendador
local REPORT_INTERVAL = 3600 -- 1 hora

-- Loop de envio periódico
task.spawn(function()
    while task.wait(REPORT_INTERVAL) do
        pcall(function()
            local memoryMB = math.floor(Stats:GetTotalMemoryUsageMb())
            local fps = math.floor(1 / workspace:GetRealPhysicsFPS())
            local ping = 0
            pcall(function()
                ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
            end)

            local currentXp = "250,000" -- Exemplo: substituir por leitura real
            local currentBeli = "4.5M"
            local thumbUrl = "https://link-da-fruta.png"

            if memoryMB > 500 or fps < 20 then
                sendRedSOS(currentXp, currentBeli, fps, memoryMB, ping, "https://link-de-desconexao.png")
            elseif memoryMB > 450 or fps < 35 then
                sendYellowAlert(currentXp, currentBeli, fps, memoryMB, ping, "https://link-do-boss.png")
            else
                sendGreenReport(currentXp, currentBeli, fps, memoryMB, ping, thumbUrl)
            end
        end)
    end
end)
