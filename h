-- LocalScript, taruh di StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- GUI utama
local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "LoadingScreen"
loadingGui.ResetOnSpawn = false
loadingGui.IgnoreGuiInset = true
loadingGui.Parent = playerGui

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

-- Finding old server (statis)
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
fillBar.Size = UDim2.new(0.2, 0, 1, 0)
fillBar.Position = UDim2.new(-0.2, 0, 0, 0)
fillBar.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
fillBar.BorderSizePixel = 0
fillBar.ZIndex = 2
fillBar.Parent = barBackground
fillBar.Name = "FillBar"
local fillCorner = Instance.new("UICorner", fillBar)
fillCorner.CornerRadius = UDim.new(0, 999)

-- SpeedDupeV2 (RGB, lebih kecil & tebal)
local bottomText = Instance.new("TextLabel")
bottomText.AnchorPoint = Vector2.new(0.5, 0.5)
bottomText.Position = UDim2.new(0.5, 0, 0.72, 0)
bottomText.Size = UDim2.new(0.4, 0, 0.05, 0)
bottomText.BackgroundTransparency = 1
bottomText.Text = "SpeedDupeV2"
bottomText.TextColor3 = Color3.fromRGB(255, 255, 255)
bottomText.Font = Enum.Font.GothamBlack
bottomText.TextScaled = true
bottomText.ZIndex = 1
bottomText.Parent = loadingGui

-- Animasi RGB untuk SpeedDupeV2
local hue = 0
RunService.RenderStepped:Connect(function()
	hue = (hue + 0.005) % 1
	local color = Color3.fromHSV(hue, 1, 1)
	bottomText.TextColor3 = color
end)

-- Loading bar animasi cepat
task.spawn(function()
	while true do
		fillBar:TweenPosition(
			UDim2.new(1, 0, 0, 0),
			Enum.EasingDirection.InOut,
			Enum.EasingStyle.Quad,
			0.8,
			false,
			function()
				fillBar.Position = UDim2.new(-0.2, 0, 0, 0)
			end
		)
		wait(0.8)
	end
end)
