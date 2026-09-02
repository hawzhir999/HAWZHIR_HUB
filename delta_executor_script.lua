-- HAWZHIR HUB
-- Roblox Lua Script for Delta Executor
-- سکریپتی Roblox بە کوردی

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- رەنگەکان
local رەنگی_سپی = Color3.fromRGB(255, 255, 255)
local رەنگی_شین = Color3.fromRGB(0, 127, 255)
local رەنگی_سور = Color3.fromRGB(255, 0, 0)
local رەنگی_زهێرد = Color3.fromRGB(255, 255, 0)

-- دۆخی سکریپت
local کارەکتەر_ڕان = false
local هیلکەی_هۆڵا = nil
local سکریپت_چالاک = true

-- GUI دروست بکە
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HAWZHIR_HUB"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- سەرناوە
local سەرناوە = Instance.new("TextLabel")
سەرناوە.Name = "Title"
سەرناوە.Size = UDim2.new(0, 400, 0, 50)
سەرناوە.Position = UDim2.new(0.5, -200, 0, 10)
سەرناوە.BackgroundColor3 = رەنگی_شین
سەرناوە.TextColor3 = رەنگی_سپی
سەرناوە.TextSize = 24
سەرناوە.Text = "HAWZHIR HUB"
سەرناوە.Font = Enum.Font.GothamBold
سەرناوە.Parent = screenGui

-- چوار گۆشەی هیلکەکان
local هیلکەکان = {
    {ناو = "هیلکی یەکەم", Position = UDim2.new(0, 20, 0, 80)},
    {ناو = "هیلکی دووەم", Position = UDim2.new(0, 220, 0, 80)},
    {ناو = "هیلکی سێیەم", Position = UDim2.new(0, 20, 0, 200)},
    {ناو = "هیلکی چوارەم", Position = UDim2.new(0, 220, 0, 200)}
}

-- هیلکەکان دروست بکە
for i, هیلکە in ipairs(هیلکەکان) do
    local دوگمە = Instance.new("TextButton")
    دوگمە.Name = "Hilka_" .. i
    دوگمە.Size = UDim2.new(0, 150, 0, 80)
    دوگمە.Position = هیلکە.Position
    دوگمە.BackgroundColor3 = رەنگی_شین
    دوگمە.TextColor3 = رەنگی_سپی
    دوگمە.TextSize = 16
    دوگمە.Text = هیلکە.ناو
    دوگمە.Font = Enum.Font.Gotham
    دوگمە.Parent = screenGui
    
    دوگمە.MouseButton1Click:Connect(function()
        هیلکەی_هۆڵا = i
        دوگمە.BackgroundColor3 = رەنگی_زهێرد
        print("✅ " .. هیلکە.ناو .. " هیلا کرا!")
        
        -- رەنگی دووبارە گێڕاوە بۆ شین
        wait(0.5)
        دوگمە.BackgroundColor3 = رەنگی_شین
    end)
end

-- دوگمەی Go
local دوگمەی_Go = Instance.new("TextButton")
دوگمەی_Go.Name = "Go_Button"
دوگمەی_Go.Size = UDim2.new(0, 120, 0, 50)
دوگمەی_Go.Position = UDim2.new(0, 20, 0, 300)
دوگمەی_Go.BackgroundColor3 = رەنگی_سپی
دوگمەی_Go.TextColor3 = رەنگی_شین
دوگمەی_Go.TextSize = 18
دوگمەی_Go.Text = "Go"
دوگمەی_Go.Font = Enum.Font.GothamBold
دوگمەی_Go.Parent = screenGui

دوگمەی_Go.MouseButton1Click:Connect(function()
    کارەکتەر_ڕان = true
    دوگمەی_Go.BackgroundColor3 = رەنگی_زهێرد
    print("🚀 کارەکتەرەکە ڕاق بووەوە!")
    
    -- کارەکتەرەکە خوڵ بکە
    if character:FindFirstChild("Humanoid") then
        character.Humanoid:MoveTo(humanoidRootPart.Position + Vector3.new(50, 0, 0))
    end
end)

-- دوگمەی Stop
local دوگمەی_Stop = Instance.new("TextButton")
دوگمەی_Stop.Name = "Stop_Button"
دوگمەی_Stop.Size = UDim2.new(0, 120, 0, 50)
دوگمەی_Stop.Position = UDim2.new(0, 150, 0, 300)
دوگمەی_Stop.BackgroundColor3 = رەنگی_سور
دوگمەی_Stop.TextColor3 = رەنگی_سپی
دوگمەی_Stop.TextSize = 18
دوگمەی_Stop.Text = "Stop"
دوگمەی_Stop.Font = Enum.Font.GothamBold
دوگمەی_Stop.Parent = screenGui

دوگمەی_Stop.MouseButton1Click:Connect(function()
    کارەکتەر_ڕان = false
    هیلکەی_هۆڵا = nil
    دوگمەی_Go.BackgroundColor3 = رەنگی_سپی
    print("🛑 کارەکتەرەکە وەستا!")
end)

-- دوگمەی Close (×)
local دوگمەی_Close = Instance.new("TextButton")
دوگمەی_Close.Name = "Close_Button"
دوگمەی_Close.Size = UDim2.new(0, 40, 0, 40)
دوگمەی_Close.Position = UDim2.new(0, 360, 0, 10)
دوگمەی_Close.BackgroundColor3 = رەنگی_سور
دوگمەی_Close.TextColor3 = رەنگی_سپی
دوگمەی_Close.TextSize = 24
دوگمەی_Close.Text = "×"
دوگمەی_Close.Font = Enum.Font.GothamBold
دوگمەی_Close.Parent = screenGui

دوگمەی_Close.MouseButton1Click:Connect(function()
    سکریپت_چالاک = false
    screenGui:Destroy()
    print("🔴 HAWZHIR HUB داخرا!")
end)

-- لۆجیکی سکریپت
local کارکردن = RunService.Heartbeat:Connect(function()
    if not سکریپت_چالاک then
        کارکردن:Disconnect()
        return
    end
    
    if کارەکتەر_ڕان and هیلکەی_هۆڵا then
        -- کارەکتەرەکە بۆ هیلکەکە خوڵ بکە
        character = player.Character
        if character then
            humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart and character:FindFirstChild("Humanoid") then
                -- یێکێکی تیک لە هیلکەکان
                local ھیلکەی_لیستی = game.Workspace:FindFirstChild("Egg") or game.Workspace:FindFirstChildWhichIsA("Part")
                
                if ھیلکەی_لیستی then
                    character.Humanoid:MoveTo(ھیلکەی_لیستی.Position)
                end
            end
        end
    end
end)

-- شاشەی کیبۆردی
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    -- G = Go
    if input.KeyCode == Enum.KeyCode.G then
        دوگمەی_Go:TriggerEvent("MouseButton1Click")
    end
    
    -- S = Stop
    if input.KeyCode == Enum.KeyCode.S then
        دوگمەی_Stop:TriggerEvent("MouseButton1Click")
    end
    
    -- X = Close
    if input.KeyCode == Enum.KeyCode.X then
        دوگمەی_Close:TriggerEvent("MouseButton1Click")
    end
end)

print("✅ HAWZHIR HUB بار بووەوە!")
print("🎮 کیبۆردی: G = Go | S = Stop | X = Close")
