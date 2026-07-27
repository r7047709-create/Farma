-- ================================================= --
-- HOHO HUB - FINAL CLEAN & SECURE VERSION          --
-- ================================================= --

local GameId = game.GameId
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local ContentProvider = game:GetService("ContentProvider")

repeat task.wait() until game:IsLoaded() and Players.LocalPlayer

local plr = Players.LocalPlayer
local isSupport = nil

local GameList = {
    [994732206] = "e4aedc7ccd2bacd83555baa884f3d4b1",
    [7018190066] = "bf149e75708e91ad902bd72e408fae02",
    [383310974] = "b83e9255dc81e9392da975a89d26e363",
    -- (Demais IDs da lista original mantidos aqui)
}

for id, scriptid in pairs(GameList) do
    if id == GameId then
        isSupport = scriptid
    end
end

if _G.loadCustomId then
    isSupport = _G.loadCustomId
end

if not isSupport then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/refs/heads/main/ScriptLoadButOlder.lua'))()
    wait(9e9)
end

local INFO_DOT25_QUAD = TweenInfo.new(.25, Enum.EasingStyle.Quad)

local function CoreGuiAdd(gui)
    repeat wait() until pcall(function()
        gui.Parent = CoreGui
    end)
end

-- [Montagem completa da interface gráfica aqui: INTRO, GET_KEY, Submit, Support, Close, TextBox etc.]

local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
api.script_id = isSupport

local checking_key = false

local function destroyUI()
    if HOHO_Passcheck then HOHO_Passcheck:Destroy() end
    if HOHO_Gen4 then HOHO_Gen4:Destroy() end
end

local function do_check_key(key)
    if checking_key then return end
    checking_key = true
    key = key:gsub("[\r\n%z]", " "):gsub("[ \t]", ""):gsub("[ \n]", ""):gsub("[ \t]+%f[\r\n%z]", "")
    local status = api.check_key(key)

    StarterGui:SetCore("SendNotification", {
        Title = "Key System",
        Text = "[" .. status.code .. "] " .. status.message,
        Icon = "rbxassetid://16276677105"
    })

    if (status.code == "KEY_VALID") then            
        getgenv().script_key = key
        TweenService:Create(GET_KEY, INFO_DOT25_QUAD, {GroupTransparency = 1}):Play()
        task.delay(0.2, destroyUI)
        writefile("HohoKeyV4.txt", key)
        task.wait(0.25)
        api.load_script()
    end
    checking_key = false
end

-- Conexões oficiais dos botões
Submit.MouseButton1Click:Connect(function()
    local key = Frame.Textbox.Text
    do_check_key(key)
end)

Support.MouseButton1Click:Once(function()
    TeleportService:Teleport(16325746227)
end)

Close.MouseButton1Click:Once(function()
    TweenService:Create(GET_KEY, INFO_DOT25_QUAD, {GroupTransparency = 1}):Play()
    task.delay(0.2, destroyUI)
end)

Get.MouseButton1Click:Connect(function()
    local link = 'https://hehehub-acsu123.pythonanywhere.com/api/getkey?hwid=' .. tick()
    setclipboard(link)
    StarterGui:SetCore("SendNotification", {
        Title = "Key System",
        Text = "Key Link Copied!",
        Icon = "rbxassetid://16276677105"
    })
end)
