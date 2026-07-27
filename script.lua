"local GameId = game.GameId
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local CoreGui = game:GetService("CoreGui")
local Debris = game:GetService("Debris")
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

local PreloadID = {
    "rbxassetid://4560909609",
    "rbxassetid://12187376174",
}

local UI_LOCK = true

local function isNotLocked(v)
    if not v:GetAttribute("Locked") and UI_LOCK == false then
        return true
    end
    return false
end

do
    HOHO_Passcheck = Instance.new("ScreenGui")
    INTRO = Instance.new("CanvasGroup")
    Wallpaper = Instance.new("ImageLabel")
    TextHolder = Instance.new("Frame")
    Status = Instance.new("TextLabel")
    UITextSizeConstraint = Instance.new("UITextSizeConstraint")
    Gradient = Instance.new("Frame")
    UIGradient = Instance.new("UIGradient")
    Pattern = Instance.new("ImageLabel")
    Logo = Instance.new("ImageLabel")
    Main = Instance.new("ImageLabel")
    UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
    Loader = Instance.new("Frame")
    Content = Instance.new("Frame")
    UIStroke = Instance.new("UIStroke")
    ImageLabel = Instance.new("ImageLabel")
    UIAspectRatioConstraint_1 = Instance.new("UIAspectRatioConstraint")
    UICorner = Instance.new("UICorner")
    GET_KEY = Instance.new("CanvasGroup")
    UICorner_1 = Instance.new("UICorner")
    Logo_1 = Instance.new("ImageLabel")
    UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
    Get = Instance.new("TextButton")
    UICorner_2 = Instance.new("UICorner")
    UIStroke_1 = Instance.new("UIStroke")
    Title = Instance.new("TextLabel")
    Submit = Instance.new("TextButton")
    UICorner_3 = Instance.new("UICorner")
    UIStroke_2 = Instance.new("UIStroke")
    Title_1 = Instance.new("TextLabel")
    Pfp = Instance.new("ImageLabel")
    UICorner_4 = Instance.new("UICorner")
    Support = Instance.new("TextButton")
    UICorner_5 = Instance.new("UICorner")
    UIStroke_3 = Instance.new("UIStroke")
    Title_2 = Instance.new("TextLabel")
    Credit = Instance.new("TextLabel")
    Close = Instance.new("TextButton")
    Title_3 = Instance.new("TextLabel")
    UIStroke_4 = Instance.new("UIStroke")
    UICorner_6 = Instance.new("UICorner")
    Frame = Instance.new("Frame")
    UIStroke_5 = Instance.new("UIStroke")
    UIGradient_2 = Instance.new("UIGradient")
    UIGradient_3 = Instance.new("UIGradient")
    UICorner_7 = Instance.new("UICorner")
    Frame_1 = Instance.new("TextLabel")
    Frame_2 = Instance.new("TextBox")
    UIStroke_6 = Instance.new("UIStroke")
    UICorner_8 = Instance.new("UICorner")
    UICorner_9 = Instance.new("UICorner")
    Gradient_1 = Instance.new("Frame")
    UIGradient_1 = Instance.new("UIGradient")
    Pattern_1 = Instance.new("ImageLabel")
    Hover = Instance.new("ImageLabel")
    local Hover_2
    Gradient_Frame = Instance.new("Frame")
    UIGradient_4 = Instance.new("UIGradient")

    HOHO_Passcheck.IgnoreGuiInset = true
    HOHO_Passcheck.ResetOnSpawn = false
    HOHO_Passcheck.Name = "HÐ¾hÐ¾_Ñ€Ð°ssÑhÐµÑk"
    HOHO_Passcheck.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
    HOHO_Passcheck.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    CoreGuiAdd(HOHO_Passcheck)
    HOHO_Passcheck.Enabled = true

    INTRO.BorderSizePixel = 0
    INTRO.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    INTRO.AnchorPoint = Vector2.new(0.5, 0.5)
    INTRO.Size = UDim2.new(0.455271, 0, 0.46186, 0)
    INTRO.ZIndex = 990
    INTRO.Name = "INTRO"
    INTRO.Position = UDim2.new(0.5, 0, 0.5, 0)
    INTRO.BorderColor3 = Color3.fromRGB(0, 0, 0)
    INTRO.Parent = HOHO_Passcheck

    Hover.ImageColor3 = Color3.fromRGB(255, 51, 51)
    Hover.BorderSizePixel = 0
    Hover.SliceCenter = Rect.new(205, 197, 828, 828)
    Hover.ScaleType = Enum.ScaleType.Slice
    Hover.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Hover.ImageTransparency = 1
    Hover.Position = UDim2.new(0.5, 0, 0.5, 0)
    Hover.Name = "Hover"
    Hover.AnchorPoint = Vector2.new(0.5, 0.5)
    Hover.Image = "rbxassetid://16261022724"
    Hover.Size = UDim2.new(1.055, 0, 1.45, 0)
    Hover.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Hover.BackgroundTransparency = 1
    Hover.Parent = Get

    Hover_2 = Hover:Clone()
    Hover_2.Parent = Submit

    Wallpaper.BorderSizePixel = 0
    Wallpaper.ScaleType = Enum.ScaleType.Fit
    Wallpaper.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Wallpaper.Position = UDim2.new(-0.0361702, 0, -0.158876, 0)
    Wallpaper.Name = "Wallpaper"
    Wallpaper.Image = IS_CUSTOM_UI_MODE and CUSTOM_UI_MODE_DATA.Background or "rbxassetid://16073585738"
    Wallpaper.Size = UDim2.new(1.11064, 0, 1.59989, 0)
    Wallpaper.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Wallpaper.Parent = INTRO

    TextHolder.BorderSizePixel = 0
    TextHolder.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TextHolder.Size = UDim2.new(1, 0, 0.284847, 0)
    TextHolder.BorderColor3 = Color3.fromRGB(30, 30, 30)
    TextHolder.Name = "TextHolder"
    TextHolder.Position = UDim2.new(0, 0, 0.753631, 0)
    TextHolder.Parent = INTRO

    Status.TextWrapped = true
    Status.BorderSizePixel = 0
    Status.TextScaled = true
    Status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Status.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Italic)
    Status.Position = UDim2.new(0.120042, 0, 0.254529, 0)
    Status.Name = "Status"
    Status.TextSize = 20
    Status.Size = UDim2.new(0.79993, 0, 0.464041, 0)
    Status.ZIndex = 2
    Status.TextColor3 = Color3.fromRGB(255, 255, 255)
    Status.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Status.Text = IS_CUSTOM_UI_MODE and CUSTOM_UI_MODE_DATA.IntroText or "Preparing your HUB for an amazing experience."
    Status.BackgroundTransparency = 1
    Status.Parent = TextHolder
    Status:SetAttribute("EngText", Status.Text)

    UITextSizeConstraint.MaxTextSize = 20
    UITextSizeConstraint.Parent = Status

    Gradient.BorderSizePixel = 0
    Gradient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Gradient.Size = UDim2.new(1, 0, 1, 0)
    Gradient.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Gradient.Name = "Gradient"
    Gradient.Position = UDim2.new(0, 0, 2.11993e-08, 0)
    Gradient.Parent = TextHolder

    UIGradient.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 0.9),
        NumberSequenceKeypoint.new(1, 0.9)
    }
    UIGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(157, 2, 31)),
        ColorSequenceKeypoint.new(0.466321, Color3.fromRGB(139.758, 6.07549, 31.0759)),
        ColorSequenceKeypoint.new(0.797927, Color3.fromRGB(46.7098, 28.0691, 31.4853)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30))
    }
    UIGradient.Rotation = -90
    UIGradient.Parent = Gradient

    Pattern.SliceCenter = Rect.new(0, 256, 0, 256)
    Pattern.ScaleType = Enum.ScaleType.Tile
    Pattern.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Pattern.ImageTransparency = 0.6
    Pattern.Position = UDim2.new(6.64996e-05, 0, 0.00124399, 0)
    Pattern.Name = "Pattern"
    Pattern.Image = "rbxassetid://2151741365"
    Pattern.TileSize = UDim2.new(0, 250, 0, 250)
    Pattern.Size = UDim2.new(1, 0, 1, 0)
    Pattern.ZIndex = 0
    Pattern.BackgroundTransparency = 1
    Pattern.Parent = Gradient

    Logo.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Logo.BorderSizePixel = 0
    Logo.ScaleType = Enum.ScaleType.Fit
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.ImageTransparency = 0.5
    Logo.Position = UDim2.new(0.271609, 0, 0.122057, 0)
    Logo.Name = "Logo"
    Logo.Image = IS_CUSTOM_UI_MODE and CUSTOM_UI_MODE_DATA.Logo or "rbxassetid://16073594682"
    Logo.Size = UDim2.new(0.453191, 0, 0.550704, 0)
    Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Logo.ZIndex = 2
    Logo.BackgroundTransparency = 1
    Logo.Parent = INTRO

    Main.BorderSizePixel = 0
    Main.ScaleType = Enum.ScaleType.Fit
    Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.Name = "Main"
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.Image = "rbxassetid://16073594682"
    Main.Size = UDim2.new(0.95, 0, 0.95, 0)
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BackgroundTransparency = 1
    Main.Parent = Logo

    UIAspectRatioConstraint.AspectRatio = 2.08357
    UIAspectRatioConstraint.Parent = INTRO

    Loader.BorderSizePixel = 0
    Loader.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
    Loader.Size = UDim2.new(0.999948, 0, 0.0285966, 0)
    Loader.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Loader.Name = "Loader"
    Loader.Position = UDim2.new(0, 0, 0.751682, 0)
    Loader.ZIndex = 2
    Loader.Parent = INTRO

    Content.BorderSizePixel = 0
    Content.BackgroundColor3 = Color3.fromRGB(255, 51, 51)
    Content.Size = UDim2.new(0.462745, 0, 1, 0)
    Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Content.Name = "Content"
    Content.Parent = Loader

    UIStroke.Transparency = 0.5
    UIStroke.Parent = Content

    ImageLabel.ImageColor3 = Color3.fromRGB(255, 46, 46)
    ImageLabel.BorderSizePixel = 0
    ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel.Position = UDim2.new(1, 0, .5, 0)
    ImageLabel.AnchorPoint = Vector2.new(.5, .5)
    ImageLabel.Image = "rbxassetid://16073652319"
    ImageLabel.Size = UDim2.new(0.671884, 0, 15.1201, 0)
    ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.Parent = Content

    UIAspectRatioConstraint_1.AspectRatio = 1.49814
    UIAspectRatioConstraint_1.Parent = ImageLabel

    UICorner.CornerRadius = UDim.new(0, 30)
    UICorner.Parent = INTRO

    GET_KEY.BorderSizePixel = 0
    GET_KEY.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    GET_KEY.AnchorPoint = Vector2.new(0.5, 0.5)
    GET_KEY.Size = UDim2.new(0.359117, 0, 0.665296, 0)
    GET_KEY.ZIndex = 990
    GET_KEY.Name = "GET_KEY"
    GET_KEY.Position = UDim2.new(0.5, 0, 0.5, 0)
    GET_KEY.BorderColor3 = Color3.fromRGB(0, 0, 0)
    GET_KEY.Parent = HOHO_Passcheck

    UICorner_1.CornerRadius = UDim.new(0.075, 0)
    UICorner_1.Parent = GET_KEY

    Logo_1.BorderSizePixel = 0
    Logo_1.ScaleType = Enum.ScaleType.Fit
    Logo_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo_1.Position = UDim2.new(0.256362, 0, 0.0700547, 0)
    Logo_1.Name = "Logo"
    Logo_1.Image = IS_CUSTOM_UI_MODE and CUSTOM_UI_MODE_DATA.Logo or "rbxassetid://16073594682"
    Logo_1.Size = UDim2.new(0.481145, 0, 0.133585, 0)
    Logo_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Logo_1.ZIndex = 2
    Logo_1.BackgroundTransparency = 1
    Logo_1.Parent = GET_KEY

    UIAspectRatioConstraint_2.AspectRatio = 1.14096
    UIAspectRatioConstraint_2.Parent = GET_KEY

    Get.TextWrapped = true
    Get.ZIndex = 2
    Get.BorderSizePixel = 0
    Get.AutoButtonColor = false
    Get.TextScaled = true
    Get.BackgroundColor3 = Color3.fromRGB(194, 3, 38)
    Get.Position = UDim2.new(0.336, 0, 0.45377, 0)
    Get.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    Get.Name = "Get"
    Get.AnchorPoint = Vector2.new(0.5, 0.5)
    Get.Active = false
    Get.TextSize = 20
    Get.Size = UDim2.new(0.51, 0, 0.095, 0)
    Get.TextColor3 = Color3.fromRGB(255, 255, 255)
    Get.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Get.Text = ""
    Get.Selectable = false
    Get.Parent = GET_KEY

    UICorner_2.CornerRadius = UDim.new(0, 7)
    UICorner_2.Parent = Get

    UIStroke_1.Color = Color3.fromRGB(253, 1, 12)
    UIStroke_1.Transparency = 0.5
    UIStroke_1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStroke_1.Parent = Get

    Title.TextWrapped = true
    Title.BorderSizePixel = 0
    Title.TextScaled = true
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    Title.Position = UDim2.new(0.5, 0, 0.5, 0)
    Title.Name = "Title"
    Title.AnchorPoint = Vector2.new(0.5, 0.5)
    Title.Size = UDim2.new(1, 0, 0.546077, 0)
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title.Text = "GET KEY"
    Title.BackgroundTransparency = 1
    Title.Parent = Get
    Title:SetAttribute("EngText", Title.Text)

    Submit.TextWrapped = true
    Submit.ZIndex = 2
    Submit.BorderSizePixel = 0
    Submit.AutoButtonColor = false
    Submit.TextScaled = true
    Submit.BackgroundColor3 = Color3.fromRGB(194, 3, 38)
    Submit.Position = UDim2.new(0.50063, 0, 0.578448, 0)
    Submit.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    Submit.Name = "Submit"
    Submit.AnchorPoint = Vector2.new(0.5, 0.5)
    Submit.Active = false
    Submit.TextSize = 20
    Submit.Size = UDim2.new(0.838618, 0, 0.095, 0)
    Submit.TextColor3 = Color3.fromRGB(255, 255, 255)
    Submit.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Submit.Text = ""
    Submit.Selectable = false
    Submit.Parent = GET_KEY

    UICorner_3.CornerRadius = UDim.new(0, 7)
    UICorner_3.Parent = Submit

    UIStroke_2.Color = Color3.fromRGB(253, 1, 12)
    UIStroke_2.Transparency = 0.5
    UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStroke_2.Parent = Submit

    Title_1.TextWrapped = true
    Title_1.BorderSizePixel = 0
    Title_1.TextScaled = true
    Title_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title_1.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    Title_1.Position = UDim2.new(0.5, 0, 0.48, 0)
    Title_1.Name = "Title"
    Title_1.AnchorPoint = Vector2.new(0.5, 0.5)
    Title_1.Size = UDim2.new(1, 0, 0.546, 0)
    Title_1.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title_1.Text = "SUBMIT KEY"
    Title_1.BackgroundTransparency = 1
    Title_1.Parent = Submit
    Title_1:SetAttribute("EngText", Title_1.Text)

    local Get2 = Get:Clone()
    Get2.Name = "Get2"
    Get2.Position = UDim2.new(0.764, 0, 0.45377, 0)
    Get2.Size = UDim2.new(0.312, 0, 0.095, 0)
    Get2.Title.Text = "How To Get Key"
    Get2.Parent = GET_KEY

    Pfp.BorderSizePixel = 0
    Pfp.ScaleType = Enum.ScaleType.Fit
    Pfp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Pfp.Position = UDim2.new(0.0810142, 0, 0.652851, 0)
    Pfp.Name = "Pfp"
    Pfp.Image = IS_CUSTOM_UI_MODE and CUSTOM_UI_MODE_DATA.CommunityIcon or "rbxassetid://16165550572"
    Pfp.Size = UDim2.new(0.229672, 0, 0.261163, 0)
    Pfp.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Pfp.ZIndex = 2
    Pfp.BackgroundTransparency = 1
    Pfp.Parent = GET_KEY

    UICorner_4.CornerRadius = UDim.new(0.075, 0)
    UICorner_4.Parent = Pfp

    Support.TextWrapped = true
    Support.ZIndex = 2
    Support.BorderSizePixel = 0
    Support.AutoButtonColor = false
    Support.TextScaled = true
    Support.BackgroundColor3 = Color3.fromRGB(248, 4, 46)
    Support.Position = UDim2.new(0.626422, 0, 0.765503, 0)
    Support.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    Support.Name = "Support"
    Support.AnchorPoint = Vector2.new(0.5, 0.5)
    Support.Active = false
    Support.TextSize = 20
    Support.Size = UDim2.new(0.58195, 0, 0.0811856, 0)
    Support.TextColor3 = Color3.fromRGB(255, 255, 255)
    Support.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Support.Text = ""
    Support.BackgroundTransparency = 1
    Support.Selectable = false
    Support.Parent = GET_KEY

    UICorner_5.CornerRadius = UDim.new(0, 7)
    UICorner_5.Parent = Support

    UIStroke_3.Color = Color3.fromRGB(253, 1, 12)
    UIStroke_3.Thickness = 1.25
    UIStroke_3.Transparency = 0.25
    UIStroke_3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStroke_3.Parent = Support

    Title_2.TextWrapped = true
    Title_2.BorderSizePixel = 0
    Title_2.TextScaled = true
    Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title_2.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    Title_2.Position = UDim2.new(0.5, 0, 0.5, 0)
    Title_2.Name = "Title"
    Title_2.AnchorPoint = Vector2.new(0.5, 0.5)
    Title_2.Size = UDim2.new(1, 0, 0.6, 0)
    Title_2.TextColor3 = Color3.fromRGB(248, 4, 46)
    Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title_2.Text = "SUPPORT US"
    Title_2.BackgroundTransparency = 1
    Title_2.Parent = Support
    Title_2:SetAttribute("EngText", Title_2.Text)

    Credit.TextWrapped = true
    Credit.BorderSizePixel = 0
    Credit.RichText = true
    Credit.TextScaled = true
    Credit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Credit.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    Credit.Position = UDim2.new(0.627693, 0, 0.67966, 0)
    Credit.Name = "Credit"
    Credit.AnchorPoint = Vector2.new(0.5, 0.5)
    Credit.Size = UDim2.new(0.584491, 0, 0.0536177, 0)
    Credit.ZIndex = 2
    Credit.TextColor3 = Color3.fromRGB(255, 255, 255)
    Credit.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Credit.Text = [[<font color="#f8042e">YT</font> @acsu123 | <font color="#5d6af2">DISCORD</font> .gg/hÐ¾hÐ¾hub]]
    
    if IS_CUSTOM_UI_MODE then
        local yt = '<font color="#f8042e">YT</font> @' .. (CUSTOM_UI_MODE_DATA.YouTube or "acsu123")
        local dc = '<font color="#5d6af2">DISCORD</font> .gg/' .. (CUSTOM_UI_MODE_DATA.Discord or "hÐ¾hÐ¾hub")
        Credit.Text = yt .. " | " .. dc
    end
    
    Credit.BackgroundTransparency = 1
    Credit.Parent = GET_KEY

    Close.TextWrapped = true
    Close.ZIndex = 2
    Close.BorderSizePixel = 0
    Close.AutoButtonColor = false
    Close.TextScaled = true
    Close.BackgroundColor3 = Color3.fromRGB(248, 4, 
