-- SCRIPT BY DARK X TEAM


-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.Position = UDim2.new(0.5, -100, 0.5, -75)
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Text = "Aimbot v1"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Size = UDim2.new(1, 0, 0, 25)
Title.Parent = Frame

local ONOFFButton = Instance.new("TextButton")
ONOFFButton.Text = "OFF"
ONOFFButton.Position = UDim2.new(0.5, -50, 0.5, -25)
ONOFFButton.Size = UDim2.new(0, 100, 0, 50)
ONOFFButton.Parent = Frame

local HeadAimButton = Instance.new("TextButton")
HeadAimButton.Text = "Head-Aim"
HeadAimButton.Position = UDim2.new(0, 25, 1, -50)
HeadAimButton.Size = UDim2.new(0, 75, 0, 25)
HeadAimButton.Parent = Frame

local BodyAimButton = Instance.new("TextButton")
BodyAimButton.Text = "Body-Aim"
BodyAimButton.Position = UDim2.new(1, -100, 1, -50)
BodyAimButton.Size = UDim2.new(0, 75, 0, 25)
BodyAimButton.Parent = Frame

local Footer = Instance.new("TextLabel")
Footer.Text = "by Dark X Team"
Footer.TextColor3 = Color3.fromRGB(255, 255, 255)
Footer.Position = UDim2.new(0, 0, 1, -25)
Footer.Size = UDim2.new(1, 0, 0, 25)
Footer.Parent = Frame

-- Button functions
local aimbotEnabled = false
local aimAtHead = true

ONOFFButton.MouseButton1Click:Connect(function()
    aimbotEnabled = not aimbotEnabled
    if aimbotEnabled then
        ONOFFButton.Text = "ON"
    else
        ONOFFButton.Text = "OFF"
    end
end)

HeadAimButton.MouseButton1Click:Connect(function()
    aimAtHead = true
    HeadAimButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    BodyAimButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
end)

BodyAimButton.MouseButton1Click:Connect(function()
    aimAtHead = false
    BodyAimButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    HeadAimButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
end)

-- Aimbot
game:GetService("RunService").Stepped:Connect(function()
    if aimbotEnabled then
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player.TeamColor ~= game.Players.LocalPlayer.TeamColor then
                if aimAtHead then
                    -- head
                else
                    -- body
                end
            end
        end
    end
end)
