-- LocalScript, taruh di StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Sembunyikan semua UI bawaan Roblox (leaderboard, chat, dll)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)

-- GUI utama
local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "LoadingScreen"
loadingGui.ResetOnSpawn = false
loadingGui.IgnoreGuiInset = true
loadingGui.Parent = playerGui

-- Sembunyikan semua UI lain buatan sendiri (kecuali loading screen ini)
for _, gui in ipairs(playerGui:GetChildren()) do
	if gui:IsA("ScreenGui") and gui.Name ~= "LoadingScreen" then
		gui.Enabled = false
	end
end

-- Background hitam polos
local backgroundOverlay = Instance.new("Frame")
backgroundOverlay.Size = UDim2.new(1, 0, 1, 0)
backgroundOverlay.Position = UDim2.new(0, 0, 0, 0)
backgroundOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
backgroundOverlay.BackgroundTransparency = 0
backgroundOverlay.ZIndex = 0
backgroundOverlay.Parent = loadingGui

-- 🥕Grow a garden🌴 (tebal)
local topText = Instance.new("TextLabel")
topText.AnchorPoint = Vector2.new(0.5, 0.5)
topText.Position = UDim2.new(0.5, 0, 0.3, 0)
topText.Size = UDim2.new(0.8, 0, 0.1, 0)
topText.BackgroundTransparency = 1
topText.Text = "🥕Grow a garden🌴"
topText.TextColor3 = Color3.fromRGB(255, 255, 255)
topText.Font = Enum.Font.GothamBlack
topText.TextScaled = true
topText.ZIndex = 1
topText.Parent = loadingGui

-- Finding old server (putih)
local middleText = Instance.new("TextLabel")
middleText.AnchorPoint = Vector2.new(0.5, 0.5)
middleText.Position = UDim2.new(0.5, 0, 0.5, 0)
middleText.Size = UDim2.new(0.8, 0, 0.15, 0)
middleText.BackgroundTransparency = 1
middleText.Text = "Finding old server"
middleText.TextColor3 = Color3.fromRGB(255, 255, 255)
middleText.Font = Enum.Font.GothamBold
middleText.TextScaled = true
middleText.ZIndex = 1
middleText.Parent = loadingGui

-- Loading bar background
local barBackground = Instance.new("Frame")
barBackground.Size = UDim2.new(0.4, 0, 0.015, 0)
barBackground.Position = UDim2.new(0.5, 0, 0.6, 0)
barBackground.AnchorPoint = Vector2.new(0.5, 0.5)
barBackground.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
barBackground.BorderSizePixel = 0
barBackground.ZIndex = 1
barBackground.ClipsDescendants = true
barBackground.Parent = loadingGui
barBackground.BackgroundTransparency = 0.2
barBackground.Name = "BarBackground"
local barCorner = Instance.new("UICorner", barBackground)
barCorner.CornerRadius = UDim.new(0, 999)

-- Loading bar isi
local fillBar = Instance.new("Frame")
fillBar.Size = UDim2.new(0.3, 0, 1, 0)
fillBar.Position = UDim2.new(-0.3, 0, 0, 0)
fillBar.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
fillBar.BorderSizePixel = 0
fillBar.ZIndex = 2
fillBar.Parent = barBackground
fillBar.Name = "FillBar"
local fillCorner = Instance.new("UICorner", fillBar)
fillCorner.CornerRadius = UDim.new(0, 999)

-- Infinite loading bar animation
task.spawn(function()
	while true do
		fillBar.Position = UDim2.new(-0.3, 0, 0, 0)
		fillBar:TweenPosition(
			UDim2.new(1, 0, 0, 0),
			Enum.EasingDirection.InOut,
			Enum.EasingStyle.Quad,
			1.2,
			false
		)
		wait(1.2)
	end
end)

-- SpeedDupeV2 (RGB, kecil, tebal, lebih bawah)
local bottomText = Instance.new("TextLabel")
bottomText.AnchorPoint = Vector2.new(0.5, 0.5)
bottomText.Position = UDim2.new(0.5, 0, 0.76, 0) -- <- digeser lebih ke bawah
bottomText.Size = UDim2.new(0.4, 0, 0.05, 0)
bottomText.BackgroundTransparency = 1
bottomText.Text = "SpeedDupeV2"
bottomText.TextColor3 = Color3.fromRGB(255, 255, 255)
bottomText.Font = Enum.Font.GothamBlack
bottomText.TextScaled = true
bottomText.ZIndex = 1
bottomText.Parent = loadingGui

-- RGB animasi untuk SpeedDupeV2
local hue = 0
RunService.RenderStepped:Connect(function()
	hue = (hue + 0.005) % 1
	local color = Color3.fromHSV(hue, 1, 1)
	bottomText.TextColor3 = color
end)
