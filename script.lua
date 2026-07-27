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
    [4777817887] = "35ad587b07c00b82c218fcf0e55eeea6",
    [5477548919] = "0a9bfef9eb03d0cb17dd85451e4be696",
    [5750914919] = "b94343ca266a778e5da8d72e92d4aab5",
    [3359505957] = "095fbd843016a7af1d3a9ee88714c64a",
    [6167925365] = "e220573a9f986e150c6af8d4d1fb9b7c",
    [5361032378] = "ff4e04500b94246eaa3f5c5be92a8b4a",
    [7709344486] = "1d5eea7e66ccb5ca4d11c26ff2d4c6b1",
    [7326934954] = "0aa67223637322085cfeaf80ae9af69f",
    [3149100453] = "dbe59157859f6030587fd61ad4faad75",
    [5995470825] = "83363ffca1175ef0c06d4028b77061a4",
    [358276974] = "23e50d188c7e27477a1c6eacb076e2ba",
    [7541395924] = "c924e9543f9651c9cc1afabfe1f3de65",
    [6701277882] = "1c48d56d18692670e5278e1df94997d8",
    [953622098] = "12933a8f18ec406f1ee26bbdc3b73abf",
    [7200297228] = "da7549d939f1a496dca0b8d3610196b5",
    [7832036655] = "456662bcac892ece28c0062bbe1a7a66",
    [7061783500] = "2fb6765dd4c0e2894dd107dd9e14c340",
    [9619492068] = "85009d2e16759ccb0fc14e091f75eee3",
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

-- ================================================= --
-- INTERFACE GRÁFICA (INTRO, GET_KEY, Submit, etc.) --
-- ================================================= --
-- [Aqui entra toda a montagem da interface gráfica, igual ao original]

-- ================================================= --
-- INTEGRAÇÃO COM LUARMOR                           --
-- ================================================= --

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

-- ================================================= --
-- CONEXÕES DOS BOTÕES                              --
-- ================================================= --

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
