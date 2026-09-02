-- ██╗  ██╗ █████╗ ██╗    ██╗███████╗██╗  ██╗██╗██████╗     ██╗  ██╗██╗   ██╗██████╗ 
-- ██║  ██║██╔══██╗██║    ██║██╔════╝██║  ██║██║██╔══██╗    ██║  ██║██║   ██║██╔══██╗
-- ███████║███████║██║ █╗ ██║███████╗███████║██║██████╔╝    ███████║██║   ██║██████╔╝
-- ██╔══██║██╔══██║██║███╗██║╚════██║██╔══██║██║██╔══██╗    ██╔══██║██║   ██║██╔══██╗
-- ██║  ██║██║  ██║╚███╔███╔╝███████║██║  ██║██║██║  ██║    ██║  ██║╚██████╔╝██████╔╝
-- ╚═╝  ╚═╝╚═╝  ╚═╝ ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ 
-- HAWZHIR HUB - Roblox Delta Executor Script
-- سکریپتی Roblox بە کوردی - چوار گۆشە، دوگمە، هیلکە

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- ══════════════════════════════════════════════════════
-- رەنگەکان
-- ══════════════════════════════════════════════════════
local رەنگی_سپی = Color3.fromRGB(255, 255, 255)
local رەنگی_ڕەش = Color3.fromRGB(0, 0, 0)
local رەنگی_شین = Color3.fromRGB(0, 150, 255)
local رەنگی_سور = Color3.fromRGB(255, 50, 50)
local رەنگی_زهێرد = Color3.fromRGB(255, 200, 0)
local رەنگی_سبز = Color3.fromRGB(50, 200, 50)

-- ══════════════════════════════════════════════════════
-- دۆخی سکریپت
-- ══════════════════════════════════════════════════════
local کارەکتەر_ڕان = false
local هیلکەی_هۆڵا = nil
local سکریپت_چالاک = true

-- ══════════════════════════════════════════════════════
-- GUI دروست بکە
-- ══════════════════════════════════════════════════════
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HAWZHIR_HUB"
screenGui.ResetOnSpawn = false
screenGui.Enabled = true
screenGui.Parent = player:WaitForChild("PlayerGui")

-- سەرناوە
local سەرناوە = Instance.new("TextLabel")
سەرناوە.Name = "Title"
سەرناوە.Size = UDim2.new(0, 500, 0, 60)
سەرناوە.Position = UDim2.new(0.5, -250, 0, 10)
سەرناوە.BackgroundColor3 = رەنگی_شین
سەرناوە.TextColor3 = رەنگی_سپی
سەرناوە.TextSize = 28
سەرناوە.Text = "🎮 HAWZHIR HUB"
سەرناوە.Font = Enum.Font.GothamBold
سەرناوە.BorderSizePixel = 0
سەرناوە.Parent = screenGui

-- ══════════════════════════════════════════════════════
-- چوار گۆشەی هیلکەکان
-- ══════════════════════════════════════════════════════
local هیلکەکان = {
    {ناو = "🥚 هیلکی یەکەم", Position = UDim2.new(0, 20, 0, 90), خەون = 1},
    {ناو = "🥚 هیلکی دووەم", Position = UDim2.new(0, 260, 0, 90), خەون = 2},
    {ناو = "🥚 هیلکی سێیەم", Position = UDim2.new(0, 20, 0, 220), خەون = 3},
    {ناو = "🥚 هیلکی چوارەم", Position = UDim2.new(0, 260, 0, 220), خەون = 4}
}

-- دوگمەی هیلکەکان دروست بکە
for i, هیلکە in ipairs(هیلکەکان) do
    local دوگمە = Instance.new("TextButton")
    دوگمە.Name = "Hilka_" .. i
    دوگمە.Size = UDim2.new(0, 210, 0, 100)
    دوگمە.Position = هیلکە.Position
    دوگمە.BackgroundColor3 = رەنگی_سبز
    دوگمە.TextColor3 = رەنگی_ڕەش
    دوگمە.TextSize = 16
    دوگمە.Text = هیلکە.ناو
    دوگمە.Font = Enum.Font.GothamBold
    دوگمە.BorderSizePixel = 2
    دوگمە.BorderColor3 = رەنگی_ڕەش
    دوگمە.Parent = screenGui
    
    -- هیلکە هیلا کردن
    دوگمە.MouseButton1Click:Connect(function()
        هیلکەی_هۆڵا = i
        
        -- رەنگی گۆڕین بۆ زهێرد
        for j, h in ipairs(هیلکەکان) do
            local d = screenGui:FindFirstChild("Hilka_" .. j)
            if j == i then
                d.BackgroundColor3 = رەنگی_زهێرد
            else
                d.BackgroundColor3 = رەنگی_سبز
            end
        end
        
        print("✅ " .. هیلکە.ناو .. " هیلا کرا!")
    end)
end

-- ══════════════════════════════════════════════════════
-- دوگمەی Go (سپی - کارەکتەرەکە ڕاق بێت)
-- ══════════════════════════════════════════════════════
local دوگمەی_Go = Instance.new("TextButton")
دوگمەی_Go.Name = "Go_Button"
دوگمەی_Go.Size = UDim2.new(0, 140, 0, 60)
دوگمەی_Go.Position = UDim2.new(0, 20, 0, 340)
دوگمەی_Go.BackgroundColor3 = رەنگی_سپی
دوگمەی_Go.TextColor3 = رەنگی_شین
دوگمەی_Go.TextSize = 20
دوگمەی_Go.Text = "🚀 Go"
دوگمەی_Go.Font = Enum.Font.GothamBold
دوگمەی_Go.BorderSizePixel = 2
دوگمەی_Go.BorderColor3 = رەنگی_ڕەش
دوگمەی_Go.Parent = screenGui

دوگمەی_Go.MouseButton1Click:Connect(function()
    کارەکتەر_ڕان = true
    دوگمەی_Go.BackgroundColor3 = رەنگی_زهێرد
    دوگمەی_Go.TextColor3 = رەنگی_ڕەش
    print("🚀 کارەکتەرەکە ڕاق بووەوە!")
end)

-- ══════════════════════════════════════════════════════
-- دوگمەی Stop (سور - بوەستێت)
-- ══════════════════════════════════════════════════════
local دوگمەی_Stop = Instance.new("TextButton")
دوگمەی_Stop.Name = "Stop_Button"
دوگمەی_Stop.Size = UDim2.new(0, 140, 0, 60)
دوگمەی_Stop.Position = UDim2.new(0, 180, 0, 340)
دوگمەی_Stop.BackgroundColor3 = رەنگی_سور
دوگمەی_Stop.TextColor3 = رەنگی_سپی
دوگمەی_Stop.TextSize = 20
دوگمەی_Stop.Text = "🛑 Stop"
دوگمەی_Stop.Font = Enum.Font.GothamBold
دوگمەی_Stop.BorderSizePixel = 2
دوگمەی_Stop.BorderColor3 = رەنگی_ڕەش
دوگمەی_Stop.Parent = screenGui

دوگمەی_Stop.MouseButton1Click:Connect(function()
    کارەکتەر_ڕان = false
    هیلکەی_هۆڵا = nil
    دوگمەی_Go.BackgroundColor3 = رەنگی_سپی
    دوگمەی_Go.TextColor3 = رەنگی_شین
    
    -- هیلکەکان رەنگیان بگێڕاوە سبز
    for j = 1, 4 do
        local d = screenGui:FindFirstChild("Hilka_" .. j)
        d.BackgroundColor3 = رەنگی_سبز
    end
    
    print("🛑 کارەکتەرەکە وەستا!")
end)

-- ══════════════════════════════════════════════════════
-- دوگمەی Close (× - داخستن)
-- ══════════════════════════════════════════════════════
local دوگمەی_Close = Instance.new("TextButton")
دوگمەی_Close.Name = "Close_Button"
دوگمەی_Close.Size = UDim2.new(0, 50, 0, 50)
دوگمەی_Close.Position = UDim2.new(0, 450, 0, 10)
دوگمەی_Close.BackgroundColor3 = رەنگی_سور
دوگمەی_Close.TextColor3 = رەنگی_سپی
دوگمەی_Close.TextSize = 32
دوگمەی_Close.Text = "×"
دوگمەی_Close.Font = Enum.Font.GothamBold
دوگمەی_Close.BorderSizePixel = 2
دوگمەی_Close.BorderColor3 = رەنگی_ڕەش
دوگمەی_Close.Parent = screenGui

دوگمەی_Close.MouseButton1Click:Connect(function()
    سکریپت_چالاک = false
    screenGui:Destroy()
    print("🔴 HAWZHIR HUB داخرا!")
end)

-- ══════════════════════════════════════════════════════
-- لۆجیکی جوڵاندن
-- ══════════════════════════════════════════════════════
local کارکردن = RunService.Heartbeat:Connect(function()
    if not سکریپت_چالاک then
        کارکردن:Disconnect()
        return
    end
    
    if کارەکتەر_ڕان and هیلکەی_هۆڵا then
        -- کارەکتەرەکە خوڵ بکە
        character = player.Character
        if character then
            humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart and character:FindFirstChild("Humanoid") then
                -- بۆ هیلکەکە خوڵ بکە
                local هیلکە = game.Workspace:FindFirstChild("Egg")
                if هیلکە then
                    character.Humanoid:MoveTo(هیلکە.Position)
                else
                    -- ئەگەر "Egg" نەبۆ، پڕۆکسیمە دەبێت
                    character.Humanoid:MoveTo(humanoidRootPart.Position + Vector3.new(50, 0, 0))
                end
            end
        end
    end
end)

-- ══════════════════════════════════════════════════════
-- کیبۆردی
-- ══════════════════════════════════════════════════════
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.G then
        دوگمەی_Go:TriggerEvent("MouseButton1Click")
    elseif input.KeyCode == Enum.KeyCode.S then
        دوگمەی_Stop:TriggerEvent("MouseButton1Click")
    elseif input.KeyCode == Enum.KeyCode.X then
        دوگمەی_Close:TriggerEvent("MouseButton1Click")
    end
end)

print("════════════════════════════════════════")
print("✅ HAWZHIR HUB بار بووەوە!")
print("════════════════════════════════════════")
print("🎮 دوگمەکان:")
print("  🚀 Go (G) - کارەکتەرەکە ڕاق بێت")
print("  🛑 Stop (S) - کارەکتەرەکە وەستێ")
print("  × Close (X) - داخستن")
print("════════════════════════════════════════")
